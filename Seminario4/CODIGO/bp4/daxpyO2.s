	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Faltan argumentos de entrada (n. componentes, alpha)"
	.align 8
.LC2:
	.string	"/ alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC3:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%d\t/ alpha*x[0]+y[0]=z[0](%8.6f*%8.6f+%8.6f=%8.6f) / / alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC4:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	cmpl	$2, %edi
	jle	.L24
	movq	8(%rsi), %rdi
	movq	%rsi, %r12
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%r12), %rdi
	xorl	%esi, %esi
	movq	%rax, %rbx
	movl	%eax, %ebp
	call	strtod@PLT
	movsd	%xmm0, 8(%rsp)
	cmpl	$33554432, %ebx
	jg	.L14
	cmpl	$8, %ebx
	jg	.L3
	testl	%ebx, %ebx
	jle	.L4
	pxor	%xmm1, %xmm1
	xorl	%eax, %eax
	movsd	.LC1(%rip), %xmm3
	leaq	y(%rip), %r12
	cvtsi2sdl	%ebx, %xmm1
	leaq	x(%rip), %rbx
	mulsd	%xmm3, %xmm1
	.p2align 4,,10
	.p2align 3
.L5:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	movsd	%xmm2, (%rbx,%rax,8)
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movsd	%xmm2, (%r12,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebp
	jg	.L5
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	leaq	z(%rip), %r13
	call	clock_gettime@PLT
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	8(%rsp), %xmm0
	mulsd	(%rbx,%rax,8), %xmm0
	addsd	(%r12,%rax,8), %xmm0
	movsd	%xmm0, 0(%r13,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebp
	jg	.L8
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	pxor	%xmm1, %xmm1
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	divsd	.LC5(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cmpl	$10, %ebp
	jg	.L25
	movl	%ebp, %esi
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	xorl	%r15d, %r15d
	call	printf@PLT
	leaq	.LC2(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L10:
	movsd	0(%r13,%r15,8), %xmm3
	movl	%r15d, %esi
	movl	%r15d, %ecx
	movl	%r15d, %edx
	movsd	(%r12,%r15,8), %xmm2
	movsd	(%rbx,%r15,8), %xmm1
	movq	%r14, %rdi
	movl	$4, %eax
	movsd	8(%rsp), %xmm0
	addq	$1, %r15
	call	printf@PLT
	cmpl	%r15d, %ebp
	jg	.L10
.L20:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	movl	$33554432, %ebp
.L3:
	leaq	x(%rip), %rbx
	leaq	y(%rip), %r12
	leal	-1(%rbp), %eax
	leaq	8(%rbx), %rdx
	movq	%rbx, %r13
	movq	%r12, %r15
	leaq	(%rdx,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L7:
	call	drand48@PLT
	addq	$8, %r13
	addq	$8, %r15
	movsd	%xmm0, -8(%r13)
	call	drand48@PLT
	movsd	%xmm0, -8(%r15)
	cmpq	%r13, %r14
	jne	.L7
	jmp	.L6
.L25:
	leal	-1(%rbp), %edx
	pushq	%rcx
	.cfi_def_cfa_offset 120
	movl	%ebp, %esi
	leaq	.LC3(%rip), %rdi
	movslq	%edx, %rax
	movl	%edx, %r8d
	movl	%edx, %ecx
	pushq	0(%r13,%rax,8)
	.cfi_def_cfa_offset 128
	movsd	24(%rsp), %xmm5
	movsd	(%r12,%rax,8), %xmm7
	movsd	(%rbx,%rax,8), %xmm6
	movsd	0(%r13), %xmm4
	movapd	%xmm5, %xmm1
	movl	$8, %eax
	movsd	(%r12), %xmm3
	movsd	(%rbx), %xmm2
	call	printf@PLT
	popq	%rsi
	.cfi_def_cfa_offset 120
	popq	%rdi
	.cfi_def_cfa_offset 112
	jmp	.L20
.L4:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	movl	%ebx, %esi
	subq	24(%rsp), %rax
	pxor	%xmm1, %xmm1
	leaq	.LC4(%rip), %rdi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	divsd	.LC5(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	printf@PLT
	jmp	.L20
.L24:
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	orl	$-1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE22:
	.size	main, .-main
	.globl	z
	.bss
	.align 32
	.type	z, @object
	.size	z, 268435456
z:
	.zero	268435456
	.globl	y
	.align 32
	.type	y, @object
	.size	y, 268435456
y:
	.zero	268435456
	.globl	x
	.align 32
	.type	x, @object
	.size	x, 268435456
x:
	.zero	268435456
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 11.3.0-3) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
