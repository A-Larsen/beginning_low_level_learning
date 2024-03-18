section .data
    codes: db '012345678ABCDEF' ; +7 to go to next byte

section .text
global main
main:
    mov rax, 0x1122334455667788

    mov rdi, 1 ; stdout for print instruction
    mov rdx, 1 ; length of one byte
    mov rcx, 64

.loop:
    push rax ; decrements stack and places rax on top of stack
    ; 4 bits can fit 16 values for our hex number
    sub rcx, 4
    sar rax, cl ; cl = 60, 56, 52, 48, 44, etc
    ;get four most significant bits, shift four, reapeat

    and rax, 0xf ; performs and places result in rax
                ; rax = 7, 7, 8

    lea rsi, [codes + rax] ; source for stdout
    mov rax, 1

    push rcx
    syscall
    pop rcx ; puts value at top of stack in rcx and increments stack
            ; puts the old value of rcx before syscall back into rcx

    pop rax ; puts the old value of rax when initialized back into rax
    test rcx, rcx ;; set flags from anding these
    jnz .loop

    mov rax, 60
    xor rdi, rdi
    syscall
