; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;     nasm -fmacho64 helloworld.asm && ld -lSystem helloworld.o -o helloworld && ./helloworld 
; ----------------------------------------------------------------------------------------

	global _main 

	section	.text
_main:
	mov	rax, 0x02000004
	mov	rdi, 1
	mov	rsi, msg
	mov	rdx, 0x100			; Use a length well past the leng of the message to see what is in memory
	syscall

	mov rax, 0x02000001
	xor	rdi, rdi
	syscall

	section	.data
msg:	db	"Hello World!"

