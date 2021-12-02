	global	isqrt



	section	.data
last:	dq	0
orig:	dq	0



	section	.text

isqrt:	; arguments: input (in eax)
	mov	[last],	eax
	mov	[orig],	eax

 _loop:	mov	eax,	[orig]
 	mov	ebx,	[last]
	xor	edx,	edx
	div	ebx
	add	eax,	[last]
	shr	eax,	1
	mov	[last],	eax

	imul	eax,	eax
	cmp	eax,	[orig]
	jg	_loop
	mov	eax,	[last]
	inc	eax
	imul	eax,	eax
	cmp	eax,	[orig]
	jle	_loop

	mov	eax,	[last]

	ret

