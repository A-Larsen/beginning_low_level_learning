section .data
    codes: db '0123456789'

section .text

global main

print_int:
    ; to find the number in each decimal place I could use the formula

    ;-------------------------------------
    ; floor(mod(num / 10 ^place); 10)
    ;-------------------------------------

    ; but I also need to find the numbers width
    ; for that I could use the formula

    ;-------------------------------------
    ; round(log(10; num) + 1)
    ;-------------------------------------

    ; or

    ;-------------------------------------
    ; count the number of times I can divide by 10 before reaching zero
    ;-------------------------------------

    ; make sure to use unsigned math to floor output maybe?
    ; might try this without tail call optimization first

    ; in this case I think I need to perform my own modulo
    ; dang forgot an easy way to get remander from a division problem

    ; math for creating modulo
    ;---------------------------------------
    ; a / b = c
    ; round(c) * b = d
    ; a - d = answer
    ;---------------------------------------

    xor rax, rax
    mov rbx, rdi
    mov rax, 
    mul rbx

    ;imul rbx

    

iterate:
    push rax

    mov rax, 1 ; 'write' syscall identifier
    mov rdi, 1 ; 'stdout' file descriptor
    mov rsi, codes ; where do we take data from
    mov rdx, 10 ; the amount of bytes to write
    syscall

    pop rax
    test rax, rax
    dec rax

    jnz iterate

    ret


main:
    ; print_int will need one argument and one value returned
    mov rdi, 4
    call print_int

    mov rax, 60
    xor rdi, rdi
    syscall
