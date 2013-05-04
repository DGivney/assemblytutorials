; Namespace
; Compile with: nasm -f elf namespace.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 namespace.o -o namespace
; Run with: ./namespace

%include        'functions.asm'

SECTION .data
msg1        db      'Jumping to finished label.', 0h     ; a message string
msg2        db      'Inside subroutine number: ', 0h     ; a message string

SECTION .text
global  _start

_start:

subrountineOne:
    mov     eax, msg1
    call    sprintLF
    jmp     .finished

.finished:
    mov     eax, msg2
    call    sprint
    mov     eax, 1
    call    iprintLF

subrountineTwo:
    mov     eax, msg1
    call    sprintLF
    jmp     .finished

.finished:
    mov     eax, msg2
    call    sprint
    mov     eax, 2
    call    iprintLF

    mov     eax, msg1
    call    sprintLF
    jmp     finished

finished:
    call    quit