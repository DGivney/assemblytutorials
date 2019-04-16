; Create
; Compile with: nasm -f elf create.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 create.o -o create
; Run with: ./create

%include    'functions.asm'

SECTION .data
filename db 'readme.txt',       ; the filename to create

SECTION .text
global  _start

_start:

    mov     ecx, 0777           ; set all permissions to read, write, execute
    mov     ebx, filename       ; filename we will create
    mov     eax, 8              ; invoke SYS_CREAT (kernel opcode 8)
    int     80h                 ; call the kernel

    call    quit                ; call our quit function
