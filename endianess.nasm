section .data
    newline_char: db 10
    codes: db '012345678abcdef' ; what 9?
    demo1: dq 0x1122334455667788
    demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88

section .text

global main

print_newline:
    mov rax, 1 ; 'write' syscall identifier
    mov rdi, 1 ; 'stdout' file descriptor
    mov rsi, newline_char ; where do we take data from
    mov rdx, 1 ; the amount of bytes to write
    syscall
    ret

print_hex: ; "function"
    ; there are no Calle-saved registers in this function
    mov rax, rdi
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64 ; how far are we shifting rax?

iterate: ; this is still part of print_hex function
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
    ; rdi is our one argument

    mov rdi, [demo1]
    call print_hex
    call print_newline

    mov rdi, [demo2]
    call print_hex
    call print_newline

    mov rax, 60
    xor rdi, rdi
    syscall
