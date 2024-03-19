section .data
    codes: db '0123456789'

section .text

global main



; one argument of rdi
print_int: ; function
    ; need to keep dividing until rdi is zero

; rsi was only used to test how many times loop iterated

    mov rcx, rdi ; rcx is the number we are using
.loop:

    ; modulo
    xor rdx, rdx
    mov rax, rcx ; dividend (top)
    mov r8, 10 ; divisor (bottom)
    div r8
    mul r8 ; rax * r8, result i n edx:eax
    mov r9, rcx
    sub rax, r9 ; answer in rax

    ; keep dividing by 10
    xor rdx, rdx
    mov rax, rdi ; dividend (top)
    mov rdi, 10 ; divisor (bottom)
    div rdi 
    mov rdi, rax ; result in rdi
    ;inc rsi


    test rdi, rdi

    jnz .loop



    xor rax, rax ; return rax to it's previous state
    ;xor rsi, rsi
    ret

main:
    mov rdi, 123
    ;mov rsi, 0
    call print_int

    mov rax, 60
    ;mov rdi,rsi
    syscall
