; Calculator (ATOI)
; Compile with: nasm -f elf calculator-atoi.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 calculator-atoi.o -o calculator-atoi
; Run with: ./calculator-atoi 20 1000 317

%include        'functions.asm'

SECTION .text
global  _start

_start:

    pop     ecx             ; first value on the stack is the number of arguments
    pop     edx             ; second value on the stack is the program name (discarded when we initialise edx)
    sub     ecx, 1          ; decrease ecx by 1 (number of arguments without program name)
    mov     edx, 0          ; initialise our data register to store additions

nextArg:
    cmp     ecx, 0h         ; check to see if we have any arguments left
    jz      noMoreArgs      ; if zero flag is set jump to noMoreArgs label (jumping over the end of the loop)
    pop     eax             ; pop the next argument off the stack
    call    atoi            ; convert our ascii string to decimal integer
    add     edx, eax        ; perform our addition logic
    dec     ecx             ; decrease ecx (number of arguments left) by 1
    jmp     nextArg         ; jump to nextArg label

noMoreArgs:
    mov     eax, edx        ; move our data result into eax for printing
    call    iprintLF        ; call our integer printing with linefeed function
    call    quit            ; call our quit function
