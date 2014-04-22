
all: hailstone

hailstone.o: hailstone.asm
	nasm -f elf hailstone.asm

hailstone.asm: hailstone.lang
	../langCompiler < hailstone.lang > hailstone.asm

hailstone: hailstoneCall.c hailstone.o
	gcc -m32 -o hailstone hailstoneCall.c hailstone.o

