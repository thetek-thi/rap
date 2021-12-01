global main

extern printf



section .data
    strf: db '%d',10,0



section .text
main:
    mov ecx, 10 ; the fibonacci number to calculate

    call fib ; eax = fib(ecx)

    push eax
    push strf
    call printf
    add esp, 8

    ret



fib:
    mov eax, 0
    mov ebx, 1
    
    ; ecx = 10 (-> line 14)
    fibloop:
        mov edx, eax
        add edx, ebx ; new = a + b
        mov eax, ebx ; a = b
        mov ebx, edx ; b = new
    loop fibloop ; ecx-- ; if ecx > 0 { jmp fibloop }

    ret

