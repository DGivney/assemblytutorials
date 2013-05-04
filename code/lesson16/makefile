FILENAME=calculator-atoi

all: cleanup
	nasm -f elf $(FILENAME).asm
	ld -m elf_i386 $(FILENAME).o -o $(FILENAME)
	./$(FILENAME) 20 1000 317

cleanup:
	rm -f $(FILENAME).o
	rm -f $(FILENAME)