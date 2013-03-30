; Hello World Program (Count to 10 itoa)
; Compile with: nasm -f elf helloworld-itoa.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-itoa.o -o helloworld-itoa
; Run with: ./helloworld-itoa

%include        'functions.asm'

SECTION .text
global  _start
    
_start: 

    mov     ecx, 0
    
nextNumber:
    inc     ecx
    mov     eax, ecx
    call    iprintLF        ; NOTE call our new integer printing function (itoa)
    cmp     ecx, 10
    jne     nextNumber
      
    call    quit