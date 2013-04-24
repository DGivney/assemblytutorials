; Hello World Program (Passing arguments from the command line)
; Compile with: nasm -f elf helloworld-args.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-args.o -o helloworld-args
; Run with: ./helloworld-args

%include        'functions.asm'

SECTION .text
global  _start

_start:

    pop     ecx             ; first value on the stack is the number of arguments

nextArg:
    cmp     ecx, 0H         ; check to see if we have any arguments left
    jz      noMoreArgs      ; if zero flag is set jump to noMoreArgs label (by jumping over the end of the loop)
    pop     eax             ; pop the next argument off the stack
    call    sprintLF        ; call our print with linefeed function
    dec     ecx             ; decrease edi (number of arguments left) by 1
    jmp     nextArg         ; jump to nextArg label

noMoreArgs:
    call    quit