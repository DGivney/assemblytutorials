; Hello World Program (Subroutines)
; Compile with: nasm -f elf helloworld-len.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-len.o -o helloworld-len
; Run with: ./helloworld-len

SECTION .data
msg     db      'Hello, brave new world!', 0AH

SECTION .text
global  _start
    
_start: 

    mov     eax, msg        ; move the address of our message string into EAX
    call    strlen          ; call our function to calculate the length of the string
    
    mov     edx, eax        ; our function leaves the result in EAX
    mov     ecx, msg        ; this is all the same as before
    mov     ebx, 1
    mov     eax, 4
    int     80h
    
    mov     ebx, 0      
    mov     eax, 1      
    int     80h

strlen:                     ; this is our first function declaration
    push    ebx             ; push the value in EBX onto the stack to preserve it while we use EBX in this function
    mov     ebx, eax        ; move the address in EAX into EBX (Both point to the same segment in memory)
    
nextchar:                   ; this is the same as lesson3
    cmp     byte [eax], 0   
    jz      finished        
    inc     eax             
    jmp     nextchar        
    
finished:
    sub     eax, ebx
    pop     ebx             ; pop the value on the stack back into EBX
    ret                     ; return to where the function was called