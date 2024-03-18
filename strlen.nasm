global main

section .data
test_string: db "abcdef", 0

section .text

strlen:
    xor rax, rax
.loop:
    cmp byte [rdi + rax], 0

    je .end

    inc rax

    jmp .loop

.end:
    ret

main:
    mov rdi, test_string ; first arguemnt for strlen function
    call strlen ; the "return" value for strlen in in rax
    mov rdi, rax

    mov rax, 60
    syscall

