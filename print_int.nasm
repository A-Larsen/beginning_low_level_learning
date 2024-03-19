section .data
    codes: db '0123456789'

section .text

global main

print_int: ; function
    ; need to keep dividing until rdi is zero

.loop:
    xor rdx, rdx

    mov rax, rdi ; dividend (top)
    mov rdi, 10 ; divisor (bottom)
    div rdi 
    mov rdi, rax ; result in rdi
    cmp rdi, 0

    ; now I'm going to print something off to see if the loop is working correct

    jnz .loop



    xor rax, rax ; return rax to it's previous state
    ret

main:
    mov rdi, 123
    call print_int

    mov rax, 60
    ;mov rdi, 4
    syscall
