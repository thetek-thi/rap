global  main

extern  atoi
extern  printf



section .data
    strf_badarg: db 'bad argument',10,0
    strf_number: db '%10d',10,0



section .text

main:
    ; argc, needs to be 2 (cmd + 1 arg)
    mov     eax, [esp+4]
    cmp     eax, 2
    jne     bad_command

    ; argv with atoi() for argument to integer
    mov     eax, [esp+8]
    push    dword [eax+4]
    call    atoi
    add     esp, 4

    ; TODO: actual code for collatz



finished:
    ret



bad_command:
    push    strf_badarg
    call    printf
    add     esp, 4
    ret

