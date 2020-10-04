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
msg1:			db				'Jumping to finished label.', 0x0
msg2:			db				'Inside subroutine number: ', 0x0
msg3:			db				'Inside subroutine "finished".', 0x0

          global    _start

          section   .text
_start:   
					mov				rax, msg1
					call			sprintLF
					jmp				.finished

.finished:
					mov				rax, msg2
					call			sprint
					mov				rax, 1
					call			iprintLF

subroutineTwo:
					mov				rax, msg1
					call			sprintLF
					jmp				.finished

.finished:
					mov				rax, msg2
					call			sprint
					mov				rax, 2
					call			iprintLF

					mov				rax, msg1
					call			sprintLF
					jmp				finished

finished:
					mov				rax, msg3
					call			sprintLF
					call			quit

