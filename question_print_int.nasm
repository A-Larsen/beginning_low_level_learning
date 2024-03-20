section .data
    codes: db '0123456789'
    temp: times 10 db 0

section .text

global main

; one argument of rdi
print_int: ; function

    xor rcx, rcx
.loop:
    ; modulo
    xor rdx, rdx
    mov rax, rdi ; dividend (top)
    mov r8, 10 ; divisor (bottom)
    div r8
    mul r8 ; rax * r8, result i n edx:rax
    mov r9, rdi
    sub r9, rax ; answer in r9

    mov rax, [codes + r9]
    mov qword [temp + rcx], rax
    inc rcx

    ; keep dividing by 10
    xor rdx, rdx
    mov rax, rdi ; dividend (top)
    mov rdi, 10 ; divisor (bottom)
    div rdi 
    mov rdi, rax ; result in rdi

    test rdi, rdi
    jnz .loop

.reverse:

    dec rcx

    push rcx
    lea rax, [temp + rcx]
    mov rsi, rax
    
    mov rsi, rax
    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description

    mov rdx, 1
    syscall ; syscall must change rcx in some way

    pop rcx
    test rcx, rcx
    jnz .reverse

    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description
    mov rsi, 10
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
