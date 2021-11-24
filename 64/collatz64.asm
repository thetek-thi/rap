    global  main
    
    extern  atoi
    extern  exit
    extern  printf



section .data
    strf:   db '%d',10,0
    eargc:  db 'Usage: `collatz64 <n>`',10,0
    res:    dq 1



section .text
main:
    ; no command line arguments -> print error and exit
    add     rsi, 8
    dec     rdi
    jz      _eargc

    ; get number from first argument in rax
    push    rbp
    mov     rdi, [rsi]
    call    atoi
    pop     rbp

    ; call collatz function
    mov     [res], rax
    call    _collatz

    xor     rax, rax
    ret



_collatz:
    call    _printrax
    __start:
        mov     rax, [res]
        shl     rax, 63
        shr     rax, 63
        jz      __even
    __odd:
        mov     rax, [res]
        mov     rdx, 3
        mul     rdx
        inc     rax
        mov     [res], rax
        call    _printrax
        jmp     __end
    __even:
        mov     rax, [res]
        mov     rbx, 2
        xor     rdx, rdx
        div     rbx
        mov     [res], rax
        call    _printrax
        jmp     __end
    __end:
        mov     rax, [res]
        dec     rax
        jnz     __start

    ret



_printrax:
    push    rbp
    mov     rdi, strf
    mov     rsi, rax
    call    printf
    pop     rbp
    ret



_eargc:
    push    rbp
    mov     rdi, eargc
    call    printf
    pop     rbp

    mov     rdi, 1
    call    exit

