section .data
    codes: db '0123456789'

section .text

global main

; one argument of rdi
print_int: ; function
.loop:
    ; modulo
    xor rdx, rdx
    mov rax, rdi ; dividend (top)
    mov r8, 10 ; divisor (bottom)
    div r8
    mul r8 ; rax * r8, result i n edx:rax
    mov r9, rdi
    sub r9, rax ; answer in r9

    ; get character
    push rdi
    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description
    lea rsi, [codes + r9]
    mov rdx, 1
    syscall

    pop rdi

    ; keep dividing by 10
    xor rdx, rdx
    mov rax, rdi ; dividend (top)
    mov rdi, 10 ; divisor (bottom)
    div rdi 
    mov rdi, rax ; result in rdi

    test rdi, rdi

    jnz .loop

    ; print newline
    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description
    lea rsi, 10
    mov rdx, 1
    syscall

    xor rax, rax ; return rax to it's previous state
    xor rsi, rsi

    ret

main:
    ; dang, works but it's backwords
    mov rdi, 5495
    call print_int

    mov rax, 60
    xor rdi, rdi
    syscall
