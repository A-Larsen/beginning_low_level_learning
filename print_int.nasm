section .data
    codes: db '0123456789', 10

section .text

global main

print_int:
    ; to find the number in each decimal place I could use the formula

    ;-------------------------------------
    ; floor(log(num / 10 ^place); 10)
    ;-------------------------------------

    ; but I also need to find the numbers width
    ; for that I could use the formula

    ;-------------------------------------
    ; round(log(10; num) + 1)
    ;-------------------------------------

    xor rax, rax
    mov rbx, rdi
    mov rax, 1

    imul rbx

    

iterate:
    push rax

    mov rax, 1 ; 'write' syscall identifier
    mov rdi, 1 ; 'stdout' file descriptor
    mov rsi, codes ; where do we take data from
    mov rdx, 11 ; the amount of bytes to write
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
