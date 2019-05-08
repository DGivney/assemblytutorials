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

    mov     edi, eax            ; move return value of SYS_SOCKETCALL into edi (file descriptor for new socket, or -1 on error)
    push    dword 0x00000000    ; push 0 dec onto the stack IP ADDRESS (0.0.0.0)
    push    word 0x2923         ; push 9001 dec onto stack PORT (reverse byte order)
    push    word 2              ; push 2 dec onto stack AF_INET
    mov     ecx, esp            ; move address of stack pointer into ecx
    push    byte 16             ; push 16 dec onto stack (arguments length)
    push    ecx                 ; push the address of arguments onto stack
    push    edi                 ; push the file descriptor onto stack
    mov     ecx, esp            ; move address of arguments into ecx
    mov     ebx, 2              ; invoke subroutine BIND (2)
    mov     eax, 102            ; invoke SYS_SOCKETCALL (kernel opcode 102)
    int     80h                 ; call the kernel

_exit:

    call    quit                ; call our quit function
