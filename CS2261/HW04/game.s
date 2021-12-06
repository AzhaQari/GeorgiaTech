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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #3
	mov	r2, #16
	mov	ip, #130
	mov	r0, #118
	ldr	r3, .L3
	str	ip, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	bx	lr
.L4:
	.align	2
.L3:
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
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L6
	ldr	r3, .L11+4
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #12]
	cmp	r2, r1
	blt	.L6
	sub	r2, r2, r1
	str	r2, [r3, #8]
	bx	lr
.L6:
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L8
	ldr	r3, .L11+4
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #20]
	ldr	r0, [r3, #12]
	add	r2, r1, r2
	rsb	ip, r0, #240
	cmp	r2, ip
	bgt	.L8
	add	r1, r1, r0
	str	r1, [r3, #8]
	bx	lr
.L8:
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L10
.L9:
	ldr	r3, .L11
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bxne	lr
	ldr	r3, .L11+4
	ldr	r1, [r3]
	ldr	r2, [r3, #16]
	add	r2, r1, r2
	cmp	r2, #157
	ldrle	r2, [r3, #4]
	addle	r1, r2, r1
	strle	r1, [r3]
	bx	lr
.L10:
	ldr	r2, .L11+4
	ldr	r3, [r2]
	cmp	r3, #2
	ble	.L9
	ldr	r1, [r2, #4]
	sub	r3, r3, r1
	str	r3, [r2]
	bx	lr
.L12:
	.align	2
.L11:
	.word	67109120
	.word	player
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
	push	{r4, lr}
	ldr	r0, .L15
	ldr	ip, .L15+4
	sub	sp, sp, #8
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldr	r1, [r0]
	ldr	r4, .L15+8
	ldr	r0, [r0, #8]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	player
	.word	birdBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #0
	mov	r9, #2
	ldr	r4, .L23
	ldr	r5, .L23+4
	ldr	r7, .L23+8
	ldr	r6, .L23+12
.L20:
	mov	lr, pc
	bx	r5
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	smull	r3, ip, r6, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #6
	add	r3, r3, r3, lsl #6
	mov	r1, #0
	sub	r0, r0, r3, lsl r2
	mov	r3, #16
	tst	r8, #1
	add	r8, r8, #1
	str	r9, [r4, #12]
	str	r1, [r4, #24]
	strne	r2, [r4, #12]
	streq	r2, [r4, #24]
	add	r0, r0, #10
	cmp	r8, #5
	str	r9, [r4, #8]
	str	r0, [r4, #4]
	str	r2, [r4, #28]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	add	r4, r4, #32
	bne	.L20
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	balls
	.word	rand
	.word	1374389535
	.word	2114445439
	.size	initBalls, .-initBalls
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
	mov	r1, #3
	mov	r2, #16
	mov	ip, #130
	mov	r0, #118
	ldr	r3, .L27
	push	{r4, r5, r6, lr}
	str	ip, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	mov	r5, #83886080
	bl	initBalls
	mov	r2, #0
	mov	r1, #-2147483632
	mov	r4, #20
	mov	lr, #992
	mov	ip, #31
	mvn	r0, #32768
	ldr	r3, .L27+4
	ldr	r6, .L27+8
	ldr	r3, [r3]
	str	r2, [r3, #44]
	str	r6, [r3, #36]
	str	r5, [r3, #40]
	ldr	r5, .L27+12
	str	r5, [r3, #44]
	ldr	r5, .L27+16
	str	r2, [r3, #44]
	str	r5, [r3, #36]
	ldr	r5, .L27+20
	str	r5, [r3, #40]
	ldr	r5, .L27+24
	str	r1, [r3, #44]
	str	r2, [r3, #44]
	str	r5, [r3, #36]
	ldr	r5, .L27+28
	str	r5, [r3, #40]
	str	r1, [r3, #44]
	ldr	r3, .L27+32
	str	r2, [r3]
	ldr	r3, .L27+36
	str	r4, [r3]
	ldr	r3, .L27+40
	ldr	r1, .L27+44
	strh	r2, [r3, #244]	@ movhi
	ldr	r2, .L27+48
	strh	lr, [r3, #246]	@ movhi
	strh	r1, [r3, #248]	@ movhi
	strh	ip, [r3, #250]	@ movhi
	strh	r0, [r3, #252]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.word	dma
	.word	heartPal
	.word	-2147483392
	.word	birdPal+32
	.word	83886112
	.word	predatorPal+64
	.word	83886144
	.word	score
	.word	health
	.word	83886336
	.word	21152
	.word	15855
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #28]
	sub	sp, sp, #24
	cmp	r3, #0
	mov	r4, r0
	ldr	r6, .L75
	str	r0, [sp, #20]
	bne	.L30
.L44:
	mov	lr, pc
	bx	r6
	ldr	r3, .L75+4
	ldr	r2, .L75+8
	mla	r0, r2, r0, r3
	ldr	r3, .L75+12
	cmp	r3, r0, ror #2
	movcs	r3, #1
	strcs	r3, [r4]
	strcs	r3, [r4, #28]
.L29:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L30:
	mov	lr, pc
	bx	r6
	ldr	r3, .L75+4
	ldr	r2, .L75+8
	mla	r0, r2, r0, r3
	ldr	r1, [r4]
	cmp	r3, r0, ror #1
	ldr	r0, [r4, #12]
	ldr	r3, [r4, #16]
	rsbcs	r0, r0, #0
	add	ip, r1, r3
	ldr	r2, [r4, #4]
	strcs	r0, [r4, #12]
	cmp	ip, #160
	movge	r1, #1
	cmp	r2, #1
	ble	.L36
	ldr	ip, [r4, #20]
	add	ip, r2, ip
	cmp	ip, #238
	ble	.L37
.L36:
	rsb	r0, r0, #0
	str	r0, [r4, #12]
.L37:
	add	r0, r2, r0
	ldr	ip, [r4, #8]
	ldr	r2, [r4, #28]
	add	r1, r1, ip
	cmp	r2, #0
	str	r0, [r4, #4]
	str	r1, [r4]
	bne	.L71
.L38:
	ldr	r5, .L75+16
	ldr	r8, .L75+20
	add	r7, r5, #160
.L46:
	cmp	r2, #0
	beq	.L72
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L73
.L43:
	add	r5, r5, #32
	cmp	r5, r7
	bne	.L46
	cmp	r2, #0
	beq	.L44
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L72:
	add	r5, r5, #32
	cmp	r7, r5
	bne	.L43
	b	.L44
.L71:
	ldr	r2, [r4, #24]
	cmp	r2, #0
	ldr	r5, .L75+24
	bne	.L66
	ldr	r7, .L75+20
.L39:
	ldr	ip, [r5, #16]
	ldr	r2, [r4, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldr	r8, [r5, #20]
	str	ip, [sp, #12]
	ldr	lr, [r5]
	ldr	ip, [r5, #8]
	str	r8, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r2, .L75+28
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	ldr	r2, [r4, #28]
	b	.L38
.L73:
	ldr	lr, [r5, #16]
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldr	ip, [r5, #20]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	lr, [sp, #12]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldrne	r3, [r4, #12]
	rsbne	r3, r3, #0
	strne	r3, [r4, #12]
	ldrne	r3, [r5, #12]
	rsbne	r3, r3, #0
	strne	r3, [r5, #12]
	ldr	r2, [r4, #28]
	b	.L43
.L66:
	ldr	lr, [r5, #16]
	ldr	ip, [r5, #20]
	ldr	r2, [r4, #20]
	str	lr, [sp, #12]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #8]
	ldr	r7, .L75+20
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L74
	ldr	r2, [r4, #28]
	cmp	r2, #0
	beq	.L38
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L38
	ldr	r3, [r4, #16]
	b	.L39
.L74:
	mov	r2, #0
	ldr	r1, .L75+28
	ldr	r3, [r1]
	ldr	r0, .L75+32
	add	r3, r3, #15
	str	r3, [r1]
	str	r3, [r0]
	str	r2, [r4, #28]
	b	.L38
.L76:
	.align	2
.L75:
	.word	rand
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	balls
	.word	collision
	.word	player
	.word	health
	.word	score
	.size	updateBall, .-updateBall
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
	ldr	r4, .L79
	bl	updatePlayer
	mov	r0, r4
	bl	updateBall
	add	r0, r4, #32
	bl	updateBall
	add	r0, r4, #64
	bl	updateBall
	add	r0, r4, #96
	bl	updateBall
	add	r0, r4, #128
	pop	{r4, lr}
	b	updateBall
.L80:
	.align	2
.L79:
	.word	balls
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #28]
	cmp	r2, #0
	bxeq	lr
	mov	r3, r0
	push	{r4, lr}
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ldrne	ip, .L91
	ldreq	ip, .L91+4
	sub	sp, sp, #8
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	ldr	r0, [r0, #4]
	ldr	r3, [r3, #16]
	ldr	r4, .L91+8
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	heartBitmap
	.word	predatorBitmap
	.word	drawImage4
	.size	drawBall, .-drawBall
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
	push	{r4, lr}
	ldr	r4, .L95
	ldr	r3, .L95+4
	mov	r0, #254
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	mov	r0, r4
	bl	drawBall
	add	r0, r4, #32
	bl	drawBall
	add	r0, r4, #64
	bl	drawBall
	add	r0, r4, #96
	bl	drawBall
	add	r0, r4, #128
	pop	{r4, lr}
	b	drawBall
.L96:
	.align	2
.L95:
	.word	balls
	.word	fillScreen4
	.size	drawGame, .-drawGame
	.comm	score,4,4
	.comm	health,4,4
	.comm	balls,160,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
