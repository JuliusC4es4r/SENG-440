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
	.file	"final_optimized.c"
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
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	ble	.L4
	mov	r0, #10
	bl	putchar
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L5
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r5, [r3]
	mov	r6, #0
	b	.L9
.L16:
	mov	r4, #1
	b	.L10
.L15:
	mov	r2, r6
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r3, [r3, r4, lsl #2]
	cmp	r5, r3
	bge	.L11
	mov	r2, r6
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r5, [r3, r4, lsl #2]
.L11:
	mov	r2, r6
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	cmp	r5, r3
	bge	.L12
	mov	r2, r6
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	add	r2, r4, #1
	ldr	r5, [r3, r2, lsl #2]
.L12:
	mov	r3, r6
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r3, [r3, r4, lsl #2]
	cmp	r5, r3
	bge	.L13
	mov	r3, r6
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r5, [r3, r4, lsl #2]
.L13:
	mov	r3, r6
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	cmp	r5, r3
	bge	.L14
	mov	r3, r6
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	add	r2, r4, #1
	ldr	r5, [r3, r2, lsl #2]
.L14:
	add	r4, r4, #2
.L10:
	cmp	r4, #4
	ble	.L15
	add	r6, r6, #2
.L9:
	cmp	r6, #5
	ble	.L16
	mov	r1, r5
	mov	r0, #65536
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, pc}
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
	b	.L19
.L22:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L20
.L21:
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
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r2, r2, #1
	ldr	r1, [r3, r2, lsl #2]
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r2, r2, #1
	ldr	r0, [fp, #-20]
	mul	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	ldr	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
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
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r2, r2, #1
	ldr	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r2, r2, #1
	ldr	r0, [fp, #-20]
	mul	r1, r0, r1
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	str	r3, [fp, #-12]
.L20:
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	ble	.L21
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L19:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L22
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
	push	{r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r4, #0
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L36:
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L25
.L34:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	bge	.L26
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L27
.L26:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L27:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	bge	.L28
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L29
.L28:
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L29:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	bge	.L30
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L31
.L30:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L31:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	ldr	r3, [r3, r2, lsl #2]
	cmp	r3, #0
	bge	.L32
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L33
.L32:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r2, r2, #1
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L33:
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
.L25:
	ldr	r3, [fp, #-16]
	cmp	r3, #5
	ble	.L34
	ldr	r3, [fp, #-12]
	cmp	r3, r4
	ble	.L35
	ldr	r4, [fp, #-12]
.L35:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L36
	vmov	s15, r4	@ int
	vcvt.f32.s32	s15, s15
	vmov.f32	s0, s15
	sub	sp, fp, #4
	@ sp needed
	pop	{r4, fp}
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
	push	{r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r4, #0
	b	.L39
.L40:
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r3, [r3, r4, lsl #2]
	str	r3, [fp, #-8]
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
	ldr	r2, [r1, r4, lsl #2]
	str	r2, [r3, r4, lsl #2]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	str	r2, [r3, r4, lsl #2]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	add	r2, r4, #1
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r1, r3, r2
	add	r0, r4, #1
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	add	r2, r4, #1
	ldr	r1, [r1, r0, lsl #2]
	str	r1, [r3, r2, lsl #2]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	add	r2, r4, #1
	ldr	r1, [fp, #-8]
	str	r1, [r3, r2, lsl #2]
	add	r4, r4, #2
.L39:
	cmp	r4, #5
	ble	.L40
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{r4, fp}
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
	.global	inversionProcess
	.syntax unified
	.arm
	.fpu vfp
	.type	inversionProcess, %function
inversionProcess:
	@ args = 12, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r4, [fp, #12]
	b	.L44
.L48:
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #4]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #4]
	cmp	r2, r3
	bge	.L45
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #4]
	str	r4, [fp, #8]
.L45:
	mov	r3, r4
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #4]
	mov	r3, r4
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #4]
	cmp	r2, r3
	bge	.L46
	mov	r3, r4
	add	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #4]
	add	r3, r4, #1
	str	r3, [fp, #8]
.L46:
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #48
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #4]
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #48
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	ldr	r2, [fp, #4]
	cmp	r2, r3
	bge	.L47
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r3, #48
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #12]
	ldr	r3, [r3, r2, lsl #2]
	str	r3, [fp, #4]
	add	r3, r4, #2
	str	r3, [fp, #8]
.L47:
	add	r4, r4, #3
.L44:
	ldr	r3, [fp, #-32]
	cmp	r4, r3
	blt	.L48
	ldr	r2, [fp, #8]
	ldr	r3, [fp, #12]
	cmp	r2, r3
	beq	.L49
	mov	r2, #0
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	swapRows
	mov	r2, #0
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	swapRows
	mov	r2, #1
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	swapRows
	mov	r2, #1
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	swapRows
	mov	r4, #2
	b	.L50
.L51:
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	swapRows
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	swapRows
	add	r3, r4, #1
	mov	r2, r3
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	swapRows
	add	r3, r4, #1
	mov	r2, r3
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	swapRows
	add	r4, r4, #2
.L50:
	ldr	r3, [fp, #-32]
	cmp	r4, r3
	blt	.L51
.L49:
	ldr	r2, [fp, #12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r5, [r3, r2, lsl #2]
	cmp	r5, #0
	bne	.L52
	ldr	r0, .L61
	bl	puts
	b	.L43
.L52:
	mov	r3, r5
	mov	r2, #0
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	scaleElement
	mov	r3, r5
	mov	r2, #0
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	scaleElement
	mov	r3, r5
	mov	r2, #1
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	scaleElement
	mov	r3, r5
	mov	r2, #1
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	scaleElement
	mov	r6, #2
	b	.L54
.L55:
	mov	r3, r5
	mov	r2, r6
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	scaleElement
	mov	r3, r5
	mov	r2, r6
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	scaleElement
	add	r2, r6, #1
	mov	r3, r5
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	scaleElement
	add	r2, r6, #1
	mov	r3, r5
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	scaleElement
	add	r6, r6, #2
.L54:
	ldr	r3, [fp, #-32]
	cmp	r6, r3
	blt	.L55
	mov	r4, #0
	b	.L56
.L60:
	mov	r2, r4
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	ldr	r2, [fp, #12]
	ldr	r5, [r3, r2, lsl #2]
	ldr	r3, [fp, #12]
	cmp	r4, r3
	beq	.L57
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	addElement
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	addElement
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, #1
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	addElement
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, #1
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	addElement
	mov	r6, #2
	b	.L58
.L59:
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, r6
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	addElement
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, r6
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	addElement
	add	r2, r6, #1
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-24]
	bl	addElement
	add	r2, r6, #1
	rsb	r3, r5, #0
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r4
	ldr	r1, [fp, #12]
	ldr	r0, [fp, #-28]
	bl	addElement
	add	r6, r6, #2
.L58:
	ldr	r3, [fp, #-32]
	cmp	r6, r3
	blt	.L59
.L57:
	add	r4, r4, #1
.L56:
	ldr	r3, [fp, #-32]
	cmp	r4, r3
	blt	.L60
.L43:
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, pc}
.L62:
	.align	2
.L61:
	.word	.LC1
	.size	inversionProcess, .-inversionProcess
	.align	2
	.global	invertMatrix
	.syntax unified
	.arm
	.fpu vfp
	.type	invertMatrix, %function
invertMatrix:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r4, #0
	b	.L64
.L65:
	mov	r6, #0
	mov	r5, r4
	str	r4, [sp, #8]
	str	r5, [sp, #4]
	str	r6, [sp]
	mov	r3, r7
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	inversionProcess
	add	r5, r4, #1
	add	r3, r4, #1
	str	r3, [sp, #8]
	str	r5, [sp, #4]
	str	r6, [sp]
	mov	r3, r7
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-24]
	bl	inversionProcess
	add	r4, r4, #2
.L64:
	ldr	r3, [fp, #-32]
	cmp	r4, r3
	blt	.L65
	nop
	nop
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, pc}
	.size	invertMatrix, .-invertMatrix
	.align	2
	.global	startProcess
	.syntax unified
	.arm
	.fpu vfp
	.type	startProcess, %function
startProcess:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	ldr	r0, .L67
	bl	scaleFactorCalculation
	mov	r4, r0
	ldr	r0, .L67
	bl	approximateNorm
	mov	r1, r4
	ldr	r0, .L67+4
	bl	scaleMatrix
	mov	r3, r4
	mov	r2, #6
	ldr	r1, .L67+4
	ldr	r0, .L67
	bl	invertMatrix
	ldr	r0, .L67+4
	bl	approximateNorm
	nop
	pop	{r4, r5, fp, pc}
.L68:
	.align	2
.L67:
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
	b	.L70
.L71:
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
	vldr.64	d6, .L73
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
.L70:
	ldr	r3, [fp, #-16]
	cmp	r3, #99
	ble	.L71
	vldr.64	d7, [fp, #-12]
	vldr.64	d6, .L73+8
	vdiv.f64	d5, d7, d6
	vmov	r2, r3, d5
	ldr	r0, .L73+16
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L74:
	.align	3
.L73:
	.word	0
	.word	1093567616
	.word	0
	.word	1079574528
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (Raspbian 10.2.1-6+rpi1) 10.2.1 20210110"
	.section	.note.GNU-stack,"",%progbits
