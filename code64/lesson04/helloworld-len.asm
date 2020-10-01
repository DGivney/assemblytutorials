; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && ./a.out
; ----------------------------------------------------------------------------------------

          global    _start

          section   .text
_start:   
					mov     	rax, message
					call			strlen

					mov				rdx, rax
					mov				rsi, message
					mov				rdi, 1
					mov				rax, 1
					syscall

					mov				rax, 60
					xor				rdi, rdi
					syscall

strlen:
					push			rbx
					mov				rbx, rax

nextchar:
					cmp				byte[rax], 0
					jz				finished	
 					inc				rax		
					jmp				nextchar
 
finished:
					sub				rax, rbx
					pop				rbx
					ret

          section   .data
message:	db				"Hello Brave New World!", 0x0a

