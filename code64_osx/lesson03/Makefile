
FILE1 = helloworld-len

build: compile link

compile:
	nasm -f macho64 ${FILE1}.asm -o ${FILE1}.o

link:
	ld -lSystem ${FILE1}.o -o ${FILE1} 

clean:
	rm *.o; rm ${FILE1} 