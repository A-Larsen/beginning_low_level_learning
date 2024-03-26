global main
extern printf

section .data

    number1 dq 128
    number2 dq 19
    neg_num dq -12
    fmt db "The numbers are %ld and %ld", 10, 0
    fmtint db "%s %ld", 10, 0
    sumi db "The sum is", 0
    difi db "The difference is", 0
    inci db "Number 1 Incremented:", 0
    deci db "Number 1 Decremented:", 0
    sali db "Number 1 Shift left 2 (x4):", 0
    sari db "Number 1 Shift right 2 (/4):", 0
    sariex db "Number 1 Shift right 2 (/4) with"
           db "sign extension:", 0
    multi db "The product is", 0
    divi db "The integer quotient is", 0
    remi db "The modulo is", 0

section .bss
    resulti resq 1
    modulo resq 2

section .text

main:
    push rbp ; function prologe
    mov rbp, rsp ; function prologe

; displaying the numbers
    mov rdi, fmt
    mov rsi, [number1]
    mov rdx, [number2]
    mov rax, 0
    call printf

; adding -------------------------------

    mov rax, [number1]
    add rax, [number2]

    mov rdi, fmtint
    mov rsi, sumi 
    mov rdx, [resulti] 
    mov rax, 0
    call printf

    mov rsp, rbp ; function epiloge
    pop rbp ; function epiloge

    mov rax, 60
    xor rdi, rdi
    syscall
