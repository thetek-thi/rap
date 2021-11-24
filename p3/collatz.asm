    global  main
    
    extern  atoi
    extern  exit
    extern  printf



section .data
    strf:   db '%d',10,0
    eargc:  db 'Usage: `collatz <n>`',10,0
    res:    dd 1



section .text
main:
    ; no command line arguments -> print error and exit
    mov     eax, [esp+4]
    dec     eax
    jz      _eargc

    ; get number from first argument in eax
    mov     eax, [esp+8]
    push    dword [eax+4]
    call    atoi
    add     esp, 4

    ; call collatz function
    mov     [res], eax
    call    _collatz

    xor     eax, eax
    ret



_collatz:
    call    _printeax
    __start:
        mov     eax, [res]
        shl     eax, 31
        shr     eax, 31
        jz      __even
    __odd:
        mov     eax, [res]
        mov     edx, 3
        mul     edx
        inc     eax
        mov     [res], eax
        call    _printeax
        jmp     __end
    __even:
        mov     eax, [res]
        mov     ebx, 2
        xor     edx, edx
        div     ebx
        mov     [res], eax
        call    _printeax
    __end:
        mov     eax, [res]
        dec     eax
        jnz     __start
    ret



_printeax:
    push    eax
    push    strf
    call    printf
    add     esp, 8
    ret



_eargc:
    push    eargc
    call    printf
    
    mov     edi, 1
    call    exit

