; Fizzbuzz
; Compile with: nasm -f elf fizzbuzz.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 fizzbuzz.o -o fizzbuzz
; Run with: ./fizzbuzz

%include        'functions.asm'

SECTION .data
fizz        db      'Fizz', 0h     ; a message string
buzz        db      'Buzz', 0h     ; a message string

SECTION .text
global  _start

_start:

    mov     esi, 0          ; initialise our checkFizz boolean variable
    mov     edi, 0          ; initialise our checkBuzz boolean variable
    mov     ecx, 0          ; initialise our counter variable

nextNumber:
    inc     ecx             ; increment our counter variable

.checkFizz
    mov     edx, 0          ; clear the edx register - this will hold our remainder after division
    mov     eax, ecx        ; move the value of our counter into eax for division
    mov     ebx, 3          ; move our number to divide by into ebx (in this case the value is 3)
    div     ebx             ; divide eax by ebx
    mov     edi, edx        ; move our remainder into edi (our checkFizz boolean variable)
    cmp     edi, 0          ; compare if the remainder is zero (meaning the counter divides by 3)
    jne     .checkBuzz      ; if the remainder is not equal to zero jump to local label checkBuzz
    mov     eax, fizz       ; else move the address of our fizz string into eax for printing
    call    sprint          ; call our string printing function

.checkBuzz:
    mov     edx, 0          ; clear the edx register - this will hold our remainder after division
    mov     eax, ecx        ; move the value of our counter into eax for division
    mov     ebx, 5          ; move our number to divide by into ebx (in this case the value is 5)
    div     ebx             ; divide eax by ebx
    mov     esi, edx        ; move our remainder into edi (our checkBuzz boolean variable)
    cmp     esi, 0          ; compare if the remainder is zero (meaning the counter divides by 5)
    jne     .checkInt       ; if the remainder is not equal to zero jump to local label checkInt
    mov     eax, buzz       ; else move the address of our buzz string into eax for printing
    call    sprint          ; call our string printing function

.checkInt:
    cmp     edi, 0          ; edi contains the remainder after the division in checkFizz
    je     .continue        ; if equal (counter divides by 3) skip printing the integer
    cmp     esi, 0          ; esi contains the remainder after the division in checkBuzz
    je     .continue        ; if equal (counter divides by 5) skip printing the integer
    mov     eax, ecx        ; else move the value in ecx (our counter) into eax for printing
    call    iprint          ; call our integer printing function

.continue:
    mov     eax, 0Ah        ; move an ascii linefeed character into eax
    push    eax             ; push the address of eax onto the stack for printing
    mov     eax, esp        ; get the stack pointer (address on the stack of our linefeed char)
    call    sprint          ; call our string printing function to print a line feed
    pop     eax             ; pop the stack so we don't waste resources
    cmp     ecx, 100        ; compare if our counter is equal to 100
    jne     nextNumber      ; if not equal jump to the start of the loop

    call    quit            ; else call our quit function