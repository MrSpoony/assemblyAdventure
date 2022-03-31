format ELF64 executable 3
segment readable executable
entry start
start:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 13
    syscall
    mov rax, 60
    mov rdi, 0
    syscall
segment readable writable
    text: db "Hello World!", 10
    ; text2 db ""
