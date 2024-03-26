global main
extern printf

section .data
    string db "ABCDE", 0
    stringLen equ $ - string - 1
    fmt1 db "The original string: %s", 10, 0
    fmt2 db "The reversed string: %s", 10, 0

section .bss

section .text
main:
    push rbp
    mov rbp, rsp

    ; print the original string
    mov rdi, fmt1
    mov rsi, string
    mov rax, 0
    call printf

    ; push the stirng char per char on the stack
    xor rax, rax
    mov rbx, string
    mov rcx, stringLen
    mov r12, 0
    pushLoop:
        mov al, byte [rbx + r12]
        push rax
        inc r12
        loop pushLoop

    mov rsp, rbp
    pop rbp
