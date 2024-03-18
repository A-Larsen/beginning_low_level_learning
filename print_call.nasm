section .data
    newline_char: db 10
    codes: db '012345678abcdef' ; what 9?

section .text

global main

print_newline:
    mov rax, 1 ; 'write' syscall identifier
    mov rdi, 1 ; 'stdout' file descriptor
    mov rsi, newline_char ; where do we take data from
    mov rdx, 1 ; the amount of bytes to write
    syscall
    ret

print_hex:
    mov rax, rdi
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64 ; how far are we shifting rax?

iterate:
    push rax
    sub rcx, 4
    sar rax, cl

    and rax, 0xf
    lea rsi, [codes + rax]

    mov rax, 1

    push rcx
    syscall

    pop rcx
    pop rax
    test rcx, rcx
    jnz iterate

    ret

main:
    mov rdi, 0x1122334455667788
    call print_hex
    call print_newline

    mov rax, 60
    xor rdi, rdi
    syscall
