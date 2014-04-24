
all: langCompiler langCompilerDebug

grammarParser:
	dmd -ofgrammarParser parserGenerator/grammarParser3.d parserGenerator/grammarNode.d parserGenerator/parserGenerator3.d

langParser.d: grammarParser lang.peg
	./grammarParser < lang.peg > langParser.d

langCompiler: langParser.d langCompiler.d
	dmd -oflangCompiler langCompiler.d langParser.d parserGenerator/grammarNode.d

langCompilerDebug: langParser.d langCompiler.d
	dmd -oflangCompilerDebug langCompiler.d langParser.d parserGenerator/grammarNode.d -debug=TRACE

realclean:
	-rm langParser.d
	-rm grammarParser
