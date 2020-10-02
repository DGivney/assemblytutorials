; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && ./a.out
;
; Register calling order for 64bit OSX/BSD/linux
;		RDI, RSI, RDX, RCX, R8, R9, [XYZ]MM0–7
; ----------------------------------------------------------------------------------------

%include	'functions.asm'

					section		.data
msg1:			db				'Please enter your name: ', 0x0
msg2:			db				'Hello, ', 0x0

					section		.bss
sinput:		resb			0xff

          global    _start

          section   .text
_start:   
				  mov				rax, msg1
					call			sprint

					mov				rdx, 255
					mov				rsi, sinput
					mov				rdi, 0
					mov				rax, 0
					syscall

					mov				rax, msg2
					call			sprint

					mov				rax, sinput
					call			sprint

					call			quit	

