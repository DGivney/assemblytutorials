; Socket
; Compile with: nasm -f elf socket.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 socket.o -o socket
; Run with: ./socket

%include    'functions.asm'

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

    mov     esi, eax            ; move return value of SYS_SOCKETCALL into esi (file descriptor for accepted socket, or -1 on error)
    mov     eax, 2              ; invoke SYS_FORK (kernel opcode 2)
    int     80h                 ; call the kernel

    cmp     eax, 0              ; if return value of SYS_FORK in eax is zero we are in the child process
    jz      _read               ; jmp in child process to _read

    jmp     _accept             ; jmp in parent process to _accept

_read:

    mov     edx, 255            ; number of bytes to read (we will only read the first 255 bytes for simplicity)
    mov     ecx, buffer         ; move the memory address of our buffer variable into ecx
    mov     ebx, esi            ; move esi into ebx (accepted socket file descriptor)
    mov     eax, 3              ; invoke SYS_READ (kernel opcode 3)
    int     80h                 ; call the kernel

    mov     eax, buffer         ; move the memory address of our buffer variable into eax for printing
    call    sprintLF            ; call our string printing function

_exit:

    call    quit                ; call our quit function
