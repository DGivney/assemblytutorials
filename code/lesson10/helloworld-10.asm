; Hello World Program (Count to 10)
; Compile with: nasm -f elf helloworld-10.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-10.o -o helloworld-10
; Run with: ./helloworld-10

%include        'functions.asm'

SECTION .text
global  _start
    
_start: 

    mov     ecx, 0          ; ecx is initalised to zero.
    
nextNumber:
    inc     ecx             ; increment ecx
    
    mov     eax, ecx        ; move the address of our integer into eax
    add     eax, 48         ; add 48 to our number to convert from integer to ascii for printing
    push    eax             ; push eax to the stack
    mov     eax, esp        ; get the address of the character on the stack
    call    sprintLF        ; call our print function
    
    pop     eax             ; clean up the stack so we don't have unneeded bytes taking up space
    cmp     ecx, 10         ; have we reached 10 yet? compare our counter with decimal 10
    jne     nextNumber      ; jump if not equal and keep counting
      
    call    quit