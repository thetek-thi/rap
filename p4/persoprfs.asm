    global  main

    extern  exit
    extern  printf



section .data

    eargcmsg: db 'Usage: `persoprfs <nummer>`',10,0
    strf_str: db '%s',10,0




section .text

main:
    mov     eax, [esp+4]
    cmp     eax, 2
    jnz     errargc

    mov     eax, [esp+8]

    push    dword [eax+4]
    push    strf_str
    call    printf
    add     esp, 8

    ret



errargc:
    push    eargcmsg
    call    printf
    add     esp, 4
    

    mov     edi, 1
    call    exit

