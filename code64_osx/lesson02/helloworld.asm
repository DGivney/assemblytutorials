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
	mov	rdx, len
	syscall

	mov rax, 0x02000001
	xor	rdi, rdi
	syscall

	section	.data
msg:	db	"Hello World!", 0x0a
len:	equ	$-msg

