BITS 64
 
section .data
    enternumber db "Which fibonacci number do you want? "
    invalid db "Invalid number entered", 10
 
section .bss
    number resb 16
    tmp resb 16
    idx resb 16
    old resb 8
    fib resb 8
    num resb 8
    curr resb 8
 
section .text
    global _start
 
_start:

    mov rax, 69
    call _calculateRAXFib
    call _printRAXInt
 
    mov rax, 60
    mov rsi, 0
    syscall

_calculateRAXFib:
    mov [number], rax
    mov rax, 4
    mov [idx], rax
    mov rax, 1
    mov [old], rax
    mov [fib], rax

_calculateRAXFibLoop:
    mov rbx, [old]
    mov rcx, rbx
    mov rbx, [fib]
    add rcx, rbx
    mov [old], rbx
    mov [fib], rcx
    
    mov rax, [idx]
    cmp rax, [number]
    ja  _done
    inc rax
    mov [idx], rax
    jmp _calculateRAXFibLoop

_done:
    mov rax, [fib]
    ret

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
