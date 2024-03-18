extern printf 

section .data
	fmt: db "number: %d", 10, 0
section .bss
    var resq 1

section .text
	global main
main:
	push rbp    ; push function prologe
	mov rbp, rsp ; push function prologe

    xor rcx, rcx
    mov [var], rcx

loop:
    mov rdi, fmt
    mov rsi, [var]
    mov rax, 0
	call printf

    mov rcx, [var]
    inc rcx
    mov [var], rcx

    cmp rcx, 12

    jl loop

	mov rsp, rbp ; pop function prologe
	pop rbp      ; pop function prologe

	mov  rax, 60
	mov rdi, 0 
	syscall
