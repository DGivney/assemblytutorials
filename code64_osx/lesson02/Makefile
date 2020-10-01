build: compile link

compile:
	nasm -f macho64 helloworld.asm -o helloworld.o

link:
	ld -lSystem helloworld.o -o helloworld

clean:
	rm *.o; rm helloworld