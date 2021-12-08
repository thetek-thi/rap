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
        and     rax, 0x1        ; check if rax is even
        jz      __even
    __odd:
        mov     rax, [res]
        imul    rax, 3          ; rax * 3
        inc     rax             ; rax ++
        mov     [res], rax
        call    _printrax
        jmp     __end
    __even:
        mov     rax, [res]
        shr     rax, 1          ; rax / 2
        mov     [res], rax
        call    _printrax
        jmp     __end
    __end:
        mov     rax, [res]
        dec     rax             ; quit if rax == 1
        jnz     __start

    ret



; print rax
_printrax:
    push    rbp
    mov     rdi, strf
    mov     rsi, rax
    call    printf
    pop     rbp
    ret



; print error message for argument count
_eargc:
    push    rbp
    mov     rdi, eargc
    call    printf
    pop     rbp

    mov     rdi, 1
    call    exit

