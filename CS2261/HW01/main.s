	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r1, .L4
	ldr	r0, .L4+4
	ldr	r2, .L4+8
	push	{r4, lr}
	strh	r1, [r3]	@ movhi
	ldr	r3, .L4+12
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r1, #6
	mov	lr, #8
	mov	r2, #77
	mov	r3, #116
	mov	ip, #2
	mov	r0, #0
	ldr	r4, .L4+16
	str	r1, [r4]
	ldr	r4, .L4+20
	str	r1, [r4]
	ldr	r1, .L4+24
	str	lr, [r1]
	ldr	lr, .L4+28
	ldr	r1, .L4+32
	str	r2, [lr]
	str	r2, [r1]
	ldr	r4, .L4+36
	ldr	lr, .L4+40
	ldr	r1, .L4+44
	ldr	r2, .L4+48
	str	r3, [r4]
	str	r3, [lr]
	str	ip, [r1]
	str	r0, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	32736
	.word	bgColor
	.word	fillScreen
	.word	bHeight
	.word	bVy
	.word	bWidth
	.word	bRow
	.word	bOldRow
	.word	bCol
	.word	bOldCol
	.word	bVx
	.word	time
	.size	initialize, .-initialize
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L14
	ldr	ip, .L14+4
	ldr	r2, [lr]
	ldr	r5, .L14+8
	ldr	r3, [ip]
	ldr	r6, .L14+12
	ldr	r1, .L14+16
	cmp	r2, #1
	str	r2, [r5]
	str	r3, [r6]
	ldr	r0, [r1]
	bgt	.L7
	ldr	r7, .L14+20
	ldr	r2, .L14+24
	ldrh	r8, [r7]
	cmp	r8, r2
	ldr	r4, .L14+28
	movne	r4, #31
	mov	r2, #1
	rsb	r0, r0, #0
	str	r0, [r1]
	strh	r4, [r7]	@ movhi
.L7:
	ldr	r4, .L14+32
	ldr	r4, [r4]
	add	r7, r4, r2
	cmp	r7, #238
	ble	.L9
	mov	r7, #992
	rsb	r0, r0, #0
	str	r0, [r1]
	ldr	r1, .L14+20
	strh	r7, [r1]	@ movhi
	str	r2, [r5]
	rsb	r2, r4, #239
.L9:
	ldr	r4, .L14+36
	cmp	r3, #3
	ldr	r1, [r4]
	bgt	.L10
	mov	r7, #31744
	mov	r3, #3
	ldr	r5, .L14+20
	rsb	r1, r1, #0
	str	r1, [r4]
	strh	r7, [r5]	@ movhi
.L10:
	ldr	r5, .L14+40
	ldr	r5, [r5]
	add	r7, r5, r3
	cmp	r7, #156
	ble	.L11
	rsb	r1, r1, #0
	ldr	r7, .L14+20
	str	r1, [r4]
	ldr	r4, .L14+24
	strh	r4, [r7]	@ movhi
	str	r3, [r6]
	rsb	r3, r5, #157
.L11:
	add	r2, r2, r0
	add	r3, r3, r1
	str	r2, [lr]
	str	r3, [ip]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	bCol
	.word	bRow
	.word	bOldCol
	.word	bOldRow
	.word	bVx
	.word	.LANCHOR0
	.word	31775
	.word	1023
	.word	bWidth
	.word	bVy
	.word	bHeight
	.size	update, .-update
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L18
	ldr	r10, .L18+4
	ldrh	r3, [r3]
	ldr	r9, .L18+8
	ldr	r5, .L18+12
	ldr	r4, .L18+16
	sub	sp, sp, #8
	str	r3, [sp]
	ldr	r2, [r9]
	ldr	r3, [r10]
	ldr	r1, [r5]
	ldr	r0, [r4]
	ldr	r8, .L18+20
	mov	lr, pc
	bx	r8
	ldr	r3, .L18+24
	ldr	r7, .L18+28
	ldrh	r1, [r3]
	ldr	r6, .L18+32
	ldr	r3, [r10]
	ldr	r2, [r9]
	str	r1, [sp]
	ldr	r0, [r6]
	ldr	r1, [r7]
	mov	lr, pc
	bx	r8
	ldr	r2, [r7]
	ldr	r3, [r6]
	str	r2, [r5]
	str	r3, [r4]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	bgColor
	.word	bHeight
	.word	bWidth
	.word	bOldRow
	.word	bOldCol
	.word	drawRect
	.word	.LANCHOR0
	.word	bRow
	.word	bCol
	.size	draw, .-draw
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r8, .L29
	ldr	r3, .L29+4
	mov	lr, pc
	bx	r3
	ldr	r7, .L29+8
	ldr	r3, [r8]
	ldr	r6, .L29+12
	ldr	r5, .L29+16
	ldr	r4, .L29+20
.L24:
	smull	r1, r2, r4, r3
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	beq	.L28
.L21:
	ldr	r3, [r6, #4]
.L22:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L22
.L23:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L23
	mov	lr, pc
	bx	r5
	ldr	r3, [r8]
	add	r3, r3, #1
	str	r3, [r8]
	b	.L24
.L28:
	mov	lr, pc
	bx	r7
	b	.L21
.L30:
	.align	2
.L29:
	.word	time
	.word	initialize
	.word	update
	.word	.LANCHOR0
	.word	draw
	.word	1431655766
	.size	main, .-main
	.text
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldr	r3, [r3, #4]
.L32:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L32
.L33:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L33
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	waitForVBlank, .-waitForVBlank
	.global	scanlineCounter
	.global	bColor
	.comm	bgColor,2,2
	.comm	bVy,4,4
	.comm	bVx,4,4
	.comm	bWidth,4,4
	.comm	bHeight,4,4
	.comm	bCDel,4,4
	.comm	bRDel,4,4
	.comm	bOldCol,4,4
	.comm	bOldRow,4,4
	.comm	bCol,4,4
	.comm	bRow,4,4
	.comm	time,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	bColor, %object
	.size	bColor, 2
bColor:
	.short	31744
	.space	2
	.type	scanlineCounter, %object
	.size	scanlineCounter, 4
scanlineCounter:
	.word	67108870
	.ident	"GCC: (devkitARM release 53) 9.1.0"
