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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState.part.0, %function
pauseState.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	ldr	r0, .L4+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	fillScreen
	.word	32736
	.word	state
	.size	pauseState.part.0, .-pauseState.part.0
	.set	loseState.part.0,pauseState.part.0
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
	mov	r3, #67108864
	ldr	r2, .L8
	push	{r4, lr}
	ldr	r0, .L8+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	1027
	.word	32736
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
	ldr	r3, .L12
	ldr	r0, .L12+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L12+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	fillScreen
	.word	32736
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
	ldr	r3, .L16
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r3, .L20
	mov	r0, #31744
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L20+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
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
	ldr	r3, .L36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L36+4
	ldrh	r0, [r2]
	ands	r0, r0, #8
	beq	.L35
.L23:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	pauseState.part.0
.L35:
	push	{r4, lr}
	ldr	r3, .L36+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L36+12
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	pauseState, .-pauseState
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
	ldr	r3, .L50
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L39
	ldr	r2, .L50+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L48
.L39:
	tst	r3, #2
	beq	.L40
	ldr	r3, .L50+12
	ldr	r2, .L50+16
	ldrh	r3, [r3]
	ldrh	r2, [r2, #32]
	and	r3, r3, #2
	orrs	r3, r3, r2
	beq	.L49
.L40:
	ldr	r3, .L50+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L48:
	mov	r0, #31744
	ldr	r3, .L50+24
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L50+28
	str	r2, [r3]
	bl	pauseState
	b	.L40
.L49:
	bl	loseState.part.0
	b	.L40
.L51:
	.align	2
.L50:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	player
	.word	waitForVBlank
	.word	fillScreen
	.word	state
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
	ldr	r2, .L59
	ldr	r4, .L59+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L52
	ldr	r3, .L59+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L58
.L52:
	pop	{r4, lr}
	bx	lr
.L58:
	bl	gameState
	ldr	r0, [r4]
	ldr	r3, .L59+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
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
	ldr	r2, .L72
	push	{r4, r7, fp, lr}
	ldr	r0, .L72+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L72+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r6, .L72+12
	ldr	fp, .L72+16
	mov	r2, r3
	str	r3, [r6]
	ldr	r5, .L72+20
	ldrh	r3, [fp]
	ldr	r10, .L72+24
	ldr	r9, .L72+28
	ldr	r8, .L72+32
	ldr	r7, .L72+36
	ldr	r4, .L72+40
.L63:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L63
.L65:
	.word	.L68
	.word	.L67
	.word	.L66
	.word	.L64
.L64:
	ldrh	r0, [r7, #32]
	cmp	r0, #0
	bne	.L63
	ldr	r3, .L72+44
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r3, [fp]
	b	.L63
.L66:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r3, [fp]
	b	.L63
.L67:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r3, [fp]
	b	.L63
.L68:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r3, [fp]
	b	.L63
.L73:
	.align	2
.L72:
	.word	1027
	.word	32736
	.word	fillScreen
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	player
	.word	67109120
	.word	loseState.part.0
	.size	main, .-main
	.text
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
	ldr	r3, .L76
	mov	r0, #31
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L76+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L77:
	.align	2
.L76:
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
	@ link register save eliminated.
	ldr	r3, .L80
	ldrh	r3, [r3, #32]
	cmp	r3, #0
	bxne	lr
	b	loseState.part.0
.L81:
	.align	2
.L80:
	.word	player
	.size	loseState, .-loseState
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
