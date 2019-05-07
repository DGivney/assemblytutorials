; Socket
; Compile with: nasm -f elf socket.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 socket.o -o socket
; Run with: ./socket

%include    'functions.asm'

SECTION .text
global  _start

_start:

    xor     eax, eax            ; initialize some registers
    xor     ebx, ebx
    xor     edi, edi
    xor     esi, esi

_socket:

    push    byte 6              ; create socket from lesson 29
    push    byte 1
    push    byte 2
    mov     ecx, esp
    mov     ebx, 1
    mov     eax, 102
    int     80h

_bind:

    mov     edi, eax            ; bind socket from lesson 30
    push    dword 0x00000000
    push    word 0x2923
    push    word 2
    mov     ecx, esp
    push    byte 16
    push    ecx
    push    edi
    mov     ecx, esp
    mov     ebx, 2
    mov     eax, 102
    int     80h

_listen:

    push    byte 1              ; move 1 onto stack (max queue length argument)
    push    edi                 ; push the file descriptor onto stack
    mov     ecx, esp            ; move address of arguments into ecx
    mov     ebx, 4              ; invoke subroutine LISTEN (4)
    mov     eax, 102            ; invoke SYS_SOCKETCALL (kernel opcode 102)
    int     80h                 ; call the kernel

_exit:

    call    quit                ; call our quit function
