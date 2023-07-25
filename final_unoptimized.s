	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"final_unoptimized.c"
	.text
	.global	wellConditionedMatrix
	.data
	.align	2
	.type	wellConditionedMatrix, %object
	.size	wellConditionedMatrix, 144
wellConditionedMatrix:
	.word	5
	.word	2
	.word	1
	.word	1
	.word	2
	.word	1
	.word	5
	.word	1
	.word	7
	.word	5
	.word	9
	.word	3
	.word	7
	.word	1
	.word	1
	.word	1
	.word	1
	.word	2
	.word	1
	.word	1
	.word	4
	.word	1
	.word	3
	.word	2
	.word	1
	.word	2
	.word	8
	.word	2
	.word	2
	.word	1
	.word	1
	.word	9
	.word	0
	.word	5
	.word	1
	.word	3
	.global	wellConditionedInversionResult
	.align	2
	.type	wellConditionedInversionResult, %object
	.size	wellConditionedInversionResult, 144
wellConditionedInversionResult:
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.global	illConditionedMatrix
	.align	2
	.type	illConditionedMatrix, %object
	.size	illConditionedMatrix, 144
illConditionedMatrix:
	.word	1
	.word	2
	.word	1
	.word	1
	.word	2
	.word	1
	.word	5
	.word	33
	.word	7
	.word	1
	.word	1
	.word	3
	.word	7
	.word	1
	.word	1
	.word	4
	.word	1
	.word	2
	.word	1
	.word	1
	.word	5
	.word	2
	.word	3
	.word	7
	.word	1
	.word	2
	.word	5
	.word	50
	.word	2
	.word	1
	.word	1
	.word	20
	.word	1
	.word	1
	.word	1
	.word	2
	.global	illConditionedInversionResult
	.align	2
	.type	illConditionedInversionResult, %object
	.size	illConditionedInversionResult, 144
illConditionedInversionResult:
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%12d \000"
	.text
	.align	2
	.global	printMatrix
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	printMatrix, %function
printMatrix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	ldr	r3, [r3, r2, lsl #2]
	mov	r1, r3
	ldr	r0, .L6
	bl	printf
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L4
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L5
	mov	r0, #10
	bl	putchar
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L7:
	.align	2
.L6:
	.word	.LC0
	.size	printMatrix, .-printMatrix
	.global	__aeabi_idiv
	.align	2
	.global	scaleFactorCalculation
	.syntax unified
	.arm
	.fpu vfp
	.type	scaleFactorCalculation, %function
scaleFactorCalculation:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L9
.L13:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L10
.L12:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	bge	.L11
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-8]
.L11:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-16]
	cmp	r3, #5
	ble	.L12
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L9:
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	ble	.L13
	ldr	r1, [fp, #-8]
	mov	r0, #65536
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	scaleFactorCalculation, .-scaleFactorCalculation
	.align	2
	.global	scaleMatrix
	.syntax unified
	.arm
	.fpu vfp
	.type	scaleMatrix, %function
scaleMatrix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L16
.L19:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L17
.L18:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	ldr	r1, [r3, r2, lsl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	mul	r1, r2, r1
	ldr	r2, [fp, #-12]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L17:
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	ble	.L18
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L16:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L19
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	scaleMatrix, .-scaleMatrix
	.align	2
	.global	approximateNorm
	.syntax unified
	.arm
	.fpu vfp
	.type	approximateNorm, %function
approximateNorm:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L21
.L27:
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L22
.L25:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	bge	.L23
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-16]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	b	.L24
.L23:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
.L24:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L22:
	ldr	r3, [fp, #-20]
	cmp	r3, #5
	ble	.L25
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	ble	.L26
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L26:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L21:
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	ble	.L27
	ldr	r3, [fp, #-8]
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vmov.f32	s0, s15
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	approximateNorm, .-approximateNorm
	.align	2
	.global	swapRows
	.syntax unified
	.arm
	.fpu vfp
	.type	swapRows, %function
swapRows:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L30
.L31:
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r1, r3, r2
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r1, [r1, r2, lsl #2]
	ldr	r2, [fp, #-8]
	str	r1, [r3, r2, lsl #2]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-12]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L30:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L31
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	swapRows, .-swapRows
	.align	2
	.global	scaleElement
	.syntax unified
	.arm
	.fpu vfp
	.type	scaleElement, %function
scaleElement:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-24]
	ldr	r0, [r3, r2, lsl #2]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r4, r3, r2
	ldr	r1, [fp, #-28]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r4, r3, lsl #2]
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
	.size	scaleElement, .-scaleElement
	.align	2
	.global	addElement
	.syntax unified
	.arm
	.fpu vfp
	.type	addElement, %function
addElement:
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	ldr	r0, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #4]
	mul	r1, r2, r3
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	add	r1, r0, r1
	ldr	r2, [fp, #-20]
	str	r1, [r3, r2, lsl #2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	addElement, .-addElement
	.section	.rodata
	.align	2
.LC1:
	.ascii	"divide by zero error\012\000"
	.text
	.align	2
	.global	invertMatrix
	.syntax unified
	.arm
	.fpu vfp
	.type	invertMatrix, %function
invertMatrix:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L35
.L55:
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	b	.L36
.L38:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bge	.L37
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
.L37:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L36:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L38
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L39
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L40
.L41:
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-32]
	bl	swapRows
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L40:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L41
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L42
.L43:
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-36]
	bl	swapRows
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L42:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L43
.L39:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L44
	ldr	r0, .L56
	bl	puts
	b	.L34
.L44:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L46
.L47:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-36]
	bl	scaleElement
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L46:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L47
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L48
.L49:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-36]
	bl	scaleElement
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L48:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L49
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L50
.L54:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L51
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L52
.L53:
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #0
	str	r3, [sp]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-32]
	bl	addElement
	ldr	r3, [fp, #-28]
	rsb	r3, r3, #0
	str	r3, [sp]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-36]
	bl	addElement
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L52:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L53
.L51:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L50:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L54
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L35:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L55
.L34:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L57:
	.align	2
.L56:
	.word	.LC1
	.size	invertMatrix, .-invertMatrix
	.align	2
	.global	startProcess
	.syntax unified
	.arm
	.fpu vfp
	.type	startProcess, %function
startProcess:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r0, .L59+4
	bl	scaleFactorCalculation
	str	r0, [fp, #-8]
	ldr	r0, .L59+4
	bl	approximateNorm
	vstr.32	s0, [fp, #-12]
	ldr	r1, [fp, #-8]
	ldr	r0, .L59+8
	bl	scaleMatrix
	ldr	r3, [fp, #-8]
	mov	r2, #6
	ldr	r1, .L59+8
	ldr	r0, .L59+4
	bl	invertMatrix
	ldr	r0, .L59+8
	bl	approximateNorm
	vstr.32	s0, [fp, #-16]
	vldr.32	s14, [fp, #-16]
	vldr.32	s15, [fp, #-12]
	vmul.f32	s14, s14, s15
	vldr.32	s13, .L59
	vdiv.f32	s15, s14, s13
	vstr.32	s15, [fp, #-20]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L60:
	.align	2
.L59:
	.word	1199570944
	.word	wellConditionedMatrix
	.word	wellConditionedInversionResult
	.size	startProcess, .-startProcess
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Run time avg: %.2f\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L62
.L63:
	sub	r3, fp, #36
	mov	r1, #0
	mov	r0, r3
	bl	gettimeofday
	bl	startProcess
	sub	r3, fp, #44
	mov	r1, #0
	mov	r0, r3
	bl	gettimeofday
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vldr.64	d6, .L65
	vmul.f64	d6, d7, d6
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	sub	r3, r2, r3
	vmov	s15, r3	@ int
	vcvt.f64.s32	d7, s15
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-28]
	vldr.64	d6, [fp, #-12]
	vldr.64	d7, [fp, #-28]
	vadd.f64	d7, d6, d7
	vstr.64	d7, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L62:
	ldr	r3, [fp, #-16]
	cmp	r3, #99
	ble	.L63
	vldr.64	d7, [fp, #-12]
	vldr.64	d6, .L65+8
	vdiv.f64	d5, d7, d6
	vmov	r2, r3, d5
	ldr	r0, .L65+16
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L66:
	.align	3
.L65:
	.word	0
	.word	1093567616
	.word	0
	.word	1079574528
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (Raspbian 10.2.1-6+rpi1) 10.2.1 20210110"
	.section	.note.GNU-stack,"",%progbits
