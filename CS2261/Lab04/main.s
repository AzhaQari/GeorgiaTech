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
	ldr	r2, .L4
	push	{r4, lr}
	ldr	r0, .L4+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	1027
	.word	31775
	.word	fillScreen
	.word	state
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	ldr	r0, .L8+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	fillScreen
	.word	31775
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	fillScreen
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	r0, #31744
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L16+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	fillScreen
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L30
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L19
	ldr	r2, .L30+4
	ldrh	r0, [r2]
	ands	r0, r0, #8
	beq	.L28
.L19:
	tst	r3, #4
	beq	.L18
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	ands	r4, r3, #4
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L28:
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L30+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L29:
	ldr	r3, .L30+8
	ldr	r0, .L30+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+12
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.word	31775
	.size	pauseState, .-pauseState
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L34
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L34+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L35:
	.align	2
.L34:
	.word	fillScreen
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	push	{r4, lr}
	ands	r4, r3, #8
	beq	.L45
	pop	{r4, lr}
	bx	lr
.L45:
	ldr	r3, .L46+8
	ldr	r0, .L46+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+16
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	31775
	.word	state
	.size	loseState, .-loseState
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L60
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L49
	ldr	r2, .L60+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L58
.L49:
	tst	r3, #2
	beq	.L50
	ldr	r3, .L60+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L59
.L50:
	ldr	r3, .L60+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L58:
	bl	pauseState
	b	.L50
.L59:
	bl	loseState
	b	.L50
.L61:
	.align	2
.L60:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.size	gameState, .-gameState
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L69
	ldr	r4, .L69+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L62
	ldr	r3, .L69+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
.L62:
	pop	{r4, lr}
	bx	lr
.L68:
	bl	gameState
	ldr	r0, [r4]
	ldr	r3, .L69+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	srand
	.word	initGame
	.size	startState, .-startState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L82
	push	{r4, r7, fp, lr}
	ldr	r0, .L82+4
	strh	r2, [r3]	@ movhi
	ldr	r7, .L82+8
	mov	lr, pc
	bx	r7
	mov	r3, #0
	mov	r1, r3
	ldr	r4, .L82+12
	ldr	r9, .L82+16
	str	r3, [r4]
	ldr	r6, .L82+20
	ldr	fp, .L82+24
	ldr	r10, .L82+28
	ldr	r5, .L82+32
	ldr	r8, .L82+4
.L72:
	ldrh	r3, [r9]
.L73:
	strh	r3, [r6]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r9]	@ movhi
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L73
.L75:
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L74
.L74:
	mov	r0, #31
	mov	lr, pc
	bx	r7
	mov	r3, #3
	str	r3, [r4]
	ldr	r3, .L82+36
	mov	lr, pc
	bx	r3
.L79:
	ldr	r1, [r4]
	b	.L72
.L76:
	mov	r0, #31744
	mov	lr, pc
	bx	r7
	mov	r3, #2
	str	r3, [r4]
	ldr	r3, .L82+40
	mov	lr, pc
	bx	r3
	b	.L79
.L77:
	mov	r0, #0
	mov	lr, pc
	bx	r7
	mov	r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r10
	b	.L79
.L78:
	mov	r0, r8
	mov	lr, pc
	bx	r7
	mov	r3, #0
	str	r3, [r4]
	mov	lr, pc
	bx	fp
	b	.L79
.L83:
	.align	2
.L82:
	.word	1027
	.word	31775
	.word	fillScreen
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	67109120
	.word	loseState
	.word	pauseState
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
