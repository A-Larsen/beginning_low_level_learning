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

    ; pop the string char per char from the stack
    ; this will reverse the original string

    mov rbx, string
    mov rcx, stringLen
    mov r12, 0

    popLoop:
        pop rax
        mov byte [rbx + r12], al
        inc r12
        loop popLoop

    mov byte [rbx + r12], 0 ; terminate string with 0

    ; Print the reversed string
    mov rdi, fmt2
    mov rsi, string
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp

    mov rax, 60
    xor rdi, rdi
    syscall
