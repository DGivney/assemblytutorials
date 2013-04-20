; Calculator (Addition)
; Compile with: nasm -f elf calculator-addition.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 calculator-addition.o -o calculator-addition
; Run with: ./calculator-addition

%include        'functions.asm'

SECTION .text
global  _start

_start:

    mov     eax, 90     ; move our first number into eax
    mov     ebx, 9      ; move our second number into ebx
    add     eax, ebx    ; add ebx to eax
    call    iprintLF    ; call our integer print with linefeed function

    call    quit