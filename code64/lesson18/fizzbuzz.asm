; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && ./a.out
;
; Register calling order for 64bit OSX/BSD/linux
;		RDI [ebx], RSI [ecx], RDX [edx], RCX [esi], R8 [edi], R9, [XYZ]MM0–7
; ----------------------------------------------------------------------------------------

%include	'functions.asm'

					section		.data
fizz			db				'Fizz', 0x0
buzz			db				'Buzz', 0x0

          global    _start

          section   .text
_start:   
					mov				r9, 0
					mov				r8, 0
					mov				rsi, 0

nextNumber:
					inc				rsi

.checkFizz:
					mov				rdx, 0
					mov				rax, rsi
					mov				rdi, 3
					div				rdi
					mov				r8, rdx
					cmp				r8, 0
					jne				.checkBuzz
					mov				rax, fizz
					call			sprint

.checkBuzz:
					mov				rdx, 0
					mov				rax, rsi
					mov				rdi, 5
					div				rdi
					mov				r9, rdx
					cmp				r9, 0
					jne				.checkInt
					mov				rax, buzz
					call			sprint

.checkInt:
					cmp				r8, 0
					je				.continue
					cmp				r9, 0
					je				.continue
					mov				rax, rsi
					call			iprint

.continue:
					mov				rax, 0xa
					push			rax
					mov				rax, rsp
					call			sprint
					pop				rax
					cmp				rsi, 15
					jne				nextNumber

					call			quit

