BITS 64
 
section .data
 
section .bss
    num resb 8
    curr resb 8
 
section .text
    global _start
 
_start:
    mov rax, 69420
    call _printRAXInt
 
    mov rax, 60
    mov rsi, 0
    syscall
 
_printRAXInt:
    mov [num], rax
    mov rax, 1
    mov [curr], rax
    push 10
 
_printRAXIntLoop:
    mov rax, [num]
    mov rdx, 0
    mov rbx, 10
    div rbx
    mov [num], rax
 
    add rdx, 48
    push rdx
 
    mov rax, [curr]
    inc rax
    mov [curr], rax
 
    mov rax, [num]
    cmp rax, 0
    jne _printRAXIntLoop
 
_printRAXIntLoop2:
    pop rax
    mov [num], rax
    mov rax, 1
    mov rdi, 1
    mov rsi, num
    mov rdx, 1
    syscall
 
    mov rax, [curr]
    dec rax
    mov [curr], rax
    cmp rax, 0
    jg _printRAXIntLoop2
    ret
