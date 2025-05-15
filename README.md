# CMSC313_hw11
Homework #11 Print out data in ascii hex

To compile:

nasm -f elf32 -g -F dwarf -o translateAscii.o translateAscii.asm

ld -m elf_i386 -o translateAscii translateAscii.o


To run:

./translateAscii

