	global	main

	extern	isqrt

	extern	printf
	extern	scanf



	section	.data

prompt:	db	'input > ',0
fmtint:	db	'%d',0
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

	push	rbp
	mov	rdi,	input
	call	isqrt
	pop	rbp

	push	rbp
	mov	rdi,	fmtint
	mov	rsi,	rax
	call	printf
	pop	rbp

	ret

