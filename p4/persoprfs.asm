	global	main

	extern	fgets
	extern	printf
	extern	stdin



	section	.data

prompt:	db	'perso number > ',0
pnr:	db	0,0,0,0,0,0,0,0,0,0,0
fmtint: db	'%c',10,0



	section	.text

main:	push	prompt
	call	printf
	add	esp,	4

	push	dword	[stdin]
	push	11
	push	pnr
	call	fgets
	add	esp,	12

	push	pnr
	call	printf
	add	esp,	4

	call	testpn

	ret



testpn:	mov	ecx,	10
 _loop:	mov	eax,	[pnr+ecx-1]
 	sub	eax,	48
	cmp	eax,	10
	jng	_skip
	sub	eax,	7
 _skip:	mov	[pnr+ecx-1], eax
 	loop	_loop

	ret

