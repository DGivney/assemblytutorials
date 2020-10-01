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

          section   .data
message1:	db				"Hello Brave New World!", 0x0a, 0x0
message2:	db				"This is how we recycle in NASM.", 0x0a, 0x0

          global    _start

          section   .text
_start:   
					mov     	rax, message1
					mov				rdi, message1
					call			sprintLF

					mov     	rax, message2
					mov				rdi, message2
					call			sprintLF

					call			quit

