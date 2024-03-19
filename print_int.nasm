section .data
    codes: db '0123456789'

section .text

global main

main:

    ; Because the  dividend is RDX:RAX, we need to clear RDX and RAX
    xor rdx, rdx
    xor rax, rax

    mov rax, 10 ; dividend (top)
    mov rcx, 5 ; divisor (bottom)
    div rcx  ; result is stored in RDX:RAX
    mov rdi, rax ; returning the result as a exit number

    mov rax, 60
    syscall
