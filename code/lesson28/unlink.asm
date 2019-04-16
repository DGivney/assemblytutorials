; Unlink
; Compile with: nasm -f elf unlink.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 unlink.o -o unlink
; Run with: ./unlink

%include    'functions.asm'

SECTION .data
filename db 'readme.txt', 0h    ; the filename to delete

SECTION .text
global  _start

_start:

    mov     ebx, filename       ; filename we will delete
    mov     eax, 10             ; invoke SYS_UNLINK (kernel opcode 10)
    int     80h                 ; call the kernel

    call    quit                ; call our quit function
