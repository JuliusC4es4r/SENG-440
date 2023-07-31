	.file	"hardware_multiplier.c"
	.text
	.globl	_hardwareMultiplier
	.def	_hardwareMultiplier;	.scl	2;	.type	32;	.endef
_hardwareMultiplier:
LFB13:
	.cfi_startproc
	nop
	ret
	.cfi_endproc
LFE13:
	.globl	_scaleMatrix
	.def	_scaleMatrix;	.scl	2;	.type	32;	.endef
_scaleMatrix:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	$0, -12(%ebp)
	jmp	L3
L6:
	movl	$0, -16(%ebp)
	jmp	L4
L5:
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	(%edx,%eax,4), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	%ecx, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_hardwareMultiplier
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%ebx,%eax,4)
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	$1, %edx
	movl	(%eax,%edx,4), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	-16(%ebp), %eax
	leal	1(%eax), %esi
	movl	%ecx, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_hardwareMultiplier
	movl	%eax, (%ebx,%esi,4)
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	(%edx,%eax,4), %ecx
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	%ecx, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_hardwareMultiplier
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%ebx,%eax,4)
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	-16(%ebp), %edx
	addl	$1, %edx
	movl	(%eax,%edx,4), %ecx
	movl	-12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	leal	(%edx,%eax), %ebx
	movl	-16(%ebp), %eax
	leal	1(%eax), %esi
	movl	%ecx, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_hardwareMultiplier
	movl	%eax, (%ebx,%esi,4)
	addl	$2, -16(%ebp)
L4:
	cmpl	$5, -16(%ebp)
	jle	L5
	addl	$2, -12(%ebp)
L3:
	cmpl	$5, -12(%ebp)
	jle	L6
	nop
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
