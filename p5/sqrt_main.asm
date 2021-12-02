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



	section	.text

main:	push	prompt
	call	printf
	add	esp,	4

	push	input
	push	fmtint
	call	scanf
	add	esp,	8

	cmp	eax,	1
	je	_cont

	push	badinp
	call	printf
	add	esp,	4
	ret

 _cont:	mov	eax,	input
	call	isqrt

	push	eax
	push	fmtinl
	call	printf
	add	esp,	8

	ret

