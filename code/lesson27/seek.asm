; Seek
; Compile with: nasm -f elf seek.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 seek.o -o seek
; Run with: ./seek

%include    'functions.asm'

SECTION .data
filename db 'readme.txt', 0h    ; the filename to create
contents  db '-updated-', 0h     ; the contents to write at the start of the file

SECTION .text
global  _start

_start:

    mov     ecx, 1              ; flag for writeonly access mode (O_WRONLY)
    mov     ebx, filename       ; filename of the file to open
    mov     eax, 5              ; invoke SYS_OPEN (kernel opcode 5)
    int     80h                 ; call the kernel

    mov     edx, 2              ; whence argument (SEEK_END)
    mov     ecx, 0              ; move the cursor 0 bytes
    mov     ebx, eax            ; move the opened file descriptor into EBX
    mov     eax, 19             ; invoke SYS_LSEEK (kernel opcode 19)
    int     80h                 ; call the kernel

    mov     edx, 9              ; number of bytes to write - one for each letter of our contents string
    mov     ecx, contents       ; move the memory address of our contents string into ecx
    mov     ebx, ebx            ; move the opened file descriptor into EBX (not required as EBX already has the FD)
    mov     eax, 4              ; invoke SYS_WRITE (kernel opcode 4)
    int     80h                 ; call the kernel

    call    quit                ; call our quit function
