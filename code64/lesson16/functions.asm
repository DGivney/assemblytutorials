;------------------------------------------
; Register calling order
; RDI, RSI, RDX, RCX, R8, R9, [XYZ]MM0–7

;------------------------------------------
; int atoi(Integer number)
; Ascii to integer function (atoi)
atoi:
					push			rdi
					push			rsi
					push			rdx
					push			rcx
					mov				rcx, rax
					mov				rax, 0
					mov				rsi, 0

.multiplyLoop:
					xor				rdi, rdi
					mov				dil, [rcx+rsi]
					cmp				dil, 0x30 
					jl				.finished
					cmp				dil, 0x39 
					jg				.finished

					sub				dil, 0x30 
					add				rax, rdi
					mov				rdi, 10
					mul				rdi
					inc				rsi
					jmp				.multiplyLoop

.finished:
					cmp				rsi, 0
					je				.restore
					mov				rdi, 10
					div				rdi

.restore:
					pop				rcx	
					pop				rdx
					pop				rsi	
					pop				rdi
					ret


;------------------------------------------
; void iprint(Integer number)
; Integer printing function (itoa)
iprint:
					push			rax
					push			rsi
					push			rdx
					push			rcx
					mov				rsi, 0

divideLoop:
					inc				rsi
					mov				rdx, 0
					mov				rcx, 10
					idiv			rcx
					add				rdx, 0x30	
					push			rdx
					cmp				rax, 0
					jnz				divideLoop

printLoop:
					dec				rsi
					mov				rax, rsp
					call			sprint
					pop				rax
					cmp				rsi, 0
					jnz				printLoop

					pop				rcx
					pop				rdx
					pop				rsi
					pop				rax
					ret
	
					
;------------------------------------------
; void iprintLF(Integer number)
; Integer printing function with linefeed (itoa)
iprintLF:
					call			iprint
					
					push			rax
					mov				rax, 0xa
					push			rax
					mov				rax, rsp
					call			sprint
					pop				rax
					pop				rax
					ret


;------------------------------------------
; int slen(String message)
; String length calculation function
slen:
					push			rbx
					mov				rbx, rax
 
nextchar:
					cmp				byte [rax], 0
					jz				finished
					inc				rax
					jmp				nextchar
 
finished:
					sub				rax, rbx
					pop				rbx
					ret

 
;------------------------------------------
; void sprint(String message)
; String printing function
sprint:
					push			rdx
					push			rsi
					push			rdi
					push			rax

					call			slen

					mov				rdx, rax
					pop				rax

					mov				rsi, rax
					mov				rdi, 1
					mov				rax, 1
					syscall 

					pop				rdi
					pop				rsi
					pop				rdx
					ret


;------------------------------------------
; void sprintLF(String message)
; String printing with line feed function
sprintLF:
					call			sprint
					
					push			rax
					mov				rax, 0xa
					push			rax
					mov				rax, rsp
					call			sprint
					pop				rax
					pop				rax
					ret

;------------------------------------------
; void exit()
; Exit program and restore resources
quit:
					mov				rax, 60
					xor				rdi, rdi
					syscall 
					ret

