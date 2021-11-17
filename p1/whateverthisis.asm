; ----------------------------------------------------------------------------
; p1.asm
;
; NASM template f�r Praktikum 1
; ----------------------------------------------------------------------------

        global  main
        extern  printf

        section .text
main:
		;;;;;;;;;;;;;;;;;;;;;;;;; hier geht's los ;;;;;;;;;;;;;;;;;;;;;;;;;

        mov     eax, [a]
		mov     ecx, [a+4]
        add     eax, ecx
		
		;;;;;;;;;;;;;;;;;;;;;;;;; abschlie�ende Ausgabe ;;;;;;;;;;;;;;;;;;;;;;;;;
		
print:
        push    eax
        push    decformat
        call    printf
        add     esp, 8			; ESP um 2 DWORD zur�ckstellen
        ret
		
		section .data

decformat:
        db      '%10d', 10, 0
hexformat:
        db      '%8x', 10, 0
a: dd 2
   dd 40 ;=b

