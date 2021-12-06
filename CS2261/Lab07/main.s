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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #256
	ldr	r6, .L6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L6+4
	mov	lr, pc
	bx	r6
	mov	r3, #2448
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L6+8
	mov	lr, pc
	bx	r6
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L6+12
	ldr	r1, .L6+16
	mov	lr, pc
	bx	r6
	mov	r5, #67108864
	mov	r3, #56320
	mov	r4, #0
	mov	r0, #3
	strh	r3, [r5, #8]	@ movhi
	ldr	r2, .L6+20
	mov	r3, #256
	ldr	r1, .L6+24
	mov	lr, pc
	bx	r6
	mov	r6, #3
	ldr	r3, .L6+28
	ldr	r0, .L6+32
	ldr	r3, [r3]
	ldr	r1, .L6+36
	ldr	r2, .L6+40
	str	r4, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	ldr	r2, .L6+44
	str	r1, [r3, #44]
	mov	lr, pc
	bx	r2
	mov	r3, #4352
	mov	r8, #32
	mov	r7, #1
	mov	r10, #104
	mov	r9, #100
	mov	r1, r4
	mov	lr, r6
	mov	r2, #156
	mov	r0, #16
	mov	ip, #142
	strh	r3, [r5]	@ movhi
	ldr	r3, .L6+48
	stm	r3, {r9, r10}
	str	r4, [r3, #24]
	str	r4, [r3, #36]
	str	r4, [r3, #28]
	str	r8, [r3, #16]
	str	r8, [r3, #20]
	str	r7, [r3, #12]
	str	r7, [r3, #8]
	str	r6, [r3, #40]
	ldr	r3, .L6+52
.L2:
	str	r2, [r3, #4]
	sub	r2, r2, #32
	cmp	r2, #28
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	lr, [r3, #40]
	str	r1, [r3, #28]
	add	r3, r3, #44
	bne	.L2
	mov	r1, #134
	mov	r2, #172
	ldr	r3, .L6+56
	ldr	r0, .L6+60
	ldrh	ip, [r3, #48]
	ldr	r3, .L6+64
	strh	ip, [r0]	@ movhi
	stm	r3, {r1, r2}
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	DMANow
	.word	pikminBgPal
	.word	pikminBgTiles
	.word	100720640
	.word	pikminBgMap
	.word	83886592
	.word	spritesheetPal
	.word	dma
	.word	100745216
	.word	-2147483392
	.word	spritesheetTiles
	.word	hideSprites
	.word	pikmin
	.word	buriedPikmin
	.word	67109120
	.word	buttons
	.word	.LANCHOR0
	.size	initialize, .-initialize
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L30
	mov	lr, pc
	bx	r3
	ldr	r8, .L30+4
	ldr	r9, .L30+8
	ldr	r7, .L30+12
	ldr	fp, .L30+16
	ldr	r6, .L30+20
	ldr	r5, .L30+24
	ldr	r4, .L30+28
	ldr	r10, .L30+32
	b	.L19
.L28:
	mov	r1, #3
	ldr	r3, [r9]
	sub	r0, r3, #1
	str	r0, [r9]
	ldrh	r0, [r10, #48]
	tst	r0, #16
	str	r1, [r8, #28]
	bne	.L17
.L14:
	mov	r1, #2
	str	r3, [r9]
	str	r1, [r8, #28]
.L17:
	add	r2, r2, #1
	str	r2, [r8, #24]
.L18:
	mov	lr, pc
	bx	r7
	mov	r1, #0
	mov	r2, #67108864
	mov	lr, #117440512
	ldr	r3, [fp]
	ldrh	r0, [r9]
	str	r1, [r3, #44]
	ldr	ip, .L30+36
	ldrh	r1, [r9, #4]
	str	r6, [r3, #36]
	str	lr, [r3, #36]
	str	ip, [r3, #44]
	strh	r0, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
.L19:
	ldr	r3, [r8, #28]
	cmp	r3, #4
	movne	r2, #4
	strne	r2, [r8, #28]
	ldr	r2, [r8, #24]
	strne	r3, [r8, #32]
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r5, r3
	cmp	r3, r4
	bcc	.L27
.L10:
	ldrh	r3, [r10, #48]
	ands	r3, r3, #64
	ldreq	r1, [r9, #4]
	streq	r3, [r8, #28]
	ldrh	r3, [r10, #48]
	subeq	r1, r1, #1
	streq	r1, [r9, #4]
	tst	r3, #128
	moveq	r1, #1
	ldreq	r3, [r9, #4]
	addeq	r3, r3, r1
	streq	r3, [r9, #4]
	ldrh	r3, [r10, #48]
	streq	r1, [r8, #28]
	tst	r3, #32
	beq	.L28
	ldrh	r3, [r10, #48]
	tst	r3, #16
	beq	.L29
	ldr	r3, [r8, #28]
	cmp	r3, #4
	bne	.L17
	mov	r2, #0
	ldr	r3, [r8, #32]
	str	r2, [r8, #36]
	str	r3, [r8, #28]
	b	.L18
.L27:
	ldr	r1, [r8, #40]
	cmp	r1, #0
	ldrgt	r3, [r8, #36]
	addgt	r3, r3, r1
	strgt	r3, [r8, #36]
	b	.L10
.L29:
	ldr	r3, [r9]
	add	r3, r3, #1
	b	.L14
.L31:
	.align	2
.L30:
	.word	initialize
	.word	pikmin
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	dma
	.word	shadowOAM
	.word	143165576
	.word	286331153
	.word	67109120
	.word	-2147483136
	.size	main, .-main
	.comm	buriedPikmin,176,4
	.comm	pikmin,44,4
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
