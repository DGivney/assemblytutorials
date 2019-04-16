; Open
; Compile with: nasm -f elf open.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 open.o -o open
; Run with: ./open

%include    'functions.asm'

SECTION .data
filename db 'readme.txt', 0h    ; the filename to create
contents db 'Hello world!', 0h  ; the contents to write

SECTION .text
global  _start

_start:

    mov     ecx, 0777           ; Create file from lesson 22
    mov     ebx, filename
    mov     eax, 8
    int     80h

    mov     edx, 12             ; Write contents to file from lesson 23
    mov     ecx, contents
    mov     ebx, eax
    mov     eax, 4
    int     80h

    mov     ecx, 0              ; flag for readonly access mode (O_RDONLY)
    mov     ebx, filename       ; filename we created above
    mov     eax, 5              ; invoke SYS_OPEN (kernel opcode 5)
    int     80h                 ; call the kernel

    call    iprintLF            ; call our integer printing function
    call    quit                ; call our quit function
