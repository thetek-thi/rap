	global	main

	extern	isqrt

	extern	printf
	extern	scanf



	section	.data

prompt:	db	'input > ',0
badinp:	db	'please enter a number.',10,0
fmtint:	db	'%d',0
fmtinl:	db	'%d',10,0
input:	dd	0



	section .text

main:	; print input prompt
	push	rbp
	mov	rdi,	prompt
	call	printf
	pop	rbp

	; ask for input and store it in `input`
	push	rbp
	mov	rdi,	fmtint
	mov	rsi,	input
	call	scanf
	pop	rbp

	; if no number could be recognized, print error message and exit
	cmp	rax,	1
	je	_cont

	push	rbp
	mov	rdi,	badinp
	call	printf
	pop	rbp
	ret

 _cont:
 	; call isqrt()
 	push	rbp
	mov	rdi,	input
	call	isqrt
	pop	rbp

	; print result (in rax)
	push	rbp
	mov	rdi,	fmtinl
	mov	rsi,	rax
	call	printf
	pop	rbp

	ret

