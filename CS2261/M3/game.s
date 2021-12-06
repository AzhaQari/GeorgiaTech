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
	ldr	r3, .L17
	str	lr, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #24]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
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
	ldr	r1, .L60
	push	{r4, r5, r6, r7, lr}
	ldm	r1, {r4, lr}
	ldr	r3, [r1, #16]
	add	r5, r4, lr
	add	r2, r3, r5, asr #8
	ldr	r0, [r1, #8]
	sub	r2, r2, #1
	rsb	r2, r2, r2, lsl #4
	ldr	ip, .L60+4
	add	r6, r0, r2, lsl #4
	lsl	r6, r6, #1
	ldrh	r6, [ip, r6]
	cmp	r6, #0
	beq	.L20
	ldr	r6, [r1, #20]
	lsl	r2, r2, #4
	add	r2, r2, r6
	add	r2, r2, r0
	add	r2, ip, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	movne	r4, r5
	strne	r5, [r1]
	beq	.L20
.L21:
	ldr	r2, .L60+8
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L22
	ldr	r2, .L60+12
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L57
.L22:
	ldr	r2, .L60+16
	ldrh	r2, [r2, #48]
	lsr	r2, r2, #5
	eor	r2, r2, #1
	cmp	r0, #2
	movle	r2, #0
	andgt	r2, r2, #1
	add	lr, lr, #150
	cmp	r2, #0
	str	lr, [r1, #4]
	bne	.L58
.L23:
	ldr	r2, .L60+16
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L24
	cmp	r0, #232
	ble	.L59
.L24:
	add	lr, lr, r4
	add	r3, r3, lr, asr #8
	sub	r3, r3, #1
	rsb	r3, r3, r3, lsl #4
	add	r2, r0, r3, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #4
	beq	.L19
	ldr	r2, [r1, #20]
	add	r3, r3, r2
	add	r3, r3, r0
	add	r3, ip, r3, lsl #1
	ldrh	r3, [r3, #-2]
	cmp	r3, #0
	strne	lr, [r1]
.L19:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L20:
	mov	r2, #0
	ldr	r5, .L60+20
	mov	lr, r2
	str	r2, [r5]
	b	.L21
.L59:
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
	beq	.L24
	rsb	r2, r2, r2, lsl #4
	add	r2, r5, r2, lsl #4
	add	r2, r2, r7
	add	r2, r2, r0
	add	r2, ip, r2, lsl #1
	ldrh	r2, [r2, #-2]
	cmp	r2, #0
	movne	r0, r6
	strne	r6, [r1, #8]
	b	.L24
.L57:
	ldr	r2, .L60+20
	ldr	r5, [r2]
	cmp	r5, #0
	bne	.L22
	cmp	r4, #10
	movgt	r5, #1
	subgt	lr, lr, #1488
	strgt	r5, [r2]
	subgt	lr, lr, #12
	b	.L22
.L58:
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
	beq	.L23
	rsb	r2, r2, r2, lsl #4
	add	r2, r5, r2, lsl #4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	movne	r0, r5
	strne	r5, [r1, #8]
	b	.L23
.L61:
	.align	2
.L60:
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
	ldr	r4, .L73
	bl	updatePlayer
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateRona.part.0
.L63:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ldrne	r0, .L73+4
	blne	updateRona.part.0
.L64:
	ldr	r3, [r4, #88]
	cmp	r3, #0
	ldrne	r0, .L73+8
	popne	{r4, lr}
	bne	updateRona.part.0
.L62:
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	rona
	.word	rona+32
	.word	rona+64
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
	ldr	r2, .L77
	push	{r4, lr}
	ldr	r3, [r2, #8]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L77+4
	lsr	r3, r3, #23
	ldr	r1, .L77+8
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.size	drawPlayer, .-drawPlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"hello%d\000"
	.text
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	ldr	r10, .L83
	ldr	r5, .L83+4
	ldr	r9, .L83+8
	ldr	r8, .L83+12
	ldr	r7, .L83+16
	ldr	r6, .L83+20
.L80:
	mov	lr, pc
	bx	r5
	mov	fp, #1
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #3
	sub	r3, r0, r3, lsl #2
	add	r3, r3, r4
	str	r3, [r10]
	str	fp, [r10, #12]
	mov	lr, pc
	bx	r5
	mov	r1, #230
	smull	r3, ip, r7, r0
	mov	r2, #8
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	mul	r3, r1, r3
	sub	r0, r0, r3
	add	r0, r0, r4
	str	r0, [r10, #4]
	str	fp, [r10, #8]
	str	fp, [r10, #24]
	str	r2, [r10, #16]
	str	r2, [r10, #20]
	mov	r0, r6
	ldr	r1, [r10], #32
	add	r4, r4, fp
	mov	lr, pc
	bx	r9
	cmp	r4, #3
	bne	.L80
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	rona
	.word	rand
	.word	printf
	.word	-368140053
	.word	1195121335
	.word	.LC0
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
	ldr	r3, .L87
	str	r0, [r3]
	ldr	r3, .L87+4
	str	r0, [r3, #24]
	ldr	r0, .L87+8
	str	lr, [r3]
	ldr	lr, [sp], #4
	stmib	r3, {r2, ip}
	str	r2, [r3, #12]
	str	r2, [r0]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	b	initRona
.L88:
	.align	2
.L87:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r6, .L100
	ldr	r8, .L100+4
	ldr	r7, .L100+8
	add	r5, r0, #96
.L93:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L99
.L92:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L93
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L99:
	mov	r2, #1
	ldr	r3, [r4, #4]
	ldrb	r1, [r4]	@ zero_extendqisi2
	and	r3, r3, r8
	strh	r3, [r6, #10]	@ movhi
	strh	r1, [r6, #8]	@ movhi
	strh	r2, [r6, #12]	@ movhi
	mov	lr, pc
	bx	r7
	b	.L92
.L101:
	.align	2
.L100:
	.word	shadowOAM
	.word	511
	.word	waitForVBlank
	.size	drawRona, .-drawRona
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
	ldr	r2, .L104
	ldr	r3, [r2, #8]
	push	{r4, lr}
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L104+4
	ldr	r4, .L104+8
	lsr	r3, r3, #23
	strh	r0, [r2]	@ movhi
	ldr	r1, .L104+12
	strh	r3, [r2, #2]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r0, r4
	bl	drawRona
	add	r0, r4, #32
	bl	drawRona
	add	r0, r4, #64
	pop	{r4, lr}
	b	drawRona
.L105:
	.align	2
.L104:
	.word	player
	.word	shadowOAM
	.word	rona
	.word	waitForVBlank
	.size	drawGame, .-drawGame
	.comm	score,4,4
	.comm	health,4,4
	.comm	ground,4,4
	.comm	jumped,4,4
	.comm	rona,96,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
