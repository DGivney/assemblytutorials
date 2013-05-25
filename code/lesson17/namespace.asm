; Namespace
; Compile with: nasm -f elf namespace.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 namespace.o -o namespace
; Run with: ./namespace

%include        'functions.asm'

SECTION .data
msg1        db      'Jumping to finished label.', 0h        ; a message string
msg2        db      'Inside subroutine number: ', 0h        ; a message string
msg3        db      'Inside subroutine "finished".', 0h     ; a message string

SECTION .text
global  _start

_start:

subrountineOne:
    mov     eax, msg1       ; move the address of msg1 into eax
    call    sprintLF        ; call our string printing with linefeed function
    jmp     .finished       ; jump to the local label under the subrountineOne scope

.finished:
    mov     eax, msg2       ; move the address of msg2 into eax
    call    sprint          ; call our string printing function
    mov     eax, 1          ; move the value one into eax (for subroutine number one)
    call    iprintLF        ; call our integer printing function with linefeed function

subrountineTwo:
    mov     eax, msg1       ; move the address of msg1 into eax
    call    sprintLF        ; call our string print with linefeed function
    jmp     .finished       ; jump to the local label under the subrountineTwo scope

.finished:
    mov     eax, msg2       ; move the address of msg2 into eax
    call    sprint          ; call our string printing function
    mov     eax, 2          ; move the value two into eax (for subroutine number two)
    call    iprintLF        ; call our integer printing function with linefeed function

    mov     eax, msg1       ; move the address of msg1 into eax
    call    sprintLF        ; call our string printing with linefeed function
    jmp     finished        ; jump to the global label finished

finished:
    mov     eax, msg3       ; move the address of msg3 into eax
    call    sprintLF        ; call our string printing with linefeed function
    call    quit            ; call our quit function