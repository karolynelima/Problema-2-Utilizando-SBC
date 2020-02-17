%include "linux64.inc"

section .data
    filename db "myfile.txt", 0
    text db "Here's some text."

section .text  
    global _start

_start:
    //Open the file
    mov rax, SYS_OPEN //the ID for sys_open
    mov rdi, filename //the pointer to the zero-terminated string for the file name to open
    mov rsi, O_CREAT+O_WRONLY //"create" (64) and "write" (1) flags
    mov rdx, 0644o //file permissions
    syscall

    //Write to the file
    mov rdi, rax //the file descriptor comes from the rax register assuming sys_open was sucessful
    mov rax, SYS_WRITE
    mov rsi, text //pointer to the text which will be written to the file
    mov rdx, 17 //number og byter to write to the file
    syscall

    //Close the file
    mov rax, SYS_CLOSE
    pop rdi //the file descriptor of the file to close, it assumes it is on the top of the stack
    syscall

    exit

    
