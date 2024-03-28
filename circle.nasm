extern pi

global c_area
global c_circum

section .data
section .bss
section .text

c_area:
    section .text
    push rbp
    mov rbp, rsp

    movsd xmm1, qword [pi]
    mulsd xmm0, xmm0 ; radius in xmm0
    mulsd xmm0, xmm1

    mov rsp, rbp
    pop rbp
    ret

c_circum:
    section .text
    push rbp
    mov rbp, rsp

    movsd xmm1, qword [pi]
    addsd xmm0, xmm0 ; radius in xmm0
    mulsd xmm0, xmm1

    mov rsp, rbp
    pop rbp
    ret
