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
.LC2:
	.ascii	"CS 2261\000"
	.align	2
.LC1:
	.ascii	"GAME BOY\000"
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L7
	sub	sp, sp, #28
	ldr	r3, .L7+4
	mov	lr, pc
	bx	r3
	mov	r2, sp
	ldr	r1, .L7+8
	ldr	r3, .L7+12
	ldm	r1, {r0, r1}
	mov	r6, r2
	stm	r2, {r0, r1}
	ldm	r3, {r0, r1, r2, r3}
	add	lr, sp, #8
	mov	r5, lr
	mov	r4, #72
	mov	ip, #71
	stm	lr, {r0, r1, r2, r3}
	ldr	r7, .L7+16
	b	.L3
.L6:
	ldrb	ip, [r6, #1]!	@ zero_extendqisi2
.L3:
	mov	r0, r4
	mov	r2, ip
	mov	r1, #70
	ldrh	r3, [r5], #2
	add	r4, r4, #12
	mov	lr, pc
	bx	r7
	cmp	r4, #168
	bne	.L6
	mov	r1, #96
	mov	r0, #99
	ldr	r3, .L7+20
	ldr	r2, .L7+24
	ldr	r4, .L7+28
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L7+32
	ldr	r2, .L7+36
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	28274
	.word	fillScreen
	.word	.LC1
	.word	.LANCHOR0
	.word	drawChar
	.word	15855
	.word	.LC2
	.word	drawString
	.word	state
	.word	seed
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
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L10
	strh	r2, [r3]	@ movhi
	b	goToStart
.L11:
	.align	2
.L10:
	.word	1027
	.size	initialize, .-initialize
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Ball Count: \000"
	.text
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
	mov	r0, #0
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	ldr	r4, .L14+4
	ldr	r3, .L14+8
	ldr	r2, .L14+12
	mov	r1, #145
	mov	r0, #5
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L14+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L15:
	.align	2
.L14:
	.word	fillScreen
	.word	drawString
	.word	32736
	.word	.LC3
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
	push	{r4, lr}
	ldr	r4, .L23
	ldr	r3, [r4]
	ldr	r2, .L23+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L23+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L16
	ldr	r3, .L23+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L22
.L16:
	pop	{r4, lr}
	bx	lr
.L22:
	ldr	r0, [r4]
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L23+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"PAUSE\000"
	.text
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
	mov	r0, #16896
	ldr	r3, .L27
	mov	lr, pc
	bx	r3
	mov	r1, #12
	ldr	r3, .L27+4
	ldr	r2, .L27+8
	ldr	r4, .L27+12
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L27+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L28:
	.align	2
.L27:
	.word	fillScreen
	.word	15855
	.word	.LC4
	.word	drawString
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
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"WIN\000"
	.text
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
	ldr	r0, .L45
	ldr	r3, .L45+4
	mov	lr, pc
	bx	r3
	mov	r1, #12
	mov	r3, #992
	ldr	r2, .L45+8
	ldr	r4, .L45+12
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L45+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L46:
	.align	2
.L45:
	.word	32625
	.word	fillScreen
	.word	.LC5
	.word	drawString
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
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"LOSE\000"
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
	ldr	r0, .L58
	ldr	r3, .L58+4
	mov	lr, pc
	bx	r3
	mov	r1, #12
	mov	r3, #31
	ldr	r2, .L58+8
	ldr	r4, .L58+12
	mov	r0, r1
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L58+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	13619
	.word	fillScreen
	.word	.LC6
	.word	drawString
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"%d\000"
	.text
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
	push	{r4, r5, lr}
	ldr	r4, .L74
	sub	sp, sp, #12
	ldr	r3, .L74+4
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L74+8
	ldr	r3, .L74+12
	ldr	r0, .L74+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L74+24
	mov	lr, pc
	bx	r3
	mov	r2, #0
	mov	r3, #8
	mov	r1, #145
	mov	r0, #76
	str	r2, [sp]
	ldr	r5, .L74+28
	mov	r2, #6
	mov	lr, pc
	bx	r5
	ldr	r3, .L74+32
	mov	r1, #145
	mov	r0, #76
	ldr	r2, .L74+16
	ldr	r5, .L74+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L74+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L61
	ldr	r2, .L74+44
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L71
.L61:
	ldr	r2, [r4]
	cmp	r2, #0
	beq	.L72
	tst	r3, #2
	beq	.L60
	ldr	r3, .L74+44
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L73
.L60:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L72:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToWin
.L71:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToPause
.L73:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L75:
	.align	2
.L74:
	.word	ballsRemaining
	.word	updateGame
	.word	.LC7
	.word	sprintf
	.word	buffer
	.word	waitForVBlank
	.word	drawGame
	.word	drawRect
	.word	13526
	.word	drawString
	.word	oldButtons
	.word	buttons
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
	mov	r2, #67108864
	ldr	r1, .L87
	push	{r4, r7, fp, lr}
	ldr	r3, .L87+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L87+8
	ldr	fp, .L87+12
	ldr	r5, .L87+16
	ldr	r10, .L87+20
	ldr	r9, .L87+24
	ldr	r8, .L87+28
	ldr	r7, .L87+32
	ldr	r4, .L87+36
.L77:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L78:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L78
.L80:
	.word	.L83
	.word	.L82
	.word	.L81
	.word	.L79
	.word	.L79
.L79:
	mov	lr, pc
	bx	r7
	b	.L77
.L81:
	mov	lr, pc
	bx	r8
	b	.L77
.L82:
	mov	lr, pc
	bx	r9
	b	.L77
.L83:
	mov	lr, pc
	bx	r10
	b	.L77
.L88:
	.align	2
.L87:
	.word	1027
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
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
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.short	13526
	.short	16668
	.short	21951
	.short	27295
	.short	28274
	.short	26437
	.short	21152
	.short	16896
	.ident	"GCC: (devkitARM release 53) 9.1.0"
