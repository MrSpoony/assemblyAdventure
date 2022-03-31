BITS 64;
section .data
    text db "Hello World!", 10, 0
    text2 db "This is a much longer text but it should be fine and should get printed out to the console", 10, 0
    text3 db "some placeholder text", 10

section .text
    global _start

_start:
    mov rax, text
    call _printRAX
    mov rax, text2
    call _printRAX
    mov rax, 60
    mov rdi, 0
    syscall


; rax = pointer to first char of string
_printRAX:
    push rax
    mov rbx, 0

_printLoop:
    inc rax
    inc rbx
    
    mov cl, [rax]
    cmp cl, 0
    jne _printLoop
    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret
