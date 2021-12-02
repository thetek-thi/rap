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

main:	push	rbp
	mov	rdi,	prompt
	call	printf
	pop	rbp

	push	rbp
	mov	rdi,	fmtint
	mov	rsi,	input
	call	scanf
	pop	rbp

	cmp	rax,	1
	je	_cont

	push	rbp
	mov	rdi,	badinp
	call	printf
	pop	rbp
	ret

 _cont:	push	rbp
	mov	rdi,	input
	call	isqrt
	pop	rbp

	push	rbp
	mov	rdi,	fmtinl
	mov	rsi,	rax
	call	printf
	pop	rbp

	ret

