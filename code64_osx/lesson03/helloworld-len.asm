; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;     nasm -fmacho64 helloworld-len.asm && ld -lSystem helloworld-len.o -o helloworld-len && ./helloworld-len
; ----------------------------------------------------------------------------------------

	global _main 

	section	.text
_main:
	mov	rbx, msg
	mov	rax, rbx

nextchar:
	cmp	byte[rax], 0
	jz	finished
	inc	rax
	jmp	nextchar

finished:
	sub	rax, rbx

	mov	rdx, rax
	mov	rsi, msg
	mov	rdi, 1
	mov	rax, 0x02000004
	syscall

	mov rax, 0x02000001
	xor	rdi, rdi
	syscall

	section	.data
msg:	db	"Hello, Brave New World!", 0x0a

