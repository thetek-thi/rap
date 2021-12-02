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

	mov	[pnr+9],	byte ' '

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
; end _loop

	xor	eax,	eax


	mov	edx,	[pnr+0]
	shl	edx,	24
	shr	edx,	24
	imul	edx,	7
	add	eax,	edx

	mov	edx,	[pnr+1]
	shl	edx,	24
	shr	edx,	24
	imul	edx,	3
	add	eax,	edx

	mov	edx,	[pnr+2]
	shl	edx,	24
	shr	edx,	24
	add	eax,	edx


	mov	edx,	[pnr+3]
	shl	edx,	24
	shr	edx,	24
	imul	edx,	7
	add	eax,	edx

	mov	edx,	[pnr+4]
	shl	edx,	24
	shr	edx,	24
	imul	edx,	3
	add	eax,	edx

	mov	edx,	[pnr+5]
	shl	edx,	24
	shr	edx,	24
	add	eax,	edx
	

	mov	edx,	[pnr+6]
	shl	edx,	24
	shr	edx,	24
	imul	edx,	7
	add	eax,	edx

	mov	edx,	[pnr+7]
	shl	edx,	24
	shr	edx,	24
	imul	edx,	3
	add	eax,	edx

	mov	edx,	[pnr+8]
	shl	edx,	24
	shr	edx,	24
	add	eax,	edx

	mov	ebx,	10
	mov	ecx,	eax
	xor	edx,	edx
	div	ebx
	mov	eax,	edx


	push	eax
	push	fmtint
	call	printf
	add	esp,	8

	ret

