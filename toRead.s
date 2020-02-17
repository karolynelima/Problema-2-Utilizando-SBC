%include "linux64.inc"

section .data
    filename db "myfile.txt", 0

section .bss
    text resb 18

section .text  
    global _start

_start:
    //Open the file
    mov rax, SYS_OPEN //the ID for sys_open
    mov rdi, filename //the pointer to the zero-terminated string for the file name to open
    mov rsi, O_RONLY
    mov rdx, 0 //file permissions
    syscall

    //Read from the file
    push rax
    mov rdi, rax //the file descriptor comes from the rax register assuming sys_open was sucessful.
    mov rax, SYS_READ
    mov rsi, text //pointer to where the read text will be stored
    mov rdx, 17 //number of bytes to read
    syscall

    //Close the file
    mov rax, SYS_CLOSE
    pop rdi //the file descriptor of the file to close, it assumes it is on the top of the stack
    syscall

    print text
    exit

    
