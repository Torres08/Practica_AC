	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Faltan argumentos de entrada (n. componentes, alpha)"
	.align 8
.LC5:
	.string	"/ alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC6:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%d\t/ alpha*x[0]+y[0]=z[0](%8.6f*%8.6f+%8.6f=%8.6f) / / alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC7:
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
	jle	.L33
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movq	%rax, %r13
	movl	%eax, %r12d
	call	strtod@PLT
	movsd	%xmm0, 8(%rsp)
	cmpl	$33554432, %r13d
	jg	.L20
	cmpl	$8, %r13d
	jg	.L3
	testl	%r13d, %r13d
	jle	.L4
	pxor	%xmm1, %xmm1
	movsd	.LC2(%rip), %xmm6
	leal	-1(%r13), %eax
	cvtsi2sdl	%r13d, %xmm1
	mulsd	%xmm6, %xmm1
	cmpl	$2, %eax
	jbe	.L21
	movl	%r13d, %esi
	movapd	%xmm1, %xmm3
	leaq	x(%rip), %rbx
	xorl	%ecx, %ecx
	leaq	y(%rip), %rbp
	shrl	$2, %esi
	unpcklpd	%xmm3, %xmm3
	movdqa	.LC0(%rip), %xmm4
	movdqa	.LC3(%rip), %xmm8
	movapd	.LC4(%rip), %xmm5
	movq	%rbx, %rdx
	movq	%rbp, %rax
.L6:
	movdqa	%xmm4, %xmm0
	addl	$1, %ecx
	paddd	%xmm8, %xmm4
	addq	$32, %rdx
	cvtdq2pd	%xmm0, %xmm2
	mulpd	%xmm5, %xmm2
	pshufd	$238, %xmm0, %xmm0
	addq	$32, %rax
	cvtdq2pd	%xmm0, %xmm0
	mulpd	%xmm5, %xmm0
	movapd	%xmm2, %xmm7
	addpd	%xmm3, %xmm7
	movaps	%xmm7, -32(%rdx)
	movapd	%xmm0, %xmm7
	addpd	%xmm3, %xmm7
	movaps	%xmm7, -16(%rdx)
	movapd	%xmm3, %xmm7
	subpd	%xmm2, %xmm7
	movapd	%xmm3, %xmm2
	subpd	%xmm0, %xmm2
	movaps	%xmm7, -32(%rax)
	movaps	%xmm2, -16(%rax)
	cmpl	%ecx, %esi
	jne	.L6
	movl	%r13d, %eax
	andl	$-4, %eax
	testb	$3, %r13b
	je	.L7
.L5:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	movslq	%eax, %rdx
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm2
	movsd	%xmm2, (%rbx,%rdx,8)
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movsd	%xmm2, 0(%rbp,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%r13d, %edx
	jge	.L7
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	addl	$2, %eax
	cvtsi2sdl	%edx, %xmm0
	movslq	%edx, %rdx
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm2
	movsd	%xmm2, (%rbx,%rdx,8)
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movsd	%xmm2, 0(%rbp,%rdx,8)
	cmpl	%r13d, %eax
	jge	.L8
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm2
	cvtsi2sdl	%eax, %xmm0
	cltq
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm2
	subsd	%xmm0, %xmm1
	movsd	%xmm2, (%rbx,%rax,8)
	movsd	%xmm1, 0(%rbp,%rax,8)
.L8:
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	testl	%r13d, %r13d
	movl	$1, %ecx
	cmovg	%r13d, %ecx
	jmp	.L19
.L20:
	movl	$33554432, %r12d
.L3:
	leaq	x(%rip), %rbx
	leaq	y(%rip), %rbp
	leal	-1(%r12), %eax
	leaq	8(%rbx), %rdx
	movq	%rbx, %r13
	movq	%rbp, %r15
	leaq	(%rdx,%rax,8), %r14
	.p2align 4,,10
	.p2align 3
.L9:
	call	drand48@PLT
	addq	$8, %r13
	addq	$8, %r15
	movsd	%xmm0, -8(%r13)
	call	drand48@PLT
	movsd	%xmm0, -8(%r15)
	cmpq	%r14, %r13
	jne	.L9
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	call	clock_gettime@PLT
	testl	%r12d, %r12d
	movl	$1, %ecx
	cmovg	%r12d, %ecx
.L19:
	movsd	8(%rsp), %xmm1
	movl	%ecx, %edx
	xorl	%eax, %eax
	shrl	%edx
	leaq	z(%rip), %r15
	unpcklpd	%xmm1, %xmm1
	salq	$4, %rdx
	.p2align 4,,10
	.p2align 3
.L12:
	movapd	(%rbx,%rax), %xmm0
	mulpd	%xmm1, %xmm0
	addpd	0(%rbp,%rax), %xmm0
	movaps	%xmm0, (%r15,%rax)
	addq	$16, %rax
	cmpq	%rax, %rdx
	jne	.L12
	movl	%ecx, %eax
	andl	$-2, %eax
	andl	$1, %ecx
	je	.L11
.L18:
	cltq
	movsd	8(%rsp), %xmm0
	mulsd	(%rbx,%rax,8), %xmm0
	addsd	0(%rbp,%rax,8), %xmm0
	movsd	%xmm0, (%r15,%rax,8)
.L11:
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
	divsd	.LC8(%rip), %xmm0
	addsd	%xmm1, %xmm0
	cmpl	$10, %r12d
	jg	.L34
	movl	%r12d, %esi
	leaq	.LC7(%rip), %rdi
	movl	$1, %eax
	xorl	%r13d, %r13d
	call	printf@PLT
	leaq	.LC5(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L14:
	movsd	(%r15,%r13,8), %xmm3
	movl	%r13d, %esi
	movl	%r13d, %ecx
	movl	%r13d, %edx
	movsd	0(%rbp,%r13,8), %xmm2
	movsd	(%rbx,%r13,8), %xmm1
	movq	%r14, %rdi
	movl	$4, %eax
	movsd	8(%rsp), %xmm0
	addq	$1, %r13
	call	printf@PLT
	cmpl	%r13d, %r12d
	jg	.L14
.L29:
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
.L34:
	.cfi_restore_state
	leal	-1(%r12), %edx
	pushq	%rcx
	.cfi_def_cfa_offset 120
	movsd	z(%rip), %xmm4
	movl	%r12d, %esi
	movslq	%edx, %rax
	movsd	y(%rip), %xmm3
	movl	%edx, %r8d
	movl	%edx, %ecx
	pushq	(%r15,%rax,8)
	.cfi_def_cfa_offset 128
	movsd	24(%rsp), %xmm5
	leaq	.LC6(%rip), %rdi
	movsd	0(%rbp,%rax,8), %xmm7
	movsd	(%rbx,%rax,8), %xmm6
	movsd	x(%rip), %xmm2
	movapd	%xmm5, %xmm1
	movl	$8, %eax
	call	printf@PLT
	popq	%rsi
	.cfi_def_cfa_offset 120
	popq	%rdi
	.cfi_def_cfa_offset 112
	jmp	.L29
.L7:
	xorl	%edi, %edi
	leaq	16(%rsp), %rsi
	leaq	z(%rip), %r15
	call	clock_gettime@PLT
	testl	%r13d, %r13d
	movl	$1, %ecx
	cmovg	%r13d, %ecx
	xorl	%eax, %eax
	subl	$1, %r13d
	je	.L18
	jmp	.L19
.L4:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movl	%r13d, %esi
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	leaq	.LC7(%rip), %rdi
	cvtsi2sdq	%rax, %xmm0
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	divsd	.LC8(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	addsd	%xmm1, %xmm0
	call	printf@PLT
	jmp	.L29
.L21:
	xorl	%eax, %eax
	leaq	x(%rip), %rbx
	leaq	y(%rip), %rbp
	jmp	.L5
.L33:
	leaq	.LC1(%rip), %rdi
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.set	.LC2,.LC4
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC4:
	.long	-1717986918
	.long	1069128089
	.long	-1717986918
	.long	1069128089
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC8:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 11.3.0-3) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
