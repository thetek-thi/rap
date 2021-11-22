global main

extern printf



section .data
    sixteenbitvalue: dw 0xABCD
    numberformat: db '%d',10,0



section .text
main:
    ; fill eax with 1s and do stuff with ah and al
    mov eax, 1111111111
    mov ah, 42
    mov al, 69

    push eax
    push numberformat
    call printf
    add esp, 8

    ; set cx to a 16bit value and put it into cx
    mov cx, [sixteenbitvalue]
    mov ax, cx

    push eax
    push numberformat
    call printf
    add esp, 8

    ; eax <- 17-5
    mov edx, 17
    sub edx, 5
    ; ebx <- 30
    mov ebx, 30
    ; ebx / 5
    xor edx, edx
    mov eax, ebx
    mov ebx, 5
    div ebx

    push eax
    push numberformat
    call printf
    add esp, 8

    ret

