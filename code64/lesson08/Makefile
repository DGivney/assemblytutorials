FILE1 = helloworld-args

build: clean compile link

compile:
	nasm -f elf64 ${FILE1}.asm -o ${FILE1}.o

link:
	ld ${FILE1}.o -o ${FILE1} 

clean:
	rm -f *.o; rm -f ${FILE1}; rm -f peda-session-*.txt;
