; Hello World Program (Count to 10)
; Compile with: nasm -f elf helloworld-10.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-10.o -o helloworld-10
; Run with: ./helloworld-10

%include        'functions.asm'

SECTION .text
global  _start
    
_start: 

    mov     edi, 0
    
nextNumber:
    inc     edi
    
    mov     eax, edi
    add     eax, 48
    push    eax
    mov     eax, esp
    call    sprintLF
    
    pop     eax
    cmp     edi, 10
    jne     nextNumber
      
    call    quit