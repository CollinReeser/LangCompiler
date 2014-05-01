
all: hailstone primes fibonacciIterative funcTest ifElseIfElse fibRecursive main callC

hailstone: hailstoneCall.c hailstone.lang
	../langCompiler < hailstone.lang > hailstone.asm
	nasm -f elf hailstone.asm
	gcc -m32 -o hailstone hailstoneCall.c hailstone.o

primes: primesCall.c primes.lang
	../langCompiler < primes.lang > primes.asm
	nasm -f elf primes.asm
	gcc -m32 -o primes primesCall.c primes.o

fibonacciIterative: fibonacciIterativeCall.c fibonacciIterative.lang
	../langCompiler < fibonacciIterative.lang > fibonacciIterative.asm
	nasm -f elf fibonacciIterative.asm
	gcc -m32 -o fibonacciIterative fibonacciIterativeCall.c fibonacciIterative.o

funcTest: funcTestCall.c funcTest.lang
	../langCompiler < funcTest.lang > funcTest.asm
	nasm -f elf funcTest.asm
	gcc -m32 -o funcTest funcTestCall.c funcTest.o

ifElseIfElse: ifElseIfElseCall.c ifElseIfElse.lang
	../langCompiler < ifElseIfElse.lang > ifElseIfElse.asm
	nasm -f elf ifElseIfElse.asm
	gcc -m32 -o ifElseIfElse ifElseIfElseCall.c ifElseIfElse.o

fibRecursive: fibRecursiveCall.c fibRecursive.lang
	../langCompiler < fibRecursive.lang > fibRecursive.asm
	nasm -f elf fibRecursive.asm
	gcc -m32 -o fibRecursive fibRecursiveCall.c fibRecursive.o

main: main.lang
	../langCompiler < main.lang > main.asm
	nasm -f elf main.asm
	gcc -m32 -o main main.o

callC: square.c callC.lang
	../langCompiler < callC.lang > callC.asm
	nasm -f elf callC.asm
	gcc -m32 -o callC callC.o square.c

realclean:
	-rm *.o
	-rm *.asm
	-rm hailstone
	-rm primes
	-rm fibonacciIterative
	-rm funcTest
	-rm ifElseIfElse
	-rm fibRecursive
	-rm main
	-rm callC
