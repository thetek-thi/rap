    global  main
    extern  printf



section .data
    strf:   db '%d',10,0



section .text

main:
    ; fibonacci number to calculate
    mov     rcx, 42

    ; calculate fibonacci number
    call    fib

    ; print result
    push    rbp
    mov     rdi, strf
    mov     rsi, rax
    xor     rax, rax
    call    printf
    pop     rbp
    xor     rax, rax
    
    ret



fib:
    mov     rax, 0
    mov     rbx, 1

    fibloop:
        mov     rdx, rax
        add     rdx, rbx
        mov     rax, rbx
        mov     rbx, rdx
    loop fibloop

    ret

