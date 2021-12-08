	global	main

	extern	fgets
	extern	printf
	extern	stdin



	section	.data

prompt:	db	'perso number > ',0
pnr:	db	0,0,0,0,0,0,0,0,0,0,0
fmtint:	db	'%d',10,0



	section	.text

main:   ; print input prompt
	push	rbp
	mov	rdi,	prompt
	call	printf
	pop	rbp

	; get user input and store it in `pnr`
	push	rbp
	mov	rdi,	pnr
	mov	rsi,	11
	mov	rdx,	[stdin]
	call	fgets
	pop	rbp

	; replace last \n with a space
	mov	[pnr+9],	byte ' '

	; print the input
	push	rbp
	mov	rdi,	pnr
	call	printf
	pop	rbp

	call	testpn

	ret



testpn:	xor	rcx,	rcx
 _loop:	mov	rax,	[pnr+rcx]    ; access character in pnr[rcx]
	and	rax,	0xFF         ; mask that only keeps the last byte

	sub	rax,	48           ; subtract 48 to get from ascii number to digit
	cmp	rax,	10           ; if it is over 10 (a letter), subtract 7 to go from ascii
	jl	_skip                ;   letter (uppercase) to A->10, B->11, ...
	sub	rax,	7
 _skip:	mov	[pnr+rcx],	al   ; store last byte in pnr char array
	
	inc	rcx
	cmp	rcx,	10
	jne	_loop                ; loop through pnr char array
; end _loop

	xor	rax,	rax

	
	; 9 digits (abcdefghi) -> checksum = 7a*3b*c + 7d*3e*f + 7g*3h*i
	; this sould definitely be done *much* cleaner and smarter but
	; i'm lazy so i ain't doing it

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

	; print the checksum
	call	printrax

	ret



printrax:
	push	rbp
	mov	rdi,	fmtint
	mov	rsi,	rax
	call	printf
	pop	rbp
	ret

