; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;     nasm -fmacho64 helloworld-len.asm && ld -lSystem helloworld-len.o -o helloworld-len && ./helloworld-len
; ----------------------------------------------------------------------------------------

	section	.data
msg:	db	"Hello, Brave New World!", 0x0a

	section	.text
	global _main 

_main:

	mov	rax, msg
	call	strlen

	mov	rdx, rax
	mov	rsi, msg
	mov	rdi, 1
	mov	rax, 0x02000004
	syscall

	mov rax, 0x02000001
	xor	rdi, rdi
	syscall

strlen:
	push	rbx
	mov	rbx, rax

nextchar:
	cmp	byte[rax], 0
	jz	finished
	inc	rax
	jmp	nextchar

finished:
	sub	rax, rbx
	pop rbx
	ret

