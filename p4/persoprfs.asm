	global	main

	extern	fgets
	extern	printf
	extern	stdin



	section	.data

prompt:	db	'perso number > ',0
pnr:	db	0,0,0,0,0,0,0,0,0,0,0
fmtint: db	'%d',10,0



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



testpn:	xor	ecx,	ecx
 _loop:	mov	eax,	[pnr+ecx]
	and	eax,	0x000000FF

	sub	eax,	48
	cmp	eax,	10
	jl	_skip
	sub	eax,	7
 _skip: mov	[pnr+ecx],	al

	inc	ecx
	cmp	ecx,	10
	jne	_loop

	ret

