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
	.file	"lab01.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRect
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldr	r3, [r3]
	rsb	r1, r1, r1, lsl #4
	add	r2, r0, r1, lsl #4
	add	r3, r3, #2880
	ldr	r1, .L10+4
	add	r2, r3, r2, lsl #1
	add	ip, r0, #9
.L6:
	sub	r3, r2, #2880
.L7:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L7
	add	r0, r0, #1
	cmp	r0, ip
	add	r2, r3, #2
	bne	.L6
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	32736
	.size	drawRect, .-drawRect
	.align	2
	.global	drawLetter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLetter, %function
drawLetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	lr, #31
	ldr	r3, .L18
	ldr	r3, [r3]
	rsb	r1, r1, r1, lsl #4
	add	ip, r3, #24064
	add	r2, r0, r1, lsl #4
	add	ip, ip, #36
	add	ip, ip, r2, lsl #1
	lsl	r5, r2, #1
	lsl	r4, r1, #4
	add	r2, r3, r2, lsl #1
.L13:
	strh	lr, [r2]	@ movhi
	add	r2, r2, #480
	add	r2, r2, #2
	cmp	r2, ip
	bne	.L13
	mov	r1, #31
	add	r0, r0, r4
	add	r0, r0, #12032
	add	r2, r3, #200
	add	r0, r0, #18
	add	r3, r3, r0, lsl #1
	add	r2, r2, r5
.L14:
	strh	r1, [r3]	@ movhi
	sub	r3, r3, #476
	sub	r3, r3, #2
	cmp	r2, r3
	bne	.L14
	pop	{r4, r5, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawLetter, .-drawLetter
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
	ldr	r3, .L27
	ldr	r1, .L27+4
	ldr	r3, [r3]
	push	{r4, lr}
	strh	r1, [r2]	@ movhi
	ldr	r1, .L27+8
	add	r2, r3, #24064
	add	r3, r3, #5248
	strh	r1, [r2, #36]	@ movhi
	add	r0, r3, #56
	add	r2, r3, #38
.L21:
	sub	r3, r2, #2880
.L22:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L22
	add	r2, r3, #2
	cmp	r2, r0
	bne	.L21
	mov	r1, #10
	mov	r0, #20
	ldr	r4, .L27+12
	mov	lr, pc
	bx	r4
	mov	r1, #50
	mov	r0, r1
	mov	lr, pc
	bx	r4
.L24:
	b	.L24
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.word	1027
	.word	32736
	.word	drawLetter
	.size	main, .-main
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 53) 9.1.0"
