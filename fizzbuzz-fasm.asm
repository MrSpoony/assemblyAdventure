format ELF64 executable 3
segment readable executable
entry start

start:
    mov rax, 100
    mov [n], rax
    call _fizzBuzz

    mov rax, 60
    mov rdi, 0
    syscall
    ret

_fizzBuzz:
    call _setupFizzBuzz
    call _fizzBuzzLoop
    ret

_setupFizzBuzz:
    mov rax, [n]
    inc rax
    mov [n], rax
    mov rax, 1
    mov [num], rax
    mov rax, [num]
    ret

_fizzBuzzLoop:
    call _printFizzBuzzNumber
    call _incNum
    jnz _fizzBuzzLoop
    ret

_printFizzBuzzNumber:
    call _compareNumWith3
        jne _notBy3
    call _compareNumWith3
        je _by3
    call _compareNumWith5
        jne _notBy5
    call _compareNumWith5
        je _by5
    ret


_notBy3:
    call _compareNumWith5
        jne _printNum
    call _compareNumWith5
        je _printBuzz
    ret


_by3:
    call _compareNumWith5
        jne _printFizz
    call _compareNumWith5
        je _printFizzBuzz
    ret

_notBy5:
    call _compareNumWith3
        jne _printNum
    call _compareNumWith3
        je _printFizz
    ret

_by5:
    call _compareNumWith3
        jne _printBuzz
    call _compareNumWith3
        je _printFizzBuzz
    ret


_compareNumWith3:
    mov rax, [num]
    mov rdx, 0
    mov rbx, 3
    div rbx
    cmp rdx, 0
    ret

_compareNumWith5:
    mov rax, [num]
    mov rdx, 0
    mov rbx, 5
    div rbx
    cmp rdx, 0
    ret

_printNum:
    mov rax, [num]
    call _printRAXInt
    ret

_printFizz:
    mov rax, fizz
    call _printRAXString
    ret

_printFizzBuzz:
    mov rax, fizzbuzz
    call _printRAXString
    ret

_printBuzz:
    mov rax, buzz
    call _printRAXString
    ret

_incNum:
    mov rax, [num]
    inc rax
    mov [num], rax
    mov rax, [num]
    mov rbx, [n]
    cmp rax, rbx
    ret

_printRAXString:
    push rax
    mov rbx, 0

_printRAXStringLoop:
    inc rax
    inc rbx
    
    mov cl, [rax]
    cmp cl, 0
    jne _printRAXStringLoop
    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall
    ret


_printRAXInt:
    mov rcx, digitSpace
    mov rbx, 10
    mov [rcx], rbx
    inc rcx
    mov [digitSpacePos], rcx

_printRAXIntLoop:
    mov rdx, 0
    mov rbx, 10
    div rbx
    ; push rax
    add rdx, 48

    ; mov rcx, [digitSpacePos]
    mov [rcx], dl
    inc rcx
    mov [digitSpacePos], rcx

    ; pop rax
    cmp rax, 0
    jne _printRAXIntLoop

_printRAXIntLoop2:
    ; mov rcx, [digitSpacePos]

    mov rax, 1
    mov rdi, 1
    mov rsi, rcx
    mov rdx, 1
    syscall

    mov rcx, [digitSpacePos]
    dec rcx
    mov [digitSpacePos], rcx
    cmp rcx, digitSpace
    jge _printRAXIntLoop2
    ret

segment readable writable

    fizz db "Fizz", 10, 0
    buzz db "Buzz", 10, 0
    fizzbuzz db "FizzBuzz", 10, 0
    nl db 10

    num rq 128
    digitSpace rq 100
    digitSpacePos rq 8
    n rq 128
