
all: hailstone primes fibonacciIterative

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
