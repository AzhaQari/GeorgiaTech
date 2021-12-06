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
	ldr	r2, .L27
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r2, #8]
	ldr	r7, .L27+4
	ldrb	r2, [r2, #1]	@ zero_extendqisi2
	ldr	r4, .L27+8
	ldr	r5, .L27+12
	and	r3, r3, r7
	ldr	r6, .L27+16
	strh	r3, [r4, #2]	@ movhi
	strh	r2, [r4]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L25
	ldr	r3, [r5, #56]
	cmp	r3, #0
	bne	.L26
.L15:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L25:
	mov	r2, #1
	ldr	r3, [r5, #4]
	and	r7, r7, r3
	ldrb	r3, [r5]	@ zero_extendqisi2
	strh	r7, [r4, #10]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L15
.L26:
	mov	r2, #1
	ldr	r3, [r5, #36]
	ldrb	r1, [r5, #32]	@ zero_extendqisi2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	strh	r3, [r4, #10]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	mov	lr, pc
	bx	r6
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.word	511
	.word	shadowOAM
	.word	rona
	.word	waitForVBlank
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
	ldr	r3, .L31
	str	lr, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #24]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
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
	ldr	r1, .L74
	push	{r4, r5, r6, r7, lr}
	ldm	r1, {r4, lr}
	ldr	r3, [r1, #16]
	add	r5, r4, lr
	add	r2, r3, r5, asr #8
	ldr	r0, [r1, #8]
	sub	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	ldr	ip, .L74+4
	add	r6, r0, r2, lsl #4
	lsl	r6, r6, #1
	ldrh	r6, [ip, r6]
	cmp	r6, #0
	beq	.L34
	ldr	r6, [r1, #20]
	lsl	r2, r2, #4
	add	r2, r2, r6
	add	r2, r2, r0
	add	r2, ip, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	movne	r4, r5
	strne	r5, [r1]
	beq	.L34
.L35:
	ldr	r2, .L74+8
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L36
	ldr	r2, .L74+12
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L71
.L36:
	ldr	r2, .L74+16
	ldrh	r2, [r2, #48]
	lsr	r2, r2, #5
	eor	r2, r2, #1
	cmp	r0, #2
	movle	r2, #0
	andgt	r2, r2, #1
	add	lr, lr, #150
	cmp	r2, #0
	str	lr, [r1, #4]
	bne	.L72
.L37:
	ldr	r2, .L74+16
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L38
	cmp	r0, #232
	ble	.L73
.L38:
	add	lr, lr, r4
	add	r3, r3, lr, asr #8
	sub	r3, r3, #1
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, r3, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #4
	beq	.L33
	ldr	r2, [r1, #20]
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, ip, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	strne	lr, [r1]
.L33:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L34:
	mov	r2, #0
	ldr	r5, .L74+20
	mov	lr, r2
	str	r2, [r5]
	b	.L35
.L73:
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
	beq	.L38
	rsb	r2, r2, r2, lsl #4
	add	r2, r5, r2, lsl #4
	add	r2, r2, r7
	add	r2, r2, r0
	add	r2, ip, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	movne	r0, r6
	strne	r6, [r1, #8]
	b	.L38
.L71:
	ldr	r2, .L74+20
	ldr	r5, [r2]
	cmp	r5, #0
	bne	.L36
	cmp	r4, #10
	movgt	r5, #1
	subgt	lr, lr, #1488
	strgt	r5, [r2]
	subgt	lr, lr, #12
	b	.L36
.L72:
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
	beq	.L37
	rsb	r2, r2, r2, lsl #4
	add	r2, r5, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	movne	r0, r5
	strne	r5, [r1, #8]
	b	.L37
.L75:
	.align	2
.L74:
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
	ldr	r4, .L83
	bl	updatePlayer
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateRona.part.0
.L77:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ldrne	r0, .L83+4
	popne	{r4, lr}
	bne	updateRona.part.0
.L76:
	pop	{r4, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	rona
	.word	rona+32
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
	ldr	r2, .L87
	push	{r4, lr}
	ldr	r3, [r2, #8]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L87+4
	lsr	r3, r3, #23
	ldr	r1, .L87+8
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L88:
	.align	2
.L87:
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L91
	mov	lr, pc
	bx	r5
	mov	r6, #1
	ldr	r7, .L91+4
	smull	r2, r3, r7, r0
	asr	r2, r0, #31
	add	r3, r3, r0
	rsb	r2, r2, r3, asr #7
	add	r2, r2, r2, lsl #2
	ldr	r4, .L91+8
	rsb	r2, r2, r2, lsl #3
	sub	r2, r0, r2, lsl #2
	str	r2, [r4]
	str	r6, [r4, #12]
	mov	lr, pc
	bx	r5
	mov	r10, #230
	ldr	r9, .L91+12
	smull	r3, r2, r9, r0
	mov	r8, #8
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #6
	mul	r3, r10, r3
	sub	r0, r0, r3
	str	r6, [r4, #8]
	str	r6, [r4, #24]
	str	r0, [r4, #4]
	str	r8, [r4, #16]
	str	r8, [r4, #20]
	mov	lr, pc
	bx	r5
	smull	r3, r7, r0, r7
	asr	r3, r0, #31
	add	r7, r7, r0
	rsb	r3, r3, r7, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #2
	str	r3, [r4, #32]
	str	r6, [r4, #44]
	mov	lr, pc
	bx	r5
	smull	r3, r9, r0, r9
	asr	r3, r0, #31
	rsb	r9, r3, r9, asr #6
	mul	r10, r9, r10
	sub	r0, r0, r10
	str	r6, [r4, #40]
	str	r8, [r4, #48]
	str	r8, [r4, #52]
	str	r6, [r4, #56]
	str	r0, [r4, #36]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L92:
	.align	2
.L91:
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
	ldr	r3, .L95
	str	r0, [r3]
	ldr	r3, .L95+4
	str	r0, [r3, #24]
	ldr	r0, .L95+8
	str	lr, [r3]
	ldr	lr, [sp], #4
	stmib	r3, {r2, ip}
	str	r2, [r3, #12]
	str	r2, [r0]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	b	initRona
.L96:
	.align	2
.L95:
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
	ldr	r2, .L108
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	ldr	r1, .L108+4
	strh	r3, [r2, #10]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	ip, [r2, #12]	@ movhi
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	shadowOAM
	.word	waitForVBlank
	.size	drawRona, .-drawRona
	.comm	score,4,4
	.comm	health,4,4
	.comm	ground,4,4
	.comm	jumped,4,4
	.comm	rona,64,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
