BITS 64;
section .data
    text db "Hello World!", 10
    ; text2 db ""

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, text
    mov rdx, 13
    syscall
    mov rax, 60
    mov rdi, 0
    syscall
