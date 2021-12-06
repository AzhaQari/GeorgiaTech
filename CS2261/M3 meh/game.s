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
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #3
	mov	r0, #1
	push	{r4, r5, r6, lr}
	mov	r1, #8
	mov	r6, #36352
	mov	r5, #0
	mov	r4, #20
	mov	lr, #10
	mov	ip, #230
	ldr	r3, .L4
	str	r2, [r3]
	ldr	r3, .L4+4
	str	r2, [r3, #24]
	ldr	r2, .L4+8
	str	r0, [r2]
	ldr	r2, .L4+12
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #8]
	str	lr, [r2]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r2, #12]
	str	r0, [r2, #8]
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	ip, [r2, #4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	health
	.word	player
	.word	jumped
	.word	rona
	.size	initGame, .-initGame
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
	ldr	r3, .L8
	push	{r4, r5, r6, lr}
	ldr	r2, [r3, #8]
	ldr	r6, .L8+4
	ldr	r4, .L8+8
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	and	r2, r2, r6
	ldr	r5, .L8+12
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #2]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r1, #1
	ldr	r2, .L8+16
	ldr	r3, [r2, #4]
	ldrb	r2, [r2]	@ zero_extendqisi2
	and	r3, r3, r6
	strh	r3, [r4, #10]	@ movhi
	strh	r2, [r4, #8]	@ movhi
	strh	r1, [r4, #12]	@ movhi
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
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
	push	{r4, lr}
	mov	r2, #8
	mov	r4, #36352
	mov	lr, #0
	mov	ip, #20
	mov	r0, #1
	mov	r1, #3
	ldr	r3, .L12
	stm	r3, {r4, lr}
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r1, [r3, #24]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
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
	@ link register save eliminated.
	ldr	r3, .L25
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldr	r3, .L25+4
	bne	.L15
	ldr	r2, [r3, #8]
	cmp	r2, #0
	ble	.L15
	ldr	r1, [r3, #12]
	sub	r2, r2, r1
	str	r2, [r3, #8]
.L16:
	ldm	r3, {r1, r2}
	add	r1, r2, r1
	cmp	r1, #36864
	movge	r1, #0
	ldrge	r0, .L25+8
	movge	r2, r1
	strlt	r1, [r3]
	strge	r1, [r0]
	ldr	r1, .L25+12
	ldrh	r1, [r1]
	tst	r1, #64
	beq	.L19
	ldr	r1, .L25+16
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L19
	ldr	r1, .L25+8
	ldr	r0, [r1]
	cmp	r0, #0
	moveq	r0, #1
	subeq	r2, r2, #1488
	streq	r0, [r1]
	subeq	r2, r2, #12
.L19:
	add	r2, r2, #75
	str	r2, [r3, #4]
	bx	lr
.L15:
	ldr	r2, .L25
	ldrh	r2, [r2, #48]
	tst	r2, #16
	bne	.L16
	ldr	r1, [r3, #8]
	ldr	r0, [r3, #12]
	ldr	r2, [r3, #20]
	rsb	ip, r0, #240
	add	r2, r1, r2
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #8]
	b	.L16
.L26:
	.align	2
.L25:
	.word	67109120
	.word	player
	.word	jumped
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
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
	ldr	r2, .L29
	push	{r4, lr}
	ldr	r3, [r2, #8]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L29+4
	lsr	r3, r3, #23
	ldr	r1, .L29+8
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
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
	@ link register save eliminated.
	mov	r1, #1
	mov	r2, #8
	mov	ip, #10
	mov	r0, #230
	ldr	r3, .L32
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L33:
	.align	2
.L32:
	.word	rona
	.size	initRona, .-initRona
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
	ldr	r0, .L48
	ldr	r1, .L48+4
	ldmib	r0, {r2, r3}
	sub	r2, r2, r3
	ldr	ip, [r1]
	cmp	r2, #0
	push	{r4, lr}
	asrlt	r3, ip, #8
	ldrge	r3, [r0]
	sublt	r3, r3, #8
	str	r2, [r0, #4]
	add	lr, ip, #5
	addlt	r2, r2, #230
	strlt	r3, [r0]
	strlt	r2, [r0, #4]
	cmp	lr, r3
	sublt	r3, r3, #2
	strlt	r3, [r0]
	sub	sp, sp, #16
	blt	.L38
	ldr	lr, [r0, #16]
	add	lr, r3, lr
	cmp	lr, #143
	addle	r3, r3, #2
	strle	r3, [r0]
.L38:
	ldr	r3, [r1, #8]
	sub	lr, r3, #4
	cmp	lr, r2
	suble	r2, r2, #2
	strle	r2, [r0, #4]
	ldr	r2, .L48+8
	ldrh	r2, [r2, #48]
	tst	r2, #128
	bne	.L47
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	lr, [r1, #16]
	ldr	r2, [r1, #20]
	asr	ip, ip, #8
	stm	sp, {r3, ip}
	str	lr, [sp, #12]
	str	r2, [sp, #8]
	ldr	r4, .L48+12
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	ldrne	r2, .L48+16
	ldrne	r3, [r2]
	subne	r3, r3, #3
	strne	r3, [r2]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	rona
	.word	player
	.word	67109120
	.word	collision
	.word	health
	.size	updateRona, .-updateRona
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
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	push	{r4, r5, r6, lr}
	ldr	r4, .L63+4
	tst	r3, #32
	ldreq	r3, [r4]
	subeq	r3, r3, #3
	streq	r3, [r4]
	ldr	r3, .L63
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r3, [r4]
	ldr	r5, .L63+8
	addeq	r3, r3, #3
	streq	r3, [r4]
	ldr	r3, [r5]
	cmp	r3, #64
	movgt	r3, #64
	strgt	r3, [r5]
	bgt	.L54
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r5]
.L54:
	ldr	r3, .L63+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #256
	ldr	r1, .L63+16
	ble	.L55
	ldr	r2, [r1]
	sub	r3, r3, #256
	add	r2, r2, #1
	str	r3, [r4]
	str	r2, [r1]
.L56:
	lsl	r3, r3, #16
	lsr	r3, r3, #16
.L58:
	mov	r1, #67108864
	strh	r3, [r1, #16]	@ movhi
	lsl	r3, r2, #24
	ldrh	r0, [r5]
	orr	r3, r3, #1073741824
	lsr	r3, r3, #16
	lsl	r2, r2, #11
	strh	r0, [r1, #18]	@ movhi
	ldr	r4, .L63+20
	strh	r3, [r1, #8]	@ movhi
	mov	r0, #3
	mov	r3, #14336
	ldr	r1, .L63+24
	add	r2, r2, #100663296
	mov	lr, pc
	bx	r4
	bl	updatePlayer
	pop	{r4, r5, r6, lr}
	b	updateRona
.L55:
	cmp	r3, #0
	ldr	r2, [r1]
	bge	.L56
	cmp	r2, #8
	ble	.L57
	add	r3, r3, #256
	sub	r2, r2, #1
	cmp	r3, #0
	str	r3, [r4]
	str	r2, [r1]
	bge	.L56
.L57:
	cmp	r2, #8
	moveq	r1, #0
	ldrhne	r3, [r4]
	moveq	r3, r1
	streq	r1, [r4]
	b	.L58
.L64:
	.align	2
.L63:
	.word	67109120
	.word	hoff
	.word	voff
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	DMANow
	.word	courseFullMap
	.size	updateGame, .-updateGame
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
	mov	r0, #1
	ldr	r2, .L67
	push	{r4, lr}
	ldr	r3, [r2, #4]
	ldrb	ip, [r2]	@ zero_extendqisi2
	lsl	r3, r3, #23
	ldr	r2, .L67+4
	lsr	r3, r3, #23
	ldr	r1, .L67+8
	strh	r3, [r2, #10]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	rona
	.word	shadowOAM
	.word	waitForVBlank
	.size	drawRona, .-drawRona
	.comm	voff,4,4
	.comm	hoff,4,4
	.global	sbb
	.comm	score,4,4
	.comm	health,4,4
	.comm	ground,4,4
	.comm	jumped,4,4
	.comm	rona,24,4
	.comm	player,28,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sbb, %object
	.size	sbb, 4
sbb:
	.word	8
	.ident	"GCC: (devkitARM release 53) 9.1.0"
