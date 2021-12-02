	global	isqrt



	section	.data
lastn:	dq	0



	section	.text

isqrt:	; arguments: input (in rdi)
	mov	rax,	[rdi]
	mov	[lastn],	rax

 _loop:	mov	rax,	[rdi]
	mov	rbx,	[lastn]
	xor	rdx,	rdx
	div	rbx
	add	rax,	[lastn]
	shr	rax,	1
	mov	[lastn],	rax

	imul	rax,	rax
	cmp	rax,	[rdi]
	jg	_loop
	mov	rax,	[lastn]
	inc	rax
	imul	rax,	rax
	cmp	rax,	[rdi]
	jle	_loop

	mov	rax,	[lastn]

	ret

