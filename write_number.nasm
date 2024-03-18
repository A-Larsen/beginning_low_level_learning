extern printf 

section .data
	fmt: db "number %d", 10, 0
    thing: dq 88
section .bss
section .text
	global main
main:
	push rbp    ; push function prologe
	mov rbp,rsp ; push function prologe

    mov rdi, fmt
    mov rsi, [thing]
    mov rax, 0
	call printf

	mov rsp, rbp ; pop function prologe
	pop rbp      ; pop function prologe

	mov  rax, 60
	mov rdi, 0 
	syscall
