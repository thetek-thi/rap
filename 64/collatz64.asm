    global  main
    
    extern  printf
    extern  atoi



section .data
    strf:   db '%s',10,0



section .text
main:
    push    rdi
    push    rsi
    sub     rsp, 8

    push    rbp
    mov     rdi, strf
    mov     rsi, [rsi]
    xor     rax, rax
    call    printf
    pop     rbp

    add     rsp, 8

    xor     eax, eax
    ret

