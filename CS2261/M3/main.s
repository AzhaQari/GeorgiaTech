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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"hello\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	ldr	r0, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r3, #1712
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	printf
	.word	.LC0
	.word	DMANow
	.word	splashScreenPal
	.word	splashScreenTiles
	.word	100720640
	.word	splashScreenMap
	.word	state
	.size	goToStart, .-goToStart
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
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	ldr	r2, .L10
	ldr	r1, .L10+4
	ldr	r4, .L10+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L10+12
	ldr	r1, .L10+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #512
	ldr	r3, .L10+20
	add	r2, r3, #1024
.L7:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L7
	mov	r2, #0
	ldr	r3, .L10+24
	ldr	r1, .L10+28
	ldrh	r0, [r3, #48]
	ldr	r3, .L10+32
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L11:
	.align	2
.L10:
	.word	83886592
	.word	playerPal
	.word	DMANow
	.word	100728832
	.word	playerTiles
	.word	shadowOAM
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
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
	mov	r3, #256
	ldr	r4, .L14
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L14+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r3, #1888
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L14+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L14+12
	mov	r0, #3
	ldr	r1, .L14+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L14+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L15:
	.align	2
.L14:
	.word	DMANow
	.word	backgroundPal
	.word	backgroundTiles
	.word	100720640
	.word	backgroundMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L18
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L18+4
	mov	lr, pc
	bx	r4
	mov	r3, #1248
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L18+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L18+12
	mov	r0, #3
	ldr	r1, .L18+16
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L18+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L19:
	.align	2
.L18:
	.word	DMANow
	.word	instructionsScreenPal
	.word	instructionsScreenTiles
	.word	100720640
	.word	instructionsScreenMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L32
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L21
	ldr	r2, .L32+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L30
.L21:
	tst	r3, #4
	beq	.L22
	ldr	r3, .L32+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L31
.L22:
	ldr	r3, .L32+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	bl	goToInstructions
	b	.L22
.L30:
	bl	goToGame
	ldr	r3, .L32+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L21
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	initGame
	.size	start, .-start
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
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L36
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L36+4
	mov	lr, pc
	bx	r4
	mov	r3, #944
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L36+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L36+12
	mov	r0, #3
	ldr	r1, .L36+16
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L36+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L37:
	.align	2
.L36:
	.word	DMANow
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L50
	ldr	r3, .L50+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L39
	ldr	r2, .L50+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L48
.L39:
	tst	r3, #4
	beq	.L38
	ldr	r3, .L50+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L49
.L38:
	pop	{r4, lr}
	bx	lr
.L49:
	pop	{r4, lr}
	b	goToStart
.L48:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L39
.L51:
	.align	2
.L50:
	.word	oldButtons
	.word	hideSprites
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L64
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
	ldr	r2, .L64+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L62
.L53:
	tst	r3, #4
	beq	.L52
	ldr	r3, .L64+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L63
.L52:
	pop	{r4, lr}
	bx	lr
.L62:
	pop	{r4, lr}
	b	goToGame
.L63:
	pop	{r4, lr}
	b	goToStart
.L65:
	.align	2
.L64:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L68
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L68+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L68+8
	mov	r2, #100663296
	ldr	r1, .L68+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L68+16
	mov	r0, #3
	ldr	r1, .L68+20
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L68+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L69:
	.align	2
.L68:
	.word	DMANow
	.word	winScreenPal
	.word	5456
	.word	winScreenTiles
	.word	100720640
	.word	winScreenMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L77
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L76
.L70:
	pop	{r4, lr}
	bx	lr
.L76:
	pop	{r4, lr}
	b	goToStart
.L78:
	.align	2
.L77:
	.word	hideSprites
	.word	oldButtons
	.word	buttons
	.size	win, .-win
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
	mov	r3, #256
	ldr	r4, .L81
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L81+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r3, #704
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L81+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L81+12
	mov	r0, #3
	ldr	r1, .L81+16
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L81+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L82:
	.align	2
.L81:
	.word	DMANow
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100720640
	.word	loseScreenMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L92
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L84
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L84:
	ldr	r3, .L92+8
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L91
.L85:
	ldr	r3, .L92+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L92+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L92+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L92+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L91:
	bl	goToLose
	b	.L85
.L90:
	bl	goToPause
	b	.L84
.L93:
	.align	2
.L92:
	.word	oldButtons
	.word	buttons
	.word	health
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	game, .-game
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L104
	mov	lr, pc
	bx	r3
	ldr	r9, .L104+4
	ldr	r4, .L104+8
	ldr	r8, .L104+12
	ldr	fp, .L104+16
	ldr	r10, .L104+20
	ldr	r6, .L104+24
	ldr	r7, .L104+28
	ldr	r5, .L104+32
.L102:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldr	r3, [r8]
	ldrh	r2, [r7, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L95
.L97:
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L96
	.word	.L96
.L96:
	mov	lr, pc
	bx	r10
.L95:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L102
.L98:
	ldr	r3, .L104+36
	mov	lr, pc
	bx	r3
	b	.L95
.L99:
	ldr	r3, .L104+40
	mov	lr, pc
	bx	r3
	b	.L95
.L101:
	mov	lr, pc
	bx	fp
	b	.L95
.L100:
	ldr	r3, .L104+44
	mov	lr, pc
	bx	r3
	b	.L95
.L105:
	.align	2
.L104:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	start
	.word	win
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	pause
	.word	instructions
	.word	game
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
