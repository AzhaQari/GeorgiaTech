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
	.type	updateAsteroid.part.0, %function
updateAsteroid.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, [r0, #4]
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [r0, #4]
	sub	sp, sp, #20
	blt	.L34
.L2:
	ldr	r4, .L40
	ldr	r5, .L40+4
	ldr	r7, .L40+8
	ldr	r9, .L40+12
	ldr	r8, .L40+16
	add	r6, r4, #800
	b	.L7
.L4:
	add	r4, r4, #40
	cmp	r4, r6
	beq	.L35
.L7:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L4
	add	r0, r5, #20
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L36
.L5:
	add	r0, r5, #60
	add	r2, r5, #40
	ldm	r0, {r0, r1}
	ldm	r2, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #0
	add	r4, r4, #40
	strne	r3, [r4, #-8]
	cmp	r4, r6
	bne	.L7
.L35:
	ldr	r3, [r5, #32]
	cmp	r3, #0
	beq	.L8
	ldr	r2, [r5, #72]
	cmp	r2, #0
	bne	.L37
.L8:
	cmp	r3, #0
	mov	r6, #0
	ldr	r4, .L40+4
	ldr	r7, .L40+20
	ldr	r8, .L40+8
	ldr	r9, .L40+24
	bne	.L38
.L11:
	cmp	r6, #1
	add	r4, r4, #40
	beq	.L1
.L39:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	mov	r6, #1
	beq	.L11
.L38:
	add	r0, r7, #24
	ldm	r0, {r0, r1}
	ldm	r7, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L11
	mov	r0, #0
	mov	lr, pc
	bx	r9
	mov	r3, #0
	cmp	r6, #1
	strh	r3, [r5, #28]	@ movhi
	strh	r3, [r5, #68]	@ movhi
	strh	r3, [r7, #32]	@ movhi
	add	r4, r4, #40
	bne	.L39
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L36:
	mov	lr, pc
	bx	r9
	mov	r1, #229
	mov	r2, #0
	smull	r3, ip, r8, r0
	asr	r3, r0, #31
	rsb	r3, r3, ip, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	str	r3, [r5]
	str	r1, [r5, #4]
	str	r2, [r4, #32]
	b	.L5
.L34:
	ldr	r2, [r0, #24]
	rsb	r2, r2, #239
	str	r3, [r0, #12]
	str	r2, [r0, #4]
	ldr	r3, .L40+12
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+16
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	str	r3, [r4]
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	b	.L2
.L37:
	add	r0, r5, #60
	add	r2, r5, #40
	ldm	r0, {r0, r1}
	ldm	r2, {r2, r3}
	ldr	r4, .L40+8
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #24]
	ldr	r3, [r5, #20]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r3, #90
	movne	r2, #40
	strne	r3, [r5, #40]
	strne	r2, [r5]
	ldr	r3, [r5, #32]
	b	.L8
.L41:
	.align	2
.L40:
	.word	bullets
	.word	asteroids
	.word	collision
	.word	rand
	.word	1374389535
	.word	player
	.word	fillScreen
	.word	waitForVBlank
	.size	updateAsteroid.part.0, .-updateAsteroid.part.0
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
	push	{r4, r5, r6, lr}
	mov	r0, #80
	mov	r6, #5
	mov	r5, #10
	mov	r4, #992
	mov	lr, #20
	mov	r1, #30
	mov	r2, #1
	mov	ip, #0
	ldr	r3, .L44
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	strh	r4, [r3, #32]	@ movhi
	str	lr, [r3, #36]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	ip, [r3, #40]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.size	initPlayer, .-initPlayer
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
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r4, .L48
	sub	sp, sp, #12
	str	r3, [sp]
	ldr	r2, [r4, #28]
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	ldr	r5, .L48+4
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #32]
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	player
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #2
	mov	r6, #1
	mvn	r5, #0
	mov	r2, #0
	mvn	r4, #32768
	ldr	r0, .L54
	ldr	r3, .L54+4
	ldr	lr, [r0]
	ldr	ip, [r0, #4]
	add	r0, r3, #800
.L51:
	str	r6, [r3, #20]
	str	r1, [r3, #24]
	str	r5, [r3]
	str	ip, [r3, #12]
	str	r1, [r3, #16]
	strh	r4, [r3, #28]	@ movhi
	str	r2, [r3, #32]
	stmib	r3, {r2, lr}
	add	r3, r3, #40
	cmp	r3, r0
	bne	.L51
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L66
	mov	r3, #0
	mov	r2, r0
	b	.L59
.L57:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #40
	bxeq	lr
.L59:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L57
	push	{r4, r5, r6, lr}
	mov	r6, #1
	ldr	lr, .L66+4
	add	r3, r3, r3, lsl #2
	ldr	r2, [lr, #24]
	add	ip, r0, r3, lsl #3
	add	r5, r2, r2, lsr #31
	ldr	r4, [ip, #20]
	ldr	r2, [lr]
	add	r4, r4, r4, lsr #31
	add	r2, r2, r5, asr r6
	add	r2, r2, r4, asr r6
	ldr	r4, [lr, #4]
	ldr	lr, [lr, #28]
	add	lr, r4, lr
	str	lr, [ip, #4]
	str	r6, [ip, #32]
	str	r1, [ip, #36]
	str	r2, [r0, r3, lsl #3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #32
	push	{r4, lr}
	ldr	r4, .L82+4
	bne	.L69
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4, #4]
	blt	.L69
.L70:
	ldr	r3, .L82+8
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r4, #36]
	beq	.L80
	ldr	r2, .L82+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L75
.L80:
	add	r3, r3, #1
.L74:
	str	r3, [r4, #36]
	pop	{r4, lr}
	bx	lr
.L69:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L71
	ldr	r2, [r4, #4]
	ldr	r1, [r4, #16]
	ldr	r3, [r4, #28]
	rsb	r0, r1, #240
	add	r3, r2, r3
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4, #4]
	ble	.L70
.L71:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #64
	beq	.L81
.L72:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L70
	add	r1, r4, #20
	ldr	r2, [r4]
	ldm	r1, {r1, r3}
	add	r3, r2, r3
	rsb	r0, r1, #160
	cmp	r3, r0
	addle	r2, r2, r1
	strle	r2, [r4]
	b	.L70
.L81:
	ldr	r3, [r4]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	subge	r3, r3, r2
	strge	r3, [r4]
	bge	.L70
	b	.L72
.L75:
	cmp	r3, #19
	ble	.L80
	bl	fireBullet
	mov	r3, #1
	b	.L74
.L83:
	.align	2
.L82:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
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
	mov	r0, #0
	ldr	r3, .L96
	add	r1, r3, #800
.L88:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L86
	ldr	r2, [r3, #4]
	add	r2, r2, #4
	cmp	r2, #239
	str	r2, [r3, #4]
	strgt	r0, [r3, #32]
.L86:
	add	r3, r3, #40
	cmp	r1, r3
	bne	.L88
	ldr	r4, .L96+4
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r0, r4
	blne	updateAsteroid.part.0
.L89:
	ldr	r3, [r4, #72]
	cmp	r3, #0
	ldrne	r0, .L96+8
	popne	{r4, lr}
	bne	updateAsteroid.part.0
.L84:
	pop	{r4, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	bullets
	.word	asteroids
	.word	asteroids+40
	.size	updateGame, .-updateGame
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #4]
	add	r3, r3, #4
	cmp	r3, #239
	str	r3, [r0, #4]
	movgt	r3, #0
	strgt	r3, [r0, #32]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L106
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L107
.L104:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L107:
	str	r3, [sp]
	ldr	r5, .L108
	ldr	r3, [r0, #20]
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L104
.L106:
	mov	r2, #0
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L108
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L104
.L109:
	.align	2
.L108:
	.word	drawRect
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAsteroid, %function
initAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #10
	ldr	r4, .L112
	ldr	r10, .L112+4
	str	r9, [r4, #20]
	str	r9, [r4, #24]
	mov	lr, pc
	bx	r10
	mov	r5, #229
	mov	r7, #0
	mov	r6, #1
	ldr	r8, .L112+8
	smull	r2, r3, r8, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #5
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #2
	sub	r2, r0, r2, lsl #2
	str	r2, [r4]
	str	r2, [r4, #8]
	str	r9, [r4, #60]
	str	r9, [r4, #64]
	str	r5, [r4, #4]
	str	r5, [r4, #12]
	str	r7, [r4, #16]
	str	r6, [r4, #32]
	mov	lr, pc
	bx	r10
	mov	r2, #31
	mvn	r1, #64512
	smull	r3, r8, r0, r8
	asr	r3, r0, r2
	rsb	r3, r3, r8, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	str	r5, [r4, #44]
	str	r5, [r4, #52]
	str	r7, [r4, #56]
	str	r6, [r4, #72]
	strh	r1, [r4, #28]	@ movhi
	str	r3, [r4, #40]
	str	r3, [r4, #48]
	strh	r2, [r4, #68]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	asteroids
	.word	rand
	.word	1374389535
	.size	initAsteroid, .-initAsteroid
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #80
	ldr	r5, .L118
	mov	r4, r8
	str	r8, [r5]
	str	r8, [r5, #8]
	mov	r8, #992	@ movhi
	mov	r7, #30
	mov	r9, #0
	mov	r6, #1
	strh	r8, [r5, #32]	@ movhi
	mov	fp, #5
	mov	r10, #10
	mov	r8, #20
	mov	lr, r7
	mov	r2, r9
	mov	r3, #2
	mvn	r0, #0
	mvn	r1, #32768
	str	r6, [r5, #16]
	str	r6, [r5, #20]
	mov	ip, r6
	ldr	r6, .L118+4
	str	fp, [r5, #24]
	str	r10, [r5, #28]
	str	r8, [r5, #36]
	str	r7, [r5, #4]
	str	r7, [r5, #12]
	str	r9, [r5, #40]
	add	r5, r6, #800
.L115:
	str	ip, [r6, #20]
	str	r3, [r6, #24]
	str	r3, [r6, #16]
	strh	r1, [r6, #28]	@ movhi
	str	r2, [r6, #32]
	stm	r6, {r0, r2, r4, lr}
	add	r6, r6, #40
	cmp	r6, r5
	bne	.L115
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	initAsteroid
.L119:
	.align	2
.L118:
	.word	player
	.word	bullets
	.size	initGame, .-initGame
	.align	2
	.global	updateAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAsteroid, %function
updateAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateAsteroid.part.0
	.size	updateAsteroid, .-updateAsteroid
	.align	2
	.global	drawAsteroid
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAsteroid, %function
drawAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	ip, [r0, #32]
	cmp	ip, #0
	ldr	r0, [r0, #12]
	ldr	r1, [r4, #8]
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #20]
	sub	sp, sp, #12
	bne	.L127
	ldr	lr, [r4, #36]
	cmp	lr, #0
	beq	.L128
	str	ip, [sp]
	ldr	r5, .L129
	mov	lr, pc
	bx	r5
.L124:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L128:
	str	lr, [sp]
	ldr	r5, .L129
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L124
.L127:
	mov	ip, #0
	ldr	r5, .L129
	str	ip, [sp]
	add	r2, r2, #50
	mov	lr, pc
	bx	r5
	ldrh	r2, [r4, #28]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L124
.L130:
	.align	2
.L129:
	.word	drawRect
	.size	drawAsteroid, .-drawAsteroid
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
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r4, .L135
	add	r5, r4, #800
.L132:
	mov	r0, r4
	add	r4, r4, #40
	bl	drawBullet
	cmp	r4, r5
	bne	.L132
	ldr	r0, .L135+4
	bl	drawAsteroid
	ldr	r0, .L135+8
	pop	{r4, r5, r6, lr}
	b	drawAsteroid
.L136:
	.align	2
.L135:
	.word	bullets
	.word	asteroids
	.word	asteroids+40
	.size	drawGame, .-drawGame
	.comm	asteroids,80,4
	.comm	bullets,800,4
	.comm	player,44,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
