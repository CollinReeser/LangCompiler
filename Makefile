
all: langCompiler

grammarParser:
	dmd -ofgrammarParser parserGenerator/grammarParser3.d parserGenerator/grammarNode.d parserGenerator/parserGenerator3.d

langParser.d: grammarParser
	./grammarParser < lang.peg > langParser.d

langCompiler: langParser.d langCompiler.d
	dmd -oflangCompiler langCompiler.d langParser.d parserGenerator/grammarNode.d

realclean:
	-rm langParser.d
	-rm grammarParser
