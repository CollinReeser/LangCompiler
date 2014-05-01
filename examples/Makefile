
all: hailstone primes fibonacciIterative funcTest ifElseIfElse fibRecursive main callC

hailstone.o: hailstone.asm
	nasm -f elf hailstone.asm

hailstone.asm: hailstone.lang
	../langCompiler < hailstone.lang > hailstone.asm

hailstone: hailstoneCall.c hailstone.o
	gcc -m32 -o hailstone hailstoneCall.c hailstone.o

primes.o: primes.asm
	nasm -f elf primes.asm

primes.asm: primes.lang
	../langCompiler < primes.lang > primes.asm

primes: primes.o primesCall.c
	gcc -m32 -o primes primesCall.c primes.o

fibonacciIterative.o: fibonacciIterative.asm
	nasm -f elf fibonacciIterative.asm

fibonacciIterative.asm: fibonacciIterative.lang
	../langCompiler < fibonacciIterative.lang > fibonacciIterative.asm

fibonacciIterative: fibonacciIterative.o fibonacciIterativeCall.c
	gcc -m32 -o fibonacciIterative fibonacciIterativeCall.c fibonacciIterative.o

funcTest.o: funcTest.asm
	nasm -f elf funcTest.asm

funcTest.asm: funcTest.lang
	../langCompiler < funcTest.lang > funcTest.asm

funcTest: funcTest.o funcTestCall.c
	gcc -m32 -o funcTest funcTestCall.c funcTest.o

ifElseIfElse.o: ifElseIfElse.asm
	nasm -f elf ifElseIfElse.asm

ifElseIfElse.asm: ifElseIfElse.lang
	../langCompiler < ifElseIfElse.lang > ifElseIfElse.asm

ifElseIfElse: ifElseIfElse.o ifElseIfElseCall.c
	gcc -m32 -o ifElseIfElse ifElseIfElseCall.c ifElseIfElse.o

fibRecursive.o: fibRecursive.asm
	nasm -f elf fibRecursive.asm

fibRecursive.asm: fibRecursive.lang
	../langCompiler < fibRecursive.lang > fibRecursive.asm

fibRecursive: fibRecursive.o fibRecursiveCall.c
	gcc -m32 -o fibRecursive fibRecursiveCall.c fibRecursive.o

main.o: main.asm
	nasm -f elf main.asm

main.asm: main.lang
	../langCompiler < main.lang > main.asm

main: main.o
	gcc -m32 -o main main.o

callC.asm: callC.lang
	../langCompiler < callC.lang > callC.asm

callC.o: callC.asm
	nasm -f elf callC.asm

callC: square.c callC.o
	gcc -m32 -o callC callC.o square.c

realclean:
	-rm hailstone.o
	-rm hailstone.asm
	-rm hailstone
	-rm primes.o
	-rm primes.asm
	-rm primes
	-rm fibonacciIterative.o
	-rm fibonacciIterative.asm
	-rm fibonacciIterative
	-rm funcTest.o
	-rm funcTest.asm
	-rm funcTest
	-rm ifElseIfElse.o
	-rm ifElseIfElse.asm
	-rm ifElseIfElse
	-rm fibRecursive.o
	-rm fibRecursive.asm
	-rm fibRecursive
	-rm main.o
	-rm main.asm
	-rm main
	-rm callC.o
	-rm callC.asm
	-rm callC
