; QUESTIONS:
; - why does syscall change rcx ?

section .data
    codes: db '0123456789'
    temp: times 10 db 0

section .text

global main

; one argument of rdi
print_int: ; function
    push rbx
    xor rcx, rcx
.loop:
    ; modulo
    xor rdx, rdx ; clear rdx to clear junk data
    mov rax, rdi ; dividend (top)
    mov rbx, 10 ; divisor (bottom)
    div rbx ; result in RDX:RAX, modulo of division in rdx

    ; store value 1 btyte of `codes` somewhere in temp
    mov rax, [codes + rdx]
    mov qword [temp + rcx], rax
    inc rcx

    ; keep dividing by 10
    xor rdx, rdx
    mov rax, rdi ; dividend (top)
    mov rdi, 10 ; divisor (bottom)
    div rdi 
    mov rdi, rax ; result in rdi

    test rdi, rdi
    jnz .loop


.reverse:
    lea rax, [temp + rcx - 1]
    mov rsi, rax
    
    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description
    mov rdx, 1 ; 1 byte long

    push rcx
    syscall ; syscall must change rcx in some way
    pop rcx

    loop .reverse

    xor rcx, rcx

    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description
    mov rsi, 10
    mov rdx, 1
    syscall

    pop rbx
    ret

main:
    push rbp
    mov rbp, rsp

    mov rdi, 5495
    call print_int

    mov rsp, rbp
    pop rbp

    mov rax, 60
    xor rdi, rdi
    syscall
