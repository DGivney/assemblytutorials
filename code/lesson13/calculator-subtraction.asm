; Calculator (Subtraction)
; Compile with: nasm -f elf calculator-subtraction.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 calculator-subtraction.o -o calculator-subtraction
; Run with: ./calculator-subtraction

%include        'functions.asm'

SECTION .text
global  _start

_start:

    mov     eax, 90     ; move our first number into eax
    mov     ebx, 9      ; move our second number into ebx
    sub     eax, ebx    ; subtract ebx from eax
    call    iprintLF    ; call our integer print with linefeed function

    call    quit