global main

extern printf



section .data
    strf: db '%d',10,0



section .text
main:
    mov ecx, 46

    call fib

    push eax
    push strf
    call printf
    add esp, 8

    ret



fib:
    mov eax, 0
    mov ebx, 1
    
    fibloop:
        mov edx, eax
        add edx, ebx
        mov eax, ebx
        mov ebx, edx
    loop fibloop

    ret

