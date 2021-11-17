; ----------------------------------------------------------------------------
; helloworld.asm
;
; This is an i386/Linux console program that writes "Hello, World" on one line and
; then exits.  It needs to be linked with a C library.
; ----------------------------------------------------------------------------

        global  main
        extern  printf

        section .text
main:
        push    message
        call    printf
        add     esp, 4
        ret
message:
        db      'Hello, World', 10, 0   ; line (LF) and C string (NUL) terminator

