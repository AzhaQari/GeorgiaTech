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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRona.part.0, %function
updateRona.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L13
	ldmib	r0, {r0, r2}
	ldr	r3, [r5]
	sub	r0, r0, r2
	cmp	r0, #232
	ldrls	r1, [r4]
	asr	r3, r3, #8
	subhi	r1, r3, #20
	rsbhi	r2, r2, #0
	strhi	r2, [r4, #8]
	sub	r2, r1, #1
	strhi	r1, [r4]
	cmp	r2, #139
	ldrhi	r2, [r4, #12]
	rsbhi	r2, r2, #0
	strhi	r2, [r4, #12]
	ldr	lr, [r5, #16]
	ldr	r2, [r5, #8]
	ldr	ip, [r5, #20]
	sub	sp, sp, #16
	str	r0, [r4, #4]
	stm	sp, {r2, r3, ip, lr}
	ldr	r6, .L13+4
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L5
	mov	r1, #0
	ldr	r2, .L13+8
	ldr	r3, [r2]
	sub	r3, r3, #3
	str	r3, [r2]
	str	r1, [r4, #24]
.L5:
	ldr	r2, [r5]
	ldr	r3, [r4]
	add	r1, r2, #4
	cmp	r1, r3
	blt	.L6
	ldr	r2, [r4, #12]
	add	r3, r2, r3
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L6:
	sub	r2, r2, #4
	cmp	r3, r2
	ldrge	r2, [r4, #12]
	subge	r3, r3, r2
	strge	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.word	collision
	.word	health
	.size	updateRona.part.0, .-updateRona.part.0
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L21
	push	{r4, r5, r6, lr}
	ldr	r3, [r2, #8]
	ldr	r6, .L21+4
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	ldr	r4, .L21+8
	and	r3, r3, r6
	ldr	r5, .L21+12
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r2, .L21+16
	ldr	r3, [r2, #24]
	cmp	r3, #0
	beq	.L15
	mov	r1, #1
	ldr	r3, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	and	r3, r3, r6
	strh	r3, [r4, #10]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r1, [r4, #12]	@ movhi
	mov	lr, pc
	bx	r5
.L15:
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	player
	.word	511
	.word	shadowOAM
	.word	waitForVBlank
	.word	rona
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r1, #1
	mov	lr, #15360
	mov	r2, #8
	mov	ip, #20
	mov	r0, #3
	ldr	r3, .L25
	str	lr, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #24]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L26:
	.align	2
.L25:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L68
	push	{r4, r5, r6, r7, lr}
	ldm	r1, {r4, lr}
	ldr	r3, [r1, #16]
	add	r5, r4, lr
	add	r2, r3, r5, asr #8
	ldr	r0, [r1, #8]
	sub	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	ldr	ip, .L68+4
	add	r6, r0, r2, lsl #4
	lsl	r6, r6, #1
	ldrh	r6, [ip, r6]
	cmp	r6, #0
	beq	.L28
	ldr	r6, [r1, #20]
	lsl	r2, r2, #4
	add	r2, r2, r6
	add	r2, r2, r0
	add	r2, ip, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	movne	r4, r5
	strne	r5, [r1]
	beq	.L28
.L29:
	ldr	r2, .L68+8
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L30
	ldr	r2, .L68+12
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L65
.L30:
	ldr	r2, .L68+16
	ldrh	r2, [r2, #48]
	lsr	r2, r2, #5
	eor	r2, r2, #1
	cmp	r0, #2
	movle	r2, #0
	andgt	r2, r2, #1
	add	lr, lr, #150
	cmp	r2, #0
	str	lr, [r1, #4]
	bne	.L66
.L31:
	ldr	r2, .L68+16
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L32
	cmp	r0, #232
	ble	.L67
.L32:
	add	lr, lr, r4
	add	r3, r3, lr, asr #8
	sub	r3, r3, #1
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, r3, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #4
	beq	.L27
	ldr	r2, [r1, #20]
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, ip, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	strne	lr, [r1]
.L27:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L28:
	mov	r2, #0
	ldr	r5, .L68+20
	mov	lr, r2
	str	r2, [r5]
	b	.L29
.L67:
	ldr	r5, [r1, #12]
	add	r2, r3, r4, asr #8
	sub	r2, r2, #1
	ldr	r7, [r1, #20]
	rsb	r2, r2, r2, lsl #4
	add	r6, r5, r0
	add	r2, r6, r2, lsl #4
	add	r2, r2, r7
	add	r2, ip, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	asr	r2, r4, #8
	beq	.L32
	rsb	r2, r2, r2, lsl #4
	add	r2, r5, r2, lsl #4
	add	r2, r2, r7
	add	r2, r2, r0
	add	r2, ip, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	movne	r0, r6
	strne	r6, [r1, #8]
	b	.L32
.L65:
	ldr	r2, .L68+20
	ldr	r5, [r2]
	cmp	r5, #0
	bne	.L30
	cmp	r4, #10
	movgt	r5, #1
	subgt	lr, lr, #1488
	strgt	r5, [r2]
	subgt	lr, lr, #12
	b	.L30
.L66:
	ldr	r5, [r1, #12]
	add	r2, r3, r4, asr #8
	sub	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	sub	r5, r0, r5
	add	r2, r5, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	asr	r2, r4, #8
	beq	.L31
	rsb	r2, r2, r2, lsl #4
	add	r2, r5, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	movne	r0, r5
	strne	r5, [r1, #8]
	b	.L31
.L69:
	.align	2
.L68:
	.word	player
	.word	collMapBitmap
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	jumped
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	ldr	r0, .L74
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L73
	pop	{r4, lr}
	bx	lr
.L73:
	pop	{r4, lr}
	b	updateRona.part.0
.L75:
	.align	2
.L74:
	.word	rona
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L78
	push	{r4, lr}
	ldr	r3, [r2, #8]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L78+4
	lsr	r3, r3, #23
	ldr	r1, .L78+8
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initRona
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRona, %function
initRona:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L82
	mov	lr, pc
	bx	r6
	mov	r5, #1
	ldr	r2, .L82+4
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	ldr	r4, .L82+8
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #2
	str	r3, [r4]
	str	r5, [r4, #12]
	mov	lr, pc
	bx	r6
	mov	ip, #230
	ldr	r3, .L82+12
	smull	r1, r2, r3, r0
	mov	r1, #8
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	mul	r3, ip, r3
	sub	r0, r0, r3
	str	r5, [r4, #8]
	str	r5, [r4, #24]
	str	r0, [r4, #4]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	rand
	.word	-368140053
	.word	rona
	.word	1195121335
	.size	initRona, .-initRona
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #3
	str	lr, [sp, #-4]!
	mov	lr, #15360
	mov	r2, #1
	mov	r1, #8
	mov	ip, #20
	ldr	r3, .L86
	str	r0, [r3]
	ldr	r3, .L86+4
	str	r0, [r3, #24]
	ldr	r0, .L86+8
	str	lr, [r3]
	ldr	lr, [sp], #4
	stmib	r3, {r2, ip}
	str	r2, [r3, #12]
	str	r2, [r0]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	b	initRona
.L87:
	.align	2
.L86:
	.word	health
	.word	player
	.word	jumped
	.size	initGame, .-initGame
	.align	2
	.global	updateRona
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRona, %function
updateRona:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateRona.part.0
	.size	updateRona, .-updateRona
	.align	2
	.global	drawRona
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRona, %function
drawRona:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	mov	ip, #1
	ldr	r3, [r0, #4]
	push	{r4, lr}
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldr	r2, .L99
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	ldr	r1, .L99+4
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	ip, [r2, #12]	@ movhi
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	shadowOAM
	.word	waitForVBlank
	.size	drawRona, .-drawRona
	.comm	score,4,4
	.comm	health,4,4
	.comm	ground,4,4
	.comm	jumped,4,4
	.comm	rona,32,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
