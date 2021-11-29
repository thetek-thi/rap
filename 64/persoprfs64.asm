	global	main

	extern	fgets
	extern	printf
	extern	stdin



	section .data

fgmsg:	db	'perso number > ',0
pnr:	db	0,0,0,0,0,0,0,0,0,0,0
pnrx:	dw	0,0,0,0,0,0,0,0,0,0
fmtint:	db	'%c',10,0



	section .text

main:	push	rbp
	mov	rdi,	fgmsg
	call	printf
	pop	rbp

	; please enter a valid perso number because i ain't doing some validation here
	push	rbp
	mov	rdi,	pnr
	mov	rsi,	11
	mov	rdx,	[stdin]
	call	fgets
	pop	rbp

	push	rbp
	mov	rdi,	pnr
	call	printf
	pop	rbp

	push	rbp
	call	testpn
	pop	rbp

	ret



testpn:	mov	rcx,	10
 _l1:	mov	rax,	[pnr+rcx-1]
	sub	rax,	48
	cmp	rax,	10
	jng	_skip
	sub	rax,	7
 _skip:	mov	[pnr+rcx-1], rax
	loop	_l1

	ret

