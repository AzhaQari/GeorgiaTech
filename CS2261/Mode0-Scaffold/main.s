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
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r3, #3904
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+12
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	screenStatesPal
	.word	screenStatesTiles
	.word	100720640
	.word	screenStatesMap
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
	mov	r3, #512
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
	.word	froggerPal
	.word	DMANow
	.word	100728832
	.word	froggerTiles
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
	mov	r3, #208
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
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L17
	ldr	r3, .L23+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
.L17:
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	bl	goToGame
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	b	.L17
.L24:
	.align	2
.L23:
	.word	hideSprites
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
	ldr	r4, .L27
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L27+4
	mov	lr, pc
	bx	r4
	mov	r3, #464
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L27+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L27+12
	mov	r0, #3
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L27+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	DMANow
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	state
	.size	goToPause, .-goToPause
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
	ldr	r3, .L41
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L41+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L39:
	pop	{r4, lr}
	b	goToGame
.L40:
	pop	{r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
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
	ldr	r4, .L45
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L45+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r0, #3
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, .L45+8
	mov	r2, #100663296
	ldr	r1, .L45+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L45+16
	mov	r0, #3
	ldr	r1, .L45+20
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L45+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
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
	ldr	r3, .L54
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L54+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L53
.L47:
	pop	{r4, lr}
	bx	lr
.L53:
	pop	{r4, lr}
	b	goToStart
.L55:
	.align	2
.L54:
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
	ldr	r4, .L58
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L58+4
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #7168
	mov	r3, #960
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L58+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L58+12
	mov	r0, #3
	ldr	r1, .L58+16
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L58+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
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
	push	{r4, lr}
	ldr	r4, .L74
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L61
	ldr	r2, .L74+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L71
.L61:
	tst	r3, #4
	beq	.L62
	ldr	r3, .L74+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L72
.L62:
	ldr	r3, .L74+8
	ldr	r3, [r3]
	cmp	r3, #16
	ble	.L73
.L63:
	ldr	r3, .L74+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L74+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L74+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L73:
	bl	goToWin
	b	.L63
.L72:
	bl	goToLose
	b	.L62
.L71:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L61
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	buttons
	.word	player
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
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r9, .L85+4
	ldr	r4, .L85+8
	ldr	r8, .L85+12
	ldr	fp, .L85+16
	ldr	r10, .L85+20
	ldr	r6, .L85+24
	ldr	r7, .L85+28
	ldr	r5, .L85+32
.L83:
	ldrh	r3, [r4]
	strh	r3, [r9]	@ movhi
	ldr	r3, [r8]
	ldrh	r2, [r7, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L77
.L79:
	.word	.L82
	.word	.L81
	.word	.L80
	.word	.L78
	.word	.L78
.L78:
	mov	lr, pc
	bx	r10
.L77:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L83
.L80:
	ldr	r3, .L85+36
	mov	lr, pc
	bx	r3
	b	.L77
.L82:
	mov	lr, pc
	bx	fp
	b	.L77
.L81:
	ldr	r3, .L85+40
	mov	lr, pc
	bx	r3
	b	.L77
.L86:
	.align	2
.L85:
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
	.comm	buffer,41,4
	.comm	shadowOAM,1024,4
	.comm	seed,4,4
	.comm	hOff,2,2
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
