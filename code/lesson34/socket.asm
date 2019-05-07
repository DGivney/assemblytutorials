; Socket
; Compile with: nasm -f elf socket.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 socket.o -o socket
; Run with: ./socket

%include    'functions.asm'

SECTION .data
; our response string
response db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 14', 0Dh, 0Ah, 0Dh, 0Ah, 'Hello World!', 0Dh, 0Ah, 0h

SECTION .bss
buffer resb 255,                ; variable to store request headers

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

    push    byte 1              ; listen socket from lesson 31
    push    edi
    mov     ecx, esp
    mov     ebx, 4
    mov     eax, 102
    int     80h

_accept:

    push    byte 0              ; accept socket from lesson 32
    push    byte 0
    push    edi
    mov     ecx, esp
    mov     ebx, 5
    mov     eax, 102
    int     80h

_fork:

    mov     esi, eax            ; fork socket from lesson 33
    mov     eax, 2
    int     80h

    cmp     eax, 0
    jz      _read

    jmp     _accept

_read:

    mov     edx, 255            ; read socket from lesson 33
    mov     ecx, buffer
    mov     ebx, esi
    mov     eax, 3
    int     80h

    mov     eax, buffer
    call    sprintLF

_write:

    mov     edx, 78             ; move 78 dec into edx (length in bytes to write)
    mov     ecx, response       ; move address of our response variable into ecx
    mov     ebx, esi            ; move file descriptor into ebx (accepted socket id)
    mov     eax, 4              ; invoke SYS_WRITE (kernel opcode 4)
    int     80h                 ; call the kernel

_exit:

    call    quit                ; call our quit function
