	global	main

	extern	fgets
	extern	printf
	extern	stdin



	section	.data

prompt:	db	'perso number > ',0
pnr:	db	0,0,0,0,0,0,0,0,0,0,0
fmtint:	db	'%d',10,0



	section	.text

main:	push	rbp
	mov	rdi,	prompt
	call	printf
	pop	rbp

	push	rbp
	mov	rdi,	pnr
	mov	rsi,	11
	mov	rdx,	[stdin]
	call	fgets
	pop	rbp

	mov	[pnr+9],	byte ' '

	push	rbp
	mov	rdi,	pnr
	call	printf
	pop	rbp

	call	testpn

	ret



testpn:	xor	rcx,	rcx
 _loop:	mov	rax,	[pnr+rcx]
	and	rax,	0xFF ; mask that only keeps the last byte

	sub	rax,	48
	cmp	rax,	10
	jl	_skip
	sub	rax,	7
 _skip:	mov	[pnr+rcx],	al
	
	inc	rcx
	cmp	rcx,	10
	jne	_loop
; end _loop

	xor	rax,	rax

	
	mov	rdx,	[pnr+0]
	and	rdx,	0xFF
	imul	rdx,	7
	add	rax,	rdx

	mov	rdx,	[pnr+1]
	and	rdx,	0xFF
	imul	rdx,	3
	add	rax,	rdx

	mov	rdx,	[pnr+2]
	and	rdx,	0xFF
	add	rax,	rdx


	mov	rdx,	[pnr+3]
	and	rdx,	0xFF
	imul	rdx,	7
	add	rax,	rdx

	mov	rdx,	[pnr+4]
	and	rdx,	0xFF
	imul	rdx,	3
	add	rax,	rdx

	mov	rdx,	[pnr+5]
	and	rdx,	0xFF
	add	rax,	rdx


	mov	rdx,	[pnr+6]
	and	rdx,	0xFF
	imul	rdx,	7
	add	rax,	rdx

	mov	rdx,	[pnr+7]
	and	rdx,	0xFF
	imul	rdx,	3
	add	rax,	rdx

	mov	rdx,	[pnr+8]
	and	rdx,	0xFF
	add	rax,	rdx

	mov	rbx,	10
	mov	rcx,	rax
	xor	rdx,	rdx
	div	rbx
	mov	rax,	rdx

	call	printrax

	ret



printrax:
	push	rbp
	mov	rdi,	fmtint
	mov	rsi,	rax
	call	printf
	pop	rbp
	ret

