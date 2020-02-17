section .data
    text db "Whats is your name? "
    text2 db "Hello, "

section .bss
    name resb 16 //bites reserved

section .text  
    global _start

_start:

    call _printText1
    call _getName
    call _printText2
    call _printName

    mov rax, 60
    mov rdi, 0
    syscall

_getName:
    mov rax, 0 //ID = 0 for inputs
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret


_printText1:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 19
    syscall
    ret

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 7
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret



