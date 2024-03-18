extern printf 

section .data
	fmt: db "number: %d", 10, 0

section .text
    global main

main:
	push rbp    ; push function prologe
	mov rbp,rsp ; push function prologe

    mov rdi, fmt
    mov rsi, 12
    mov rax, 0
	call printf

	mov rsp, rbp ; pop function prologe
	pop rbp      ; pop function prologe

	mov  rax, 60     ; 60 = exit
	mov rdi, 0       ; 0 = success exit code
	syscall          ; quit
