; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit macOS only.
; To assemble and run:
;
;     nasm -fmacho64 helloworld-len.asm && ld -lSystem helloworld-len.o -o helloworld-len && ./helloworld-len
;
; Register calling order for 64bit OSX/BSD/linux
;	RDI, RSI, RDX, RCX, R8, R9, [XYZ]MM0–7
; ----------------------------------------------------------------------------------------

%include	'functions.asm'

	section	.data
msg1:	db	"Hello, Brave New World!", 0x0a
msg2:	db	"This is how we recycle in NASM.", 0x0a

	section	.text
	global _main 

_main:

	mov	rax, msg1
	mov	rdi, msg1
	call	sprint

	mov	rax, msg2
	mov	rdi, msg2
	call	sprint

	call	quit

