; Calculator (Division)
; Compile with: nasm -f elf calculator-division.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 calculator-division.o -o calculator-division
; Run with: ./calculator-division

%include        'functions.asm'

SECTION .data
msg1        db      ' remainder '      ; a message string to correctly output result

SECTION .text
global  _start

_start:

    mov     eax, 90     ; move our first number into eax
    mov     ebx, 9      ; move our second number into ebx
    div     ebx         ; divide eax by ebx
    call    iprint      ; call our integer print function on the quotient
    mov     eax, msg1   ; move our message string into eax
    call    sprint      ; call our string print function
    mov     eax, edx    ; move our remainder into eax
    call    iprintLF    ; call our integer printing with linefeed function

    call    quit