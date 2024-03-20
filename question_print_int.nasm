; QUESTIONS:
; - what is EDX:EAX ? I though the colon just represented offset
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
    xor rdx, rdx
    mov rax, rdi ; dividend (top)
    mov rbx, 10 ; divisor (bottom)
    div rbx
    mul rbx ; rax * rbx, result i n edx:rax
    mov rbx, rdi
    sub rbx, rax ; answer in rbx

    ; store value 1 btyte of `codes` somewhere in temp
    mov rax, [codes + rbx]
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
    dec rcx

    push rcx
    lea rax, [temp + rcx]
    mov rsi, rax
    
    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description

    mov rdx, 1
    syscall ; syscall must change rcx in some way

    pop rcx
    test rcx, rcx
    jnz .reverse

    mov rax, 1 ; 'write' syscall
    mov rdi, 1 ; stdout file description
    mov rsi, 10
    mov rdx, 1
    syscall

    pop rbx
    ret

main:
    mov rdi, 5495
    call print_int

    mov rax, 60
    xor rdi, rdi
    syscall
