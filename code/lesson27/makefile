FILENAME=seek

all: cleanup
	nasm -f elf $(FILENAME).asm
	ld -m elf_i386 $(FILENAME).o -o $(FILENAME)
	./$(FILENAME)

cleanup:
	echo "This file will be updated." > readme.txt
	rm -f $(FILENAME).o
	rm -f $(FILENAME)
