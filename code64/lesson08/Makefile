FILE1 = helloworld-args

build: compile link

compile:
	nasm -f elf64 ${FILE1}.asm -o ${FILE1}.o

link:
	ld ${FILE1}.o -o ${FILE1} 

clean:
	rm *.o; rm ${FILE1}; rm peda-session-*.txt;
