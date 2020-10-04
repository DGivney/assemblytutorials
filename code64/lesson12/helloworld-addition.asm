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

          global    _start

          section   .text
_start:   
					mov				rax, 90
					mov				rdi, 9
					add				rax, rdi
					call			iprintLF

					call			quit

