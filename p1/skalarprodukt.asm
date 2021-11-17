global main

extern printf



section .data
    ; vector x
    x1:     dd 17
    x2:     dd 11
    x3:     dd  4
    ; vector y
    y1:     dd  4
    y2:     dd -9
    y3:     dd  8
    ; result
    res:    dd  0
    ; format of printf() call
    format: db '%d', 10, 0



section .text
main:
    ; calculate stuff: res = x1*y1 + x2*y2 + x3*y3
    ; x1*y1
    mov eax, [x1]
    mul dword [y1]
    add [res], eax
    ; x2*y2
    mov eax, [x2]
    mul dword [y2]
    add [res], eax
    ; x3*y3
    mov eax, [x3]
    mul dword [y3]
    add [res], eax
    
    ; print stuff
    mov eax, [res]
    push eax
    push format
    call printf
    add esp, 8

    ret

