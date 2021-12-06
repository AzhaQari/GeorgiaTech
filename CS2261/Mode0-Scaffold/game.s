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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #13
	mov	r8, #150
	mov	r7, #118
	mov	r6, #3
	mov	r1, #8
	mov	r5, #239
	mov	r4, #16
	mov	lr, #32
	mov	r2, #1
	mov	ip, #75
	ldr	r3, .L4
	str	r8, [r3]
	str	r7, [r3, #8]
	str	r6, [r3, #24]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	ldr	r3, .L4+4
	str	r5, [r3, #4]
	str	r4, [r3, #12]
	str	lr, [r3, #16]
	str	ip, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	logs
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
	ldr	r2, [r3]
	ldr	r4, .L8+4
	ldr	r3, [r3, #8]
	ldr	r5, .L8+8
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r2, .L8+12
	ldr	r3, [r2, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r2]
	ldr	r1, .L8+16
	orr	r2, r2, #16384
	strh	r2, [r4, #8]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	strh	r1, [r4, #12]	@ movhi
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	logs
	.word	4097
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
	mov	r1, #13
	mov	lr, #150
	mov	r2, #8
	mov	ip, #118
	mov	r0, #3
	ldr	r3, .L12
	str	lr, [r3]
	str	ip, [r3, #8]
	str	r0, [r3, #24]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
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
	ldr	r3, .L34
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L15
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L15
	ldr	r1, .L34+8
	ldr	r2, [r1, #8]
	cmp	r2, #12
	ble	.L15
	ldr	r3, [r1, #12]
	sub	r2, r2, r3
	str	r2, [r1, #8]
	bx	lr
.L15:
	tst	r3, #16
	str	lr, [sp, #-4]!
	beq	.L17
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #16
	bne	.L17
	ldr	r2, .L34+8
	ldr	r0, [r2, #8]
	ldr	ip, [r2, #12]
	ldr	r1, [r2, #20]
	rsb	lr, ip, #240
	add	r1, r0, r1
	cmp	r1, lr
	addle	r0, r0, ip
	strle	r0, [r2, #8]
	ble	.L14
.L17:
	tst	r3, #64
	beq	.L18
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L18
	ldr	r2, .L34+8
	ldr	r1, [r2]
	ldr	r0, [r2, #4]
	cmp	r1, r0
	subgt	r1, r1, r0
	strgt	r1, [r2]
	bgt	.L14
.L18:
	tst	r3, #128
	beq	.L14
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L14
	ldr	r2, .L34+8
	ldr	r1, [r2]
	ldr	r3, [r2, #16]
	ldr	r0, [r2, #4]
	add	r3, r1, r3
	add	r3, r3, #10
	rsb	ip, r0, #160
	cmp	r3, ip
	addlt	r1, r1, r0
	strlt	r1, [r2]
.L14:
	ldr	lr, [sp], #4
	bx	lr
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
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
	ldr	r2, .L38
	ldr	r3, .L38+4
	ldr	r0, [r2]
	ldr	r1, [r2, #8]
	ldr	r2, .L38+8
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initLogs
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLogs, %function
initLogs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #1
	mov	lr, #239
	mov	ip, #16
	mov	r0, #32
	mov	r1, #75
	ldr	r3, .L42
	str	lr, [r3, #4]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	str	r1, [r3]
	str	r2, [r3, #8]
	str	r2, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	logs
	.size	initLogs, .-initLogs
	.align	2
	.global	updateLog
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLog, %function
updateLog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L50
	add	r6, r5, #16
	ldm	r6, {r6, ip}
	ldmib	r0, {r0, r3}
	sub	r0, r0, r3
	sub	sp, sp, #16
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	str	r0, [r4, #4]
	ldr	r1, [r4]
	ldr	lr, [r5]
	str	ip, [sp, #8]
	ldr	ip, [r5, #8]
	str	r6, [sp, #12]
	stm	sp, {ip, lr}
	ldr	r6, .L50+4
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldrne	r2, [r4, #8]
	ldrne	r3, [r5, #8]
	subne	r3, r3, r2
	strne	r3, [r5, #8]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	player
	.word	collision
	.size	updateLog, .-updateLog
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
	ldr	r0, .L54
	pop	{r4, lr}
	b	updateLog
.L55:
	.align	2
.L54:
	.word	logs
	.size	updateGame, .-updateGame
	.align	2
	.global	drawLog
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLog, %function
drawLog:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	push	{r4, lr}
	ldr	r1, [r0]
	ldr	r2, .L58
	ldr	ip, .L58+4
	orr	r1, r1, #16384
	ldr	r0, .L58+8
	strh	r3, [r2, #10]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	strh	ip, [r2, #12]	@ movhi
	mov	lr, pc
	bx	r0
	pop	{r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	shadowOAM
	.word	4097
	.word	waitForVBlank
	.size	drawLog, .-drawLog
	.comm	score,4,4
	.comm	health,4,4
	.comm	logs,48,4
	.comm	player,28,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
