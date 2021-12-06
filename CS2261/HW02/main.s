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
	.global	drawChar
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar, %function
drawChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r1
	mov	fp, r3
	mov	r6, #0
	ldr	r9, .L13
	sub	sp, sp, #12
	add	r2, r2, r2, lsl #1
	str	r0, [sp, #4]
	ldr	r8, .L13+4
	add	r9, r9, r2, lsl #4
.L2:
	mov	r4, #6
	ldr	r3, [sp, #4]
	add	r5, r9, r6
	add	r7, r3, r4
	b	.L4
.L3:
	subs	r4, r4, #1
	beq	.L12
.L4:
	ldrb	ip, [r5], #1	@ zero_extendqisi2
	cmp	ip, #0
	beq	.L3
	sub	r0, r7, r4
	mov	r2, fp
	mov	r1, r10
	mov	lr, pc
	bx	r8
	subs	r4, r4, #1
	bne	.L4
.L12:
	add	r6, r6, #6
	cmp	r6, #48
	add	r10, r10, #1
	bne	.L2
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	fontdata_6x8
	.word	setPixel
	.size	drawChar, .-drawChar
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #67108864
	mov	fp, #0
	ldr	r1, .L17
	ldr	r2, .L17+4
	strh	r1, [r3]	@ movhi
	ldr	r3, .L17+8
	ldrh	ip, [r2, #48]
	mov	r8, #31
	ldr	r1, .L17+12
	ldr	r2, .L17+16
	mov	r0, fp
	strh	ip, [r3]	@ movhi
	ldr	r3, .L17+20
	strh	fp, [r1]	@ movhi
	strh	fp, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	lr, #120
	mov	r4, #30
	mov	ip, #230
	ldr	r3, .L17+24
	mov	r10, #10
	str	fp, [r3]
	ldr	r3, .L17+28
	mov	r9, #35
	str	fp, [r3]
	ldr	r3, .L17+32
	mov	r1, #20
	str	fp, [r3]
	ldr	r3, .L17+36
	ldr	r0, .L17+40
	str	fp, [r3]
	ldr	r3, .L17+44
	str	fp, [r3]
	ldr	r3, [r0]
	mov	r7, #3
	add	r3, r3, r3, lsr r8
	ldr	fp, .L17+48
	asr	r3, r3, #1
	sub	r3, lr, r3
	mov	r2, #2
	str	r4, [r0]
	str	r3, [fp]
	ldr	r0, .L17+52
	ldr	fp, .L17+56
	mov	r6, #992
	mvn	r5, #2
	str	r3, [fp]
	ldr	r3, [r0]
	add	r3, r3, r3, lsr r8
	str	r4, [r0]
	asr	r3, r3, #1
	ldr	r0, .L17+60
	rsb	r3, r3, #60
	str	r3, [r0]
	ldr	r0, .L17+64
	str	r3, [r0]
	ldr	r3, .L17+68
	str	lr, [r3]
	ldr	r3, .L17+72
	str	lr, [r3]
	ldr	r3, .L17+76
	str	ip, [r3]
	ldr	r3, .L17+80
	str	ip, [r3]
	ldr	r3, .L17+84
	str	r10, [r3]
	ldr	r3, .L17+88
	str	r9, [r3]
	ldr	r3, .L17+92
	str	r1, [r3]
	ldr	r3, .L17+96
	str	r1, [r3]
	ldr	r3, .L17+100
	strh	r8, [r3]	@ movhi
	ldr	r3, .L17+104
	ldr	r1, .L17+108
	str	r7, [r3]
	ldr	r3, .L17+112
	str	r2, [r1]
	str	r2, [r3]
	ldr	r0, .L17+116
	ldr	r3, .L17+120
	ldr	r1, .L17+124
	ldr	r2, .L17+128
	strh	r6, [r0]	@ movhi
	str	r5, [r1]
	strh	r2, [r3]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	1027
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	backgroundColor
	.word	fillScreen
	.word	brRow
	.word	brOldRow
	.word	grRow
	.word	grOldRow
	.word	brWidth
	.word	time
	.word	brCol
	.word	grWidth
	.word	brOldCol
	.word	grCol
	.word	grOldCol
	.word	pCol
	.word	pOldCol
	.word	pRow
	.word	pOldRow
	.word	pHeight
	.word	pWidth
	.word	brHeight
	.word	grHeight
	.word	brColor
	.word	brVelX
	.word	brVelY
	.word	grVelY
	.word	grColor
	.word	pColor
	.word	grVelX
	.word	32736
	.size	initialize, .-initialize
	.global	__aeabi_idivmod
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L50
	ldr	r3, [r3]
	cmn	r3, #1
	sub	sp, sp, #28
	beq	.L45
	cmp	r3, #5
	beq	.L46
	ldr	r6, .L50+4
	ldr	r3, [r6]
	cmp	r3, #1
	movle	r2, #1
	ldrle	r1, .L50+8
	strle	r3, [r1]
	movle	r3, r2
	strle	r2, [r6]
	ldr	r2, .L50+12
	ldr	r2, [r2]
	add	r1, r2, r3
	cmp	r1, #238
	ldrgt	r1, .L50+8
	ldr	r10, .L50+16
	strgt	r3, [r1]
	ldr	r3, [r10]
	rsbgt	r2, r2, #239
	strgt	r2, [r6]
	cmp	r3, #0
	movlt	r2, #0
	ldrlt	r1, .L50+20
	strlt	r3, [r1]
	movlt	r3, r2
	strlt	r2, [r10]
	ldr	r2, .L50+24
	ldr	r2, [r2]
	add	r1, r2, r3
	cmp	r1, #160
	ldrgt	r1, .L50+20
	ldr	r4, .L50+28
	strgt	r3, [r1]
	ldr	r3, [r4]
	rsbgt	r2, r2, #156
	strgt	r2, [r10]
	cmp	r3, #1
	movle	r1, #1
	ldrle	r2, .L50+32
	strle	r3, [r2]
	movle	r3, r1
	ldrle	r8, .L50+36
	ldrle	r2, [r8]
	ldr	fp, .L50+40
	rsble	r2, r2, #0
	strle	r2, [r8]
	ldr	r2, [fp]
	strle	r1, [r4]
	add	r1, r2, r3
	ldrgt	r8, .L50+36
	cmp	r1, #238
	ble	.L28
	ldr	r1, [r8]
	rsb	r2, r2, #240
	str	r2, [r4]
	ldr	r2, .L50+32
	rsb	r1, r1, #0
	str	r1, [r8]
	str	r3, [r2]
.L28:
	ldr	r5, .L50+44
	ldr	r3, [r5]
	cmp	r3, #160
	bgt	.L47
.L29:
	ldr	r7, .L50+48
	ldr	ip, [r7]
	cmp	ip, #1
	movle	r2, #1
	ldrle	r3, .L50+52
	strle	ip, [r3]
	movle	ip, r2
	ldrle	r9, .L50+56
	ldrle	r3, [r9]
	rsble	r3, r3, #0
	strle	r3, [r9]
	ldr	r3, .L50+60
	ldr	r3, [r3]
	strle	r2, [r7]
	add	r2, r3, ip
	ldrgt	r9, .L50+56
	cmp	r2, #238
	ble	.L31
	ldr	r2, [r9]
	ldr	r1, .L50+52
	rsb	r2, r2, #0
	str	ip, [r1]
	rsb	ip, r3, #239
	str	r2, [r9]
	str	ip, [r7]
.L31:
	ldr	r2, .L50+64
	ldr	r2, [r2]
	cmp	r2, #160
	bgt	.L48
.L32:
	ldr	r1, .L50+68
	ldrh	r1, [r1, #48]
	tst	r1, #16
	ldr	r0, [r6]
	ldreq	r1, .L50+8
	streq	r0, [r1]
	ldr	r1, .L50+68
	ldrh	r1, [r1, #48]
	addeq	r0, r0, #10
	streq	r0, [r6]
	ldr	lr, .L50+72
	tst	r1, #32
	ldreq	r1, .L50+8
	ldr	lr, [lr]
	streq	r0, [r1]
	ldr	r1, .L50+76
	add	r2, r2, lr
	ldr	lr, [r9]
	ldr	r1, [r1]
	str	r3, [sp, #8]
	ldr	r3, .L50+80
	add	ip, ip, lr
	ldr	lr, [r5]
	ldr	r3, [r3]
	str	r2, [sp, #4]
	add	r1, lr, r1
	str	r1, [sp, #20]
	ldr	lr, [r4]
	ldr	r1, .L50+64
	str	r3, [sp, #12]
	ldr	r3, [r8]
	str	ip, [sp]
	add	lr, lr, r3
	str	r2, [r1]
	ldr	r3, .L50+24
	ldr	r1, [sp, #20]
	ldr	r2, .L50+12
	subeq	r0, r0, #10
	str	r1, [r5]
	str	ip, [r7]
	ldr	r3, [r3]
	ldr	r2, [r2]
	ldr	r1, [r10]
	str	lr, [r4]
	ldr	ip, .L50+84
	streq	r0, [r6]
	mov	lr, pc
	bx	ip
	cmp	r0, #1
	beq	.L49
.L35:
	ldr	r3, .L50+88
	ldr	ip, [fp]
	ldr	lr, [r3]
	ldr	r2, .L50+12
	ldr	r3, .L50+24
	ldr	r2, [r2]
	ldr	r3, [r3]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r5]
	ldr	ip, [r4]
	ldr	r1, [r10]
	stm	sp, {ip, lr}
	ldr	r0, [r6]
	ldr	ip, .L50+84
	mov	lr, pc
	bx	ip
	cmp	r0, #1
	beq	.L36
.L44:
	ldr	r0, [r4]
	ldr	r1, [r5]
	ldr	r2, [fp]
.L37:
	ldr	r3, .L50+80
	ldr	r4, [r3]
	ldr	r3, .L50+60
	ldr	lr, [r3]
	ldr	r3, .L50+64
	ldr	ip, [r3]
	ldr	r3, [r7]
	stm	sp, {r3, ip, lr}
	str	r4, [sp, #12]
	ldr	r3, .L50+88
	ldr	ip, .L50+84
	ldr	r3, [r3]
	mov	lr, pc
	bx	ip
	cmp	r0, #1
	bne	.L19
	ldr	r2, [r8]
	ldr	r3, [r9]
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	str	r2, [r8]
	str	r3, [r9]
.L19:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L36:
	mov	r1, #0
	ldr	ip, .L50
	ldr	r0, [ip]
	ldr	r2, [fp]
	add	r0, r0, #1
	str	r0, [ip]
	lsl	r3, r0, #24
	add	r0, r2, r2, lsr #31
	asr	r3, r3, #24
	ldr	ip, .L50+92
	asr	r0, r0, #1
	rsb	r0, r0, #120
	cmp	r3, #5
	strb	r3, [ip]
	str	r0, [r4]
	str	r1, [r5]
	bne	.L37
	mov	r3, #992
	mov	r2, #87
	mov	r1, #80
	mov	r0, #120
	bl	drawChar
	b	.L44
.L48:
	mov	r3, #0
	ldr	lr, .L50+64
	ldr	r0, .L50+96
	str	r3, [lr]
	ldr	r1, .L50+52
	ldr	r3, .L50+100
	str	r2, [r0]
	str	ip, [r1]
	ldr	r0, .L50+104
	ldr	r1, [r3]
	ldr	r3, .L50+108
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+112
	str	r1, [r7]
	mov	lr, pc
	bx	r3
	ldr	lr, .L50+64
	ldr	r3, .L50+60
	ldr	r2, [lr]
	ldr	ip, [r7]
	ldr	r3, [r3]
	b	.L32
.L47:
	mov	r1, #0
	ldr	r0, .L50+116
	ldr	r2, .L50+32
	str	r1, [r5]
	str	r3, [r0]
	ldr	r1, [r4]
	ldr	r3, .L50+100
	str	r1, [r2]
	ldr	r0, .L50+104
	ldr	r1, [r3]
	ldr	r3, .L50+108
	mov	lr, pc
	bx	r3
	ldr	r3, [r8]
	ldr	r2, .L50+112
	rsb	r3, r3, #0
	str	r1, [r4]
	str	r3, [r8]
	mov	lr, pc
	bx	r2
	b	.L29
.L45:
	mov	r3, #0
	ldr	r2, .L50+120
	ldr	lr, .L50+72
	strh	r3, [r2]	@ movhi
	ldr	ip, .L50+56
	ldr	r0, .L50+124
	ldr	r1, .L50+76
	ldr	r2, .L50+36
	str	r3, [lr]
	str	r3, [ip]
	strh	r3, [r0]	@ movhi
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L49:
	mvn	r0, #0
	mov	r2, #230
	mov	r1, #100
	ldr	ip, .L50+92
	ldr	lr, .L50
	str	r2, [r10]
	str	r1, [r6]
	str	r0, [lr]
	strb	r0, [ip]
	mov	r3, #31
	mov	r2, #76
	mov	r1, #80
	mov	r0, #120
	bl	drawChar
	b	.L35
.L46:
	mov	r3, #0
	ldr	r1, .L50+120
	ldr	r2, .L50+72
	strh	r3, [r1]	@ movhi
	str	r3, [r2]
	ldr	lr, .L50+56
	ldr	ip, .L50+124
	ldr	r0, .L50+76
	ldr	r1, .L50+36
	ldr	r2, .L50+128
	str	r3, [lr]
	strh	r3, [ip]	@ movhi
	str	r3, [r0]
	str	r3, [r1]
	strh	r3, [r2]	@ movhi
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	score
	.word	pCol
	.word	pOldCol
	.word	pWidth
	.word	pRow
	.word	pOldRow
	.word	pHeight
	.word	grCol
	.word	grOldCol
	.word	grVelX
	.word	grWidth
	.word	grRow
	.word	brCol
	.word	brOldCol
	.word	brVelX
	.word	brWidth
	.word	brRow
	.word	67109120
	.word	brVelY
	.word	grVelY
	.word	brHeight
	.word	collision
	.word	grHeight
	.word	gameState
	.word	brOldRow
	.word	time
	.word	99999
	.word	__aeabi_idivmod
	.word	waitForVBlank
	.word	grOldRow
	.word	brColor
	.word	grColor
	.word	pColor
	.size	updateGame, .-updateGame
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L54
	ldrh	r3, [r9]
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r6, .L54+4
	ldr	r5, .L54+8
	ldr	r1, .L54+12
	ldr	r0, .L54+16
	ldr	r4, .L54+20
	ldr	r3, [r6]
	ldr	r2, [r5]
	ldr	r1, [r1]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r9]
	ldr	ip, .L54+24
	str	r3, [sp]
	ldr	r8, .L54+28
	ldr	r7, .L54+32
	ldr	r10, .L54+36
	ldr	r1, [ip]
	ldr	r3, [r8]
	ldr	r2, [r7]
	ldr	r0, [r10]
	mov	lr, pc
	bx	r4
	ldrh	r3, [r9]
	ldr	fp, .L54+40
	str	r3, [sp]
	ldr	r10, .L54+44
	ldr	r9, .L54+48
	ldr	r0, .L54+52
	ldr	r3, [fp]
	ldr	r2, [r10]
	ldr	r1, [r9]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+56
	ldrh	r1, [r3]
	ldr	r2, [r5]
	ldr	r3, [r6]
	ldr	r9, .L54+60
	str	r1, [sp]
	ldr	r5, .L54+64
	ldr	r0, [r9]
	ldr	r1, [r5]
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+68
	ldrh	r1, [r3]
	ldr	r2, [r7]
	ldr	r3, [r8]
	ldr	r6, .L54+72
	str	r1, [sp]
	ldr	r5, .L54+76
	ldr	r1, [r6]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+80
	ldrh	r1, [r3]
	ldr	r2, [r10]
	ldr	r8, .L54+84
	str	r1, [sp]
	ldr	r7, .L54+88
	ldr	r3, [fp]
	ldr	r1, [r8]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+64
	ldr	r4, .L54+12
	ldr	lr, [r3]
	ldr	ip, [r9]
	ldr	r0, [r8]
	str	lr, [r4]
	ldr	r9, .L54+48
	ldr	lr, .L54+16
	ldr	r1, [r7]
	ldr	r2, [r6]
	ldr	r3, [r5]
	str	ip, [lr]
	str	r0, [r9]
	ldr	ip, .L54+24
	ldr	r0, .L54+52
	ldr	r10, .L54+36
	str	r1, [r0]
	str	r2, [ip]
	str	r3, [r10]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	backgroundColor
	.word	pHeight
	.word	pWidth
	.word	pOldRow
	.word	pOldCol
	.word	drawRect
	.word	brOldRow
	.word	brHeight
	.word	brWidth
	.word	brOldCol
	.word	grHeight
	.word	grWidth
	.word	grOldRow
	.word	grOldCol
	.word	pColor
	.word	pCol
	.word	pRow
	.word	brColor
	.word	brRow
	.word	brCol
	.word	grColor
	.word	grRow
	.word	grCol
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L60
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	ldr	fp, .L60+8
	ldr	r3, [r4]
	ldr	r10, .L60+12
	ldr	r5, .L60+16
	ldr	r9, .L60+20
	ldr	r8, .L60+24
	ldr	r7, .L60+28
	ldr	r6, .L60+32
.L58:
	smull	r1, r2, r7, r3
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, lsl #1
	cmp	r3, r2
	moveq	lr, pc
	bxeq	fp
.L57:
	ldrh	r3, [r5]
	strh	r3, [r10]	@ movhi
	ldrh	r3, [r6, #48]
	strh	r3, [r5]	@ movhi
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r8
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	b	.L58
.L61:
	.align	2
.L60:
	.word	time
	.word	initialize
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	draw
	.word	1431655766
	.word	67109120
	.size	main, .-main
	.comm	gameState,1,1
	.comm	grColor,2,2
	.comm	grVelY,4,4
	.comm	grVelX,4,4
	.comm	grOldCol,4,4
	.comm	grOldRow,4,4
	.comm	grWidth,4,4
	.comm	grHeight,4,4
	.comm	grRow,4,4
	.comm	grCol,4,4
	.comm	brColor,2,2
	.comm	brVelY,4,4
	.comm	brVelX,4,4
	.comm	brOldCol,4,4
	.comm	brOldRow,4,4
	.comm	brWidth,4,4
	.comm	brHeight,4,4
	.comm	brRow,4,4
	.comm	brCol,4,4
	.comm	pColor,2,2
	.comm	pOldCol,4,4
	.comm	pOldRow,4,4
	.comm	pWidth,4,4
	.comm	pHeight,4,4
	.comm	pRow,4,4
	.comm	pCol,4,4
	.comm	score,4,4
	.comm	time,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	backgroundColor,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
