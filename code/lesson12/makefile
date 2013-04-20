FILENAME=calculator-addition

all: cleanup
	nasm -f elf $(FILENAME).asm
	ld -m elf_i386 $(FILENAME).o -o $(FILENAME)
	./$(FILENAME)

cleanup:
	rm -f $(FILENAME).o
	rm -f $(FILENAME)