
all: langCompiler langCompilerDebug

grammarParser:
	dmd -ofgrammarParser parserGenerator/grammarParserMain.d parserGenerator/visitor.d parserGenerator/parserGeneratorMain.d

langParser.d: grammarParser lang.peg
	./grammarParser < lang.peg > langParser.d

langCompiler: langParser.d langCompiler.d
	dmd -oflangCompiler langCompiler.d langParser.d visitor.d

langCompilerDebug: langParser.d langCompiler.d
	dmd -oflangCompilerDebug langCompiler.d langParser.d visitor.d -debug=TRACE

realclean:
	-rm langParser.d
	-rm grammarParser
