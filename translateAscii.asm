	;; PJ Ward
	;; cmsc313 homework 11
	;; UMBC id: JI68894
	;; class time: Mon/Wed 10:00-11:15

	SECTION .data
inputBuffer:
	db	0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
bytesToProcess:
	dd	0x8
newl:
	db	"",0Ah

	SECTION	.bss
outputBuffer:
	resb	80

	SECTION	.text
	global	_start

_start:

	xor	edi,edi
	xor	esi,esi
	xor	eax,eax
	xor	ecx,ecx
	xor	edx,edx

	mov	esi,0

	;; translate hex values and move them into outputBuffer
	call	translate

	;; print the values in outputBuffer
	mov	edx,edi
	mov	ecx,outputBuffer
	mov	ebx,1
	mov	eax,4
	int	80h

	;; advance to next line
	mov	ecx,newl
	mov	edx,1
	mov	ebx,1
	mov	eax,4
	int	80h

	;; end program
	mov	ebx,0
	mov	eax,1
	int	80h

translate:
	;; translate the next hex value
	mov	eax,[inputBuffer+esi]
	and	eax,0x00F0
	shr	eax,4
	add	eax,0x30
	;; and put the translated value in outputBuffer
	mov	[outputBuffer+edi],eax

	;; repeat until all eight values have been translated and moved to outbuf
	cmp	esi,8
	jz	finished
	add	esi,1
	add	edi,1
	jmp	translate

finished:
	ret
