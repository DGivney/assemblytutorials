; Time
; Compile with: nasm -f elf time.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 time.o -o time
; Run with: ./time

%include        'functions.asm'

SECTION .data
msg        db      'Seconds since Jan 01 1970: ', 0h     ; a message string

SECTION .text
global  _start

_start:

    mov     eax, msg        ; move our message string into eax for printing
    call    sprint          ; call our string printing function

    mov     eax, 13         ; invoke SYS_TIME (kernel opcode 13)
    int     80h             ; call the kernel

    call    iprintLF        ; call our integer printing function with linefeed
    call    quit            ; call our quit function