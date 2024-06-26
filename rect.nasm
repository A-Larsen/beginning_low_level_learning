global r_circum
global r_area

section .data
section .bss
section .text

r_area:
    section .text
    push rbp
    mov rbp, rsp

    mov rax, rsi
    imul rax, rdi
    mov rsp, rbp

    pop rbp
    ret

r_circum:
    section .text
    push rbp
    mov rbp, rsp

    mov rax, rsi
    add rax, rdi
    add rax, rax

    mov rsp, rbp
    pop rbp
    ret
