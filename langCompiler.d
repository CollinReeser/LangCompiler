import std.stdio;
import std.conv;
import std.string;
import std.array;
import std.string;
import std.c.stdlib;
import visitor;
import langParser;

class LangCompiler
{
    this (ASTNode topNode)
    {
        this.topNode = topNode;
    }

    string generate()
    {
        compile(topNode);
        collect();
        return genCode;
    }

private:

    ASTNode topNode;
    string genCode;
    string[string] dataSection;
    FunctionComponents curFunc;
    FunctionComponents[] funcs;

    class FunctionComponents
    {
        string func;
        string funcBody;
        string funcName;
        string[] argList;
        string[] varList;

        this (string funcName)
        {
            this.funcName = funcName;
        }

        void compileFunc()
        {
            func = "";
            func ~= "    global " ~ funcName ~ "\n";
            func ~= funcName ~ ":\n";
            func ~= "    push   ebp         ; set up stack frame\n";
            func ~= "    mov    ebp, esp\n";
            // Allocate space on stack for args
            func ~= "    sub    esp, " ~ (varList.length * 4).to!string ~ "\n";

            func ~= funcBody;

            func ~= "    mov    esp, ebp    ; takedown stack frame\n";
            func ~= "    pop    ebp\n";
            func ~= "    ret\n";
        }

        void collectVariableLists(ASTNode funcNode)
        {
            auto node = cast(ASTNonTerminal)funcNode;
            if (node is null)
            {
                return;
            }
            if (node.name == "ASSIGNMENT")
            {
                auto ident = (cast(ASTTerminal)node.children[0]).token;
                auto accountedFor = false;
                foreach (arg; argList)
                {
                    if (ident == arg)
                    {
                        accountedFor = true;
                        break;
                    }
                }
                foreach (arg; varList)
                {
                    if (ident == arg)
                    {
                        accountedFor = true;
                        break;
                    }
                }
                if (!accountedFor)
                {
                    varList ~= ident;
                }
            }
            else
            {
                foreach (child; node.children)
                {
                    collectVariableLists(child);
                }
            }
        }
    }

    void compile(ASTNode execNode)
    {
        // Cast the general ASTNode to a non-terminal node to actually work
        // with
        auto node = cast(ASTNonTerminal)execNode;
        switch (node.name)
        {
        case "PROGRAM":
            foreach (child; node.children)
            {
                compile(child);
            }
            break;
        case "FUNCDEF":
            auto funcName = (cast(ASTTerminal)node.children[0]).token;
            curFunc = new FunctionComponents(funcName);
            curFunc.collectVariableLists(node.children[2]);
            auto argList = cast(ASTNonTerminal)node.children[1];
            foreach (arg; argList.children)
            {
                curFunc.argList ~= (cast(ASTTerminal)arg).token;
            }
            compile(node.children[2]);
            funcs ~= curFunc;
            break;
        case "BLOCK":
            foreach (child; node.children)
            {
                compile(child);
            }
            break;
        case "STATEMENT":
            compile(node.children[0]);
            break;
        case "PRINT":
            auto var = (cast(ASTTerminal)node.children[0]).token;
            string varLoc = getVarLoc(var);
            if (var !in dataSection)
            {
                dataSection[var] = var ~ `Print: db "[` ~ var ~ `]: %d", 10, 0` ~ "\n";
            }
            curFunc.funcBody ~= "    mov    eax, " ~ varLoc ~ "\n";
            curFunc.funcBody ~= "    push   eax\n";
            curFunc.funcBody ~= "    push   " ~ var ~ "Print\n";
            curFunc.funcBody ~= "    call   printf\n";
            curFunc.funcBody ~= "    add    esp, 8\n";
            break;
        case "ASSIGNMENT":
            auto identifier = (cast(ASTTerminal)node.children[0]).token;
            curFunc.funcBody ~= "    ; Assignment of var: " ~ identifier ~ "\n";
            auto exists = false;
            compile(node.children[1]);
            auto varLoc = getVarLoc(identifier);
            curFunc.funcBody ~= "    pop    eax\n";
            curFunc.funcBody ~= "    mov    " ~ varLoc ~ ", eax\n";
            break;
        case "WHILEBLOCK":
            static whileInstStatic = 0;
            auto whileInst = whileInstStatic;
            whileInstStatic++;
            curFunc.funcBody ~= "    jmp    .whileCond_" ~ whileInst.to!string ~ "\n";
            curFunc.funcBody ~= ".while_" ~ whileInst.to!string ~ ":\n";
            compile(node.children[1]);
            curFunc.funcBody ~= ".whileCond_" ~ whileInst.to!string ~ ":\n";
            compile(node.children[0]);
            curFunc.funcBody ~= "    ; Checking while-expression trueness\n";
            curFunc.funcBody ~= "    pop    eax\n";
            curFunc.funcBody ~= "    test   eax, eax\n";
            curFunc.funcBody ~= "    jne     .while_" ~ whileInst.to!string ~ "\n";
            break;
        case "IFBLOCK":
            static ifInstStatic = 0;
            auto ifInst = ifInstStatic;
            ifInstStatic++;
            auto elseIfInst = 0;
            curFunc.funcBody ~= ".if_" ~ ifInst.to!string ~ ":\n";
            curFunc.funcBody ~= "    ; if\n";
            compile(node.children[0]);
            curFunc.funcBody ~= "    ; Checking if-expression trueness\n";
            curFunc.funcBody ~= "    pop    eax\n";
            curFunc.funcBody ~= "    test   eax, eax\n";
            curFunc.funcBody ~= "    je    .if_" ~ ifInst.to!string ~ "Else_" ~ elseIfInst.to!string ~ "\n";
            // Compile if contents
            compile(node.children[1]);
            // Jump to end of if/else if/else block
            curFunc.funcBody ~= "    jmp    .if_" ~ ifInst.to!string ~ "End\n";
            // Else if/else blocks
            foreach (child; node.children[2..$])
            {
                auto elseNode = cast(ASTNonTerminal)child;
                auto nodeType = elseNode.name;
                final switch (nodeType)
                {
                case "ELSEIFBLOCK":
                    curFunc.funcBody ~= ".if_" ~ ifInst.to!string ~ "Else_" ~ elseIfInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    ; else if\n";
                    // Compile else if conditional
                    compile(elseNode.children[0]);
                    curFunc.funcBody ~= "    ; Checking else-if-expression trueness\n";
                    curFunc.funcBody ~= "    pop    eax\n";
                    curFunc.funcBody ~= "    test   eax, eax\n";
                    curFunc.funcBody ~= "    je    .if_" ~ ifInst.to!string ~ "Else_" ~ (elseIfInst+1).to!string ~ "\n";
                    elseIfInst++;
                    // Compile else if statement
                    compile(elseNode.children[1]);
                    // Jump to end of if/else if/else block
                    curFunc.funcBody ~= "    jmp    .if_" ~ ifInst.to!string ~ "End\n";
                    break;
                case "ELSEBLOCK":
                    curFunc.funcBody ~= ".if_" ~ ifInst.to!string ~ "Else_" ~ elseIfInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    ; else\n";
                    // Compile else statement
                    compile(elseNode.children[0]);
                    break;
                }
            }
            curFunc.funcBody ~= ".if_" ~ ifInst.to!string ~ "End:\n";
            break;
        case "EXPRESSION":
            compile(node.children[0]);
            break;
        case "SUM":
            compile(node.children[0]);
            for (int i = 1; i < node.children.length; i += 2)
            {
                compile(node.children[i+1]);
                // The arguments to this operation will be the top two
                // stack values
                auto op = (cast(ASTTerminal)node.children[i]).token;
                curFunc.funcBody ~= "    ; Calculating sum/sub: " ~ op ~ "\n";
                curFunc.funcBody ~= "    mov    eax, [esp+4]\n";
                curFunc.funcBody ~= "    mov    ebx, [esp]\n";
                curFunc.funcBody ~= "    add    esp, 8\n";
                final switch (op)
                {
                case "+":
                    curFunc.funcBody ~= "    add    eax, ebx\n";
                    curFunc.funcBody ~= "    push   eax\n";
                    break;
                case "-":
                    curFunc.funcBody ~= "    sub    eax, ebx\n";
                    curFunc.funcBody ~= "    push   eax\n";
                    break;
                }
            }
            break;
        case "PRODUCT":
            compile(node.children[0]);
            for (int i = 1; i < node.children.length; i += 2)
            {
                compile(node.children[i+1]);
                // The arguments to this operation will be the top two
                // stack values
                auto op = (cast(ASTTerminal)node.children[i]).token;
                debug (DEBUG) writeln("PRODUCT:", op);
                curFunc.funcBody ~= "    ; Calculating prod/div: " ~ op ~ "\n";
                curFunc.funcBody ~= "    mov    eax, [esp+4]\n";
                curFunc.funcBody ~= "    mov    ebx, [esp]\n";
                curFunc.funcBody ~= "    add    esp, 8\n";
                final switch (op)
                {
                case "*":
                    curFunc.funcBody ~= "    imul   eax, ebx\n";
                    curFunc.funcBody ~= "    push   eax\n";
                    break;
                case "/":
                    curFunc.funcBody ~= "    mov    edx, 0\n";
                    curFunc.funcBody ~= "    div    ebx\n";
                    //curFunc.funcBody ~= "    shl    eax, 16\n";
                    //curFunc.funcBody ~= "    shr    eax, 16\n";
                    curFunc.funcBody ~= "    push   eax\n";
                    break;
                case "%":
                    curFunc.funcBody ~= "    mov    edx, 0\n";
                    curFunc.funcBody ~= "    div    ebx\n";
                    //curFunc.funcBody ~= "    shl    edx, 16\n";
                    //curFunc.funcBody ~= "    shr    edx, 16\n";
                    curFunc.funcBody ~= "    push   edx\n";
                    break;
                }
            }
            break;
        case "VALUE":
            compile(node.children[0]);
            break;
        case "NUM":
            auto num = (cast(ASTTerminal)node.children[0]).token.dup;
            num = (cast(int)num.to!double).to!string;
            curFunc.funcBody ~= "    ; Using literal for expression: " ~ num ~ "\n";
            curFunc.funcBody ~= "    push   dword " ~ num ~ "\n";
            break;
        case "IDENTIFIER":
            auto identifier = (cast(ASTTerminal)node.children[0]).token;
            curFunc.funcBody ~= "    ; Using var for expression: " ~ identifier ~ "\n";
            auto varLoc = getVarLoc(identifier);
            curFunc.funcBody ~= "    mov    eax, " ~ varLoc ~ "\n";
            curFunc.funcBody ~= "    push   eax\n";
            break;
        case "PARENEXPR":
            compile(node.children[0]);
            break;
        case "LOGICEXPR":
            static logicInst = 0;
            compile(node.children[0]);
            for (int i = 1; i < node.children.length; i += 2)
            {
                compile(node.children[i+1]);
                auto op = (cast(ASTTerminal)node.children[i]).token;
                curFunc.funcBody ~= "    ; Logic expression: " ~ op ~ "\n";
                curFunc.funcBody ~= "    mov    eax, [esp+4]\n";
                curFunc.funcBody ~= "    mov    ebx, [esp]\n";
                curFunc.funcBody ~= "    add    esp, 8\n";
                final switch (op)
                {
                case "&&":
                    curFunc.funcBody ~= "    test   eax, eax\n";
                    curFunc.funcBody ~= "    je     .AND_wrong_" ~ logicInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    test   ebx, ebx\n";
                    curFunc.funcBody ~= "    je     .AND_wrong_" ~ logicInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= "    jmp    .AND_end_" ~ logicInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".AND_wrong_" ~ logicInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= ".AND_end_" ~ logicInst.to!string ~ ":\n";
                    break;
                case "||":
                    curFunc.funcBody ~= "    test   eax, eax\n";
                    curFunc.funcBody ~= "    jne    .OR_right_" ~ logicInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    test   ebx, ebx\n";
                    curFunc.funcBody ~= "    jne    .OR_right_" ~ logicInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= "    jmp    .OR_end_" ~ logicInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".OR_right_" ~ logicInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= ".OR_end_" ~ logicInst.to!string ~ ":\n";
                    break;
                }
            }
            logicInst++;
            break;
        case "LOGICRELATIONSHIP":
            static logicRelInst = 0;
            compile(node.children[0]);
            for (int i = 1; i < node.children.length; i += 2)
            {
                compile(node.children[i+1]);
                auto op = (cast(ASTTerminal)node.children[i]).token;
                curFunc.funcBody ~= "    ; Logic comparison: " ~ op ~ "\n";
                curFunc.funcBody ~= "    mov    eax, [esp+4]\n";
                curFunc.funcBody ~= "    mov    ebx, [esp]\n";
                curFunc.funcBody ~= "    add    esp, 8\n";
                final switch (op)
                {
                case "<":
                    curFunc.funcBody ~= "    cmp    eax, ebx\n";
                    curFunc.funcBody ~= "    jge    .OP_fail_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= "    jmp    .OP_end_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".OP_fail_" ~ logicRelInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= ".OP_end_" ~ logicRelInst.to!string ~ ":\n";
                    break;
                case ">":
                    curFunc.funcBody ~= "    cmp    eax, ebx\n";
                    curFunc.funcBody ~= "    jle    .OP_fail_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= "    jmp    .OP_end_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".OP_fail_" ~ logicRelInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= ".OP_end_" ~ logicRelInst.to!string ~ ":\n";
                    break;
                case "<=":
                    curFunc.funcBody ~= "    cmp    eax, ebx\n";
                    curFunc.funcBody ~= "    jg     .OP_fail_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= "    jmp    .OP_end_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".OP_fail_" ~ logicRelInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= ".OP_end_" ~ logicRelInst.to!string ~ ":\n";
                    break;
                case ">=":
                    curFunc.funcBody ~= "    cmp    eax, ebx\n";
                    curFunc.funcBody ~= "    jl     .OP_fail_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= "    jmp    .OP_end_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".OP_fail_" ~ logicRelInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= ".OP_end_" ~ logicRelInst.to!string ~ ":\n";
                    break;
                case "==":
                    curFunc.funcBody ~= "    cmp    eax, ebx\n";
                    curFunc.funcBody ~= "    jne    .OP_fail_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= "    jmp    .OP_end_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".OP_fail_" ~ logicRelInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= ".OP_end_" ~ logicRelInst.to!string ~ ":\n";
                    break;
                case "!=":
                    curFunc.funcBody ~= "    cmp    eax, ebx\n";
                    curFunc.funcBody ~= "    je     .OP_fail_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= "    push   dword 1\n";
                    curFunc.funcBody ~= "    jmp    .OP_end_" ~ logicRelInst.to!string ~ "\n";
                    curFunc.funcBody ~= ".OP_fail_" ~ logicRelInst.to!string ~ ":\n";
                    curFunc.funcBody ~= "    push   dword 0\n";
                    curFunc.funcBody ~= ".OP_end_" ~ logicRelInst.to!string ~ ":\n";
                    break;
                }
            }
            logicRelInst++;
            break;
        case "PARAMLIST":
            // Reverse because the calling convention for C is the leftmost
            // argument to a func call is pushed last to the stack
            foreach_reverse (expr; node.children)
            {
                compile(expr);
            }
            break;
        case "FUNCCALL":
            auto funcToCall = (cast(ASTTerminal)node.children[0]).token;
            auto numParams = (cast(ASTNonTerminal)node.children[1]).children.length;
            // Parameter list
            compile(node.children[1]);
            // All params should be on the stack now
            curFunc.funcBody ~= "    call   " ~ funcToCall ~ "\n";
            // Cleanup params on stack
            curFunc.funcBody ~= "    add    esp, " ~ (numParams * 4).to!string ~ "\n";
            // Push result of function to stack. Result in eax
            curFunc.funcBody ~= "    push   eax\n";
            break;
        case "RETURNSTMT":
            // Compile expression node
            compile(node.children[0]);
            // Get return value
            curFunc.funcBody ~= "    pop    eax\n";
            // Return!
            curFunc.funcBody ~= "    mov    esp, ebp    ; takedown stack frame\n";
            curFunc.funcBody ~= "    pop    ebp\n";
            curFunc.funcBody ~= "    ret\n";
            break;
        case "YIELD":
            break;
        default:
            writeln("No handler for ", node.name);
        }
    }

    void collect()
    {
        genCode = "";
        genCode ~= "    extern printf\n";
        genCode ~= "    SECTION .data\n";
        foreach (seg; dataSection.byKey())
        {
            genCode ~= dataSection[seg];
        }
        genCode ~= "    SECTION .text\n";
        foreach (func; funcs)
        {
            func.compileFunc();
            genCode ~= func.func;
        }
    }

    string getVarLoc(string var)
    {
        auto i = 0;
        string stackLocation = "";
        enum VarLoc {UNKNOWN, ARGUMENT, STACK}
        VarLoc varLoc = VarLoc.UNKNOWN;
        foreach (arg; curFunc.argList)
        {
            if (var == arg)
            {
                varLoc = VarLoc.ARGUMENT;
                break;
            }
            i++;
        }
        if (i >= curFunc.argList.length)
        {
            i = 0;
            foreach (arg; curFunc.varList)
            {
                if (var == arg)
                {
                    varLoc = VarLoc.STACK;
                    break;
                }
                i++;
            }
            if (i >= curFunc.varList.length)
            {
                writeln("Comp error, unknown var: ", var);
                exit(-1);
            }
        }
        if (varLoc == VarLoc.ARGUMENT)
        {
            auto offset = 8 + i * 4;
            stackLocation = "[ebp + " ~ offset.to!string ~ "]";
        }
        else if (varLoc == VarLoc.STACK)
        {
            auto offset = 4 + i * 4;
            stackLocation = "[ebp - " ~ offset.to!string ~ "]";
        }
        else
        {
            writeln("Comp error, unknown location for var: ", var);
            exit(-1);
        }
        return stackLocation;
    }
}

int main(string[] argv)
{
    string line = "";
    string source = "";
    while ((line = stdin.readln) !is null)
    {
        source ~= line;
    }
    auto parser = new Parser(source);
    auto topNode = parser.parse();
    if (topNode !is null)
    {
        auto printVisitor = new PrintVisitor();
        printVisitor.visit(cast(ProgramNode)topNode);
        //auto context = new LangCompiler(topNode);
        //auto code = context.generate();
        //writeln(code);
    }
    else
    {
        writeln("Failed to parse!");
    }
    return 0;
}
