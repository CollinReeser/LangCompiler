import std.stdio;
import std.regex;
import std.string;
import std.array;
import std.algorithm;
import visitor;
void printTree(ASTNode node, string indent = "")
{
    if (cast(ASTNonTerminal)node)
    {
        writeln(indent, (cast(ASTNonTerminal)node).name);
        foreach (x; (cast(ASTNonTerminal)node).children)
        {
            printTree(x, indent ~ "  ");
        }
    }
    else if (cast(ASTTerminal)node)
    {
        writeln(indent, "[", (cast(ASTTerminal)node).token, "]: ",
            (cast(ASTTerminal)node).index);
    }
}
interface ASTNode
{
    void accept(Visitor v);
}
abstract class ASTNonTerminal : ASTNode
{
    ASTNode[] children;
    string name;
    void addChild(ASTNode node)
    {
        children ~= node;
    }
}
class ASTTerminal : ASTNode
{
    const string token;
    const uint index;
    this (string token, uint index)
    {
        this.token = token;
        this.index = index;
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ProgramNode : ASTNonTerminal
{
    this ()
    {
        this.name = "PROGRAM";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class FuncDefNode : ASTNonTerminal
{
    this ()
    {
        this.name = "FUNCDEF";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ArgListNode : ASTNonTerminal
{
    this ()
    {
        this.name = "ARGLIST";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class CommaArgNode : ASTNonTerminal
{
    this ()
    {
        this.name = "COMMAARG";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class BlockNode : ASTNonTerminal
{
    this ()
    {
        this.name = "BLOCK";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class StatementNode : ASTNonTerminal
{
    this ()
    {
        this.name = "STATEMENT";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class AssignmentNode : ASTNonTerminal
{
    this ()
    {
        this.name = "ASSIGNMENT";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class PassNode : ASTNonTerminal
{
    this ()
    {
        this.name = "PASS";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class IfblockNode : ASTNonTerminal
{
    this ()
    {
        this.name = "IFBLOCK";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ElseifblockNode : ASTNonTerminal
{
    this ()
    {
        this.name = "ELSEIFBLOCK";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ElseblockNode : ASTNonTerminal
{
    this ()
    {
        this.name = "ELSEBLOCK";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class WhileblockNode : ASTNonTerminal
{
    this ()
    {
        this.name = "WHILEBLOCK";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ParamListNode : ASTNonTerminal
{
    this ()
    {
        this.name = "PARAMLIST";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class CommaParamNode : ASTNonTerminal
{
    this ()
    {
        this.name = "COMMAPARAM";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class FuncCallNode : ASTNonTerminal
{
    this ()
    {
        this.name = "FUNCCALL";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ReturnStmtNode : ASTNonTerminal
{
    this ()
    {
        this.name = "RETURNSTMT";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class PrintNode : ASTNonTerminal
{
    this ()
    {
        this.name = "PRINT";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class SpawnNode : ASTNonTerminal
{
    this ()
    {
        this.name = "SPAWN";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ChanReadNode : ASTNonTerminal
{
    this ()
    {
        this.name = "CHANREAD";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ChanWriteNode : ASTNonTerminal
{
    this ()
    {
        this.name = "CHANWRITE";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class MakeChanNode : ASTNonTerminal
{
    this ()
    {
        this.name = "MAKECHAN";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class YieldNode : ASTNonTerminal
{
    this ()
    {
        this.name = "YIELD";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ExpressionNode : ASTNonTerminal
{
    this ()
    {
        this.name = "EXPRESSION";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class SumNode : ASTNonTerminal
{
    this ()
    {
        this.name = "SUM";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class SumOpProductNode : ASTNonTerminal
{
    this ()
    {
        this.name = "SUMOPPRODUCT";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ProductNode : ASTNonTerminal
{
    this ()
    {
        this.name = "PRODUCT";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class MulOpValueNode : ASTNonTerminal
{
    this ()
    {
        this.name = "MULOPVALUE";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ValueNode : ASTNonTerminal
{
    this ()
    {
        this.name = "VALUE";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class ParenExprNode : ASTNonTerminal
{
    this ()
    {
        this.name = "PARENEXPR";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class TerminatorNode : ASTNonTerminal
{
    this ()
    {
        this.name = "TERMINATOR";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class SumOpNode : ASTNonTerminal
{
    this ()
    {
        this.name = "SUMOP";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class MulOpNode : ASTNonTerminal
{
    this ()
    {
        this.name = "MULOP";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class NumNode : ASTNonTerminal
{
    this ()
    {
        this.name = "NUM";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class IdentifierNode : ASTNonTerminal
{
    this ()
    {
        this.name = "IDENTIFIER";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class LogicExprNode : ASTNonTerminal
{
    this ()
    {
        this.name = "LOGICEXPR";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class LogicOpLogicRelationshipNode : ASTNonTerminal
{
    this ()
    {
        this.name = "LOGICOPLOGICRELATIONSHIP";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class LogicRelationshipNode : ASTNonTerminal
{
    this ()
    {
        this.name = "LOGICRELATIONSHIP";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class RelationOpExpressionNode : ASTNonTerminal
{
    this ()
    {
        this.name = "RELATIONOPEXPRESSION";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class LogicOpNode : ASTNonTerminal
{
    this ()
    {
        this.name = "LOGICOP";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class RelationOpNode : ASTNonTerminal
{
    this ()
    {
        this.name = "RELATIONOP";
    }
    void accept(Visitor v)
    {
        v.visit(this);
    }
}
class Parser
{
    this (string source)
    {
        this.source = source;
        this.index = 0;
        debug(TRACE) this.traceIndent = "";
    }
    ASTNode parse()
    {
        consumeWhitespace();
        ASTNode topNode = null;
        if (program())
        {
            topNode = stack[$-1];
        }
        index = 0;
        stack = [];
        return topNode;
    }
private:
    string source;
    uint index;
    ASTNode[] stack;
    struct ParenResult
    {
        uint collectedNodes;
        bool isSuccess;
        this (uint collectedNodes, bool isSuccess)
        {
            this.collectedNodes = collectedNodes;
            this.isSuccess = isSuccess;
        }
    }
    debug (TRACE)
    {
        string traceIndent;
        enum tracer =
            `
            string funcName = __FUNCTION__;
            funcName =
                funcName[__MODULE__.length + typeof(this).stringof.length + 2..$];
            writeln(traceIndent, "Entered: ", funcName, ", Index: ", index);
            traceIndent ~= "  ";
            scope(exit)
            {
                traceIndent = traceIndent[0..$-2];
                writeln(traceIndent, "Exiting: ", funcName, ", Index: ", index);
            }
            `;
    }
    bool program()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (funcDef())
        {
            collectedNodes++;
            while (funcDef())
            {
                collectedNodes++;
            }
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ProgramNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool funcDef()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool funcDefLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^func`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (funcDefLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (argList())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (block())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new FuncDefNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool argList()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool argListLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\(`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool argListLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (argListLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        while (commaArg())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        if (argListLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ArgListNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool commaArg()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool commaArgLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^,`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (commaArgLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new CommaArgNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool block()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool blockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\{`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool blockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\}`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (blockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (statement())
        {
            collectedNodes++;
        }
        if (blockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new BlockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool statement()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (assignment())
        {
            collectedNodes++;
        }
        else if (ifblock())
        {
            collectedNodes++;
        }
        else if (whileblock())
        {
            collectedNodes++;
        }
        else if (pass())
        {
            collectedNodes++;
        }
        else if (block())
        {
            collectedNodes++;
        }
        else if (print())
        {
            collectedNodes++;
        }
        else if (yield())
        {
            collectedNodes++;
        }
        else if (returnStmt())
        {
            collectedNodes++;
        }
        else if (spawn())
        {
            collectedNodes++;
        }
        else if (chanRead())
        {
            collectedNodes++;
        }
        else if (chanWrite())
        {
            collectedNodes++;
        }
        else if (makeChan())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new StatementNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool assignment()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool assignmentLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^=`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (assignmentLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new AssignmentNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool pass()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool passLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^pass`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (passLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new PassNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool ifblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool ifblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^if`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool ifblockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\(`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool ifblockLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (ifblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (ifblockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (ifblockLiteral_3())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (elseifblock())
        {
            collectedNodes++;
        }
        if (elseblock())
        {
            collectedNodes++;
        }
        auto nonTerminal = new IfblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool elseifblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool elseifblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^else`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool elseifblockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^if`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool elseifblockLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\(`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool elseifblockLiteral_4()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (elseifblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (elseifblockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (elseifblockLiteral_3())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (elseifblockLiteral_4())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ElseifblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool elseblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool elseblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^else`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (elseblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ElseblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool whileblock()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool whileblockLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^while`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool whileblockLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\(`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool whileblockLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (whileblockLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (whileblockLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (whileblockLiteral_3())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (statement())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new WhileblockNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool paramList()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool paramListLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\(`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool paramListLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (paramListLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        while (commaParam())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        if (paramListLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ParamListNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool commaParam()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool commaParamLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^,`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (commaParamLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new CommaParamNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool funcCall()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (paramList())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new FuncCallNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool returnStmt()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool returnStmtLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^return`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (returnStmtLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ReturnStmtNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool print()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool printLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^print`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (printLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new PrintNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool spawn()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool spawnLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^spawn`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (spawnLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (funcCall())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new SpawnNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool chanRead()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool chanReadLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^<-`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (chanReadLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ChanReadNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool chanWrite()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool chanWriteLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^->`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (chanWriteLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ChanWriteNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool makeChan()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool makeChanLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^makechan`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (makeChanLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new MakeChanNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool yield()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool yieldLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^yield`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (yieldLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (terminator())
        {
            stack = stack[0..$-1];
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new YieldNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool expression()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (sum())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ExpressionNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool sum()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (product())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (sumOpProduct())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new SumNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool sumOpProduct()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (sumOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (product())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new SumOpProductNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool product()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (value())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (mulOpValue())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new ProductNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool mulOpValue()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (mulOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (value())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new MulOpValueNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool value()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (funcCall())
        {
            collectedNodes++;
        }
        else if (num())
        {
            collectedNodes++;
        }
        else if (parenExpr())
        {
            collectedNodes++;
        }
        else if (identifier())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ValueNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool parenExpr()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool parenExprLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\(`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool parenExprLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\)`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (parenExprLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicExpr())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (parenExprLiteral_2())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new ParenExprNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool terminator()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool terminatorLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^;`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                index += mat.captures[0].length;
                consumeWhitespace();
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (terminatorLiteral_1())
        {
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new TerminatorNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool sumOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool sumOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^[+-]`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (sumOpLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new SumOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool mulOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool mulOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^[*\/%]`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (mulOpLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new MulOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool num()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool numLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^[0-9]+(?:\.[0-9]*)?`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (numLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new NumNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool identifier()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool identifierLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^[a-zA-Z_][a-zA-Z0-9_]*`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (identifierLiteral_1())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new IdentifierNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicExpr()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (logicRelationship())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        while (logicOpLogicRelationship())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new LogicExprNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicOpLogicRelationship()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (logicOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (logicRelationship())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new LogicOpLogicRelationshipNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicRelationship()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (relationOpExpression())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        auto nonTerminal = new LogicRelationshipNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool relationOpExpression()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        uint collectedNodes = 0;
        if (relationOp())
        {
            auto tempNode = cast(ASTNonTerminal)(stack[$-1]);
            stack = stack[0..$-1];
            foreach (child; tempNode.children)
            {
                stack ~= child;
            }
            collectedNodes += tempNode.children.length;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        if (expression())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new RelationOpExpressionNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool logicOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool logicOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^&&`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool logicOpLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^\|\|`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (logicOpLiteral_1())
        {
            collectedNodes++;
        }
        else if (logicOpLiteral_2())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new LogicOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    bool relationOp()
    {
        debug (TRACE) mixin(tracer);
        uint saveIndex = index;
        bool relationOpLiteral_1()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^<=`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_2()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^>=`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_3()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^<`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_4()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^>`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_5()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^==`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        bool relationOpLiteral_6()
        {
            debug (TRACE) mixin(tracer);
            auto reg = ctRegex!(`^!=`);
            auto mat = match(source[index..$], reg);
            if (mat)
            {
                debug (TRACE) writeln(traceIndent, "  Match: [", mat.captures[0], "]");
                auto terminal = new ASTTerminal(mat.captures[0], index);
                index += mat.captures[0].length;
                consumeWhitespace();
                stack ~= terminal;
            }
            else
            {
                debug (TRACE) writeln(traceIndent, "  No match.");
                return false;
            }
            return true;
        }
        uint collectedNodes = 0;
        if (relationOpLiteral_1())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_2())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_3())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_4())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_5())
        {
            collectedNodes++;
        }
        else if (relationOpLiteral_6())
        {
            collectedNodes++;
        }
        else
        {
            stack = stack[0..$-collectedNodes];
            index = saveIndex;
            return false;
        }
        auto nonTerminal = new RelationOpNode();
        foreach (node; stack[$-collectedNodes..$])
        {
            nonTerminal.addChild(node);
        }
        stack = stack[0..$-collectedNodes];
        stack ~= nonTerminal;
        return true;
    }
    void consumeWhitespace()
    {
        auto whitespaceRegex = ctRegex!(`^\s*`);
        auto whitespaceMatch = match(source[index..$], whitespaceRegex);
        if (whitespaceMatch)
        {
            index += whitespaceMatch.captures[0].length;
        }
    }
    void printStack(string indent = "")
    {
        foreach_reverse (x; stack)
        {
            if (cast(ASTNonTerminal)x !is null)
            {
                x.printTree(indent);
            }
            else if (cast(ASTTerminal)x !is null)
            {
                writeln("[", (cast(ASTTerminal)x).token, "]: ", (cast(ASTTerminal)x).index);
            }
        }
    }
}

