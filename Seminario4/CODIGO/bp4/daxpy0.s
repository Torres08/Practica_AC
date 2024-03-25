	.file	"daxpy.c"
	.text
	.globl	x
	.bss
	.align 32
	.type	x, @object
	.size	x, 268435456
x:
	.zero	268435456
	.globl	y
	.align 32
	.type	y, @object
	.size	y, 268435456
y:
	.zero	268435456
	.globl	z
	.align 32
	.type	z, @object
	.size	z, 268435456
z:
	.zero	268435456
	.section	.rodata
	.align 8
.LC0:
	.string	"Faltan argumentos de entrada (n. componentes, alpha)"
	.align 8
.LC3:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%d\n"
	.align 8
.LC4:
	.string	"/ alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
	.align 8
.LC5:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%d\t/ alpha*x[0]+y[0]=z[0](%8.6f*%8.6f+%8.6f=%8.6f) / / alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	cmpl	$2, -68(%rbp)
	jg	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L2:
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -8(%rbp)
	movq	-80(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof@PLT
	movq	%xmm0, %rax
	movq	%rax, -16(%rbp)
	cmpl	$33554432, -8(%rbp)
	jle	.L3
	movl	$33554432, -8(%rbp)
.L3:
	cmpl	$8, -8(%rbp)
	jg	.L4
	movl	$0, -4(%rbp)
	jmp	.L5
.L6:
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-8(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	pxor	%xmm2, %xmm2
	cvtsi2sdl	-4(%rbp), %xmm2
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	x(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-8(%rbp), %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	pxor	%xmm2, %xmm2
	cvtsi2sdl	-4(%rbp), %xmm2
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L6
	jmp	.L7
.L4:
	movl	$0, -4(%rbp)
	jmp	.L8
.L9:
	call	drand48@PLT
	movq	%xmm0, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	x(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	call	drand48@PLT
	movq	%xmm0, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	leaq	y(%rip), %rdx
	movq	%rax, (%rcx,%rdx)
	addl	$1, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L9
.L7:
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -4(%rbp)
	jmp	.L10
.L11:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	x(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movapd	%xmm0, %xmm1
	mulsd	-16(%rbp), %xmm1
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	addsd	%xmm1, %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	z(%rip), %rax
	movsd	%xmm0, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L10:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L11
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-64(%rbp), %rax
	movq	-48(%rbp), %rdx
	subq	%rdx, %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-56(%rbp), %rax
	movq	-40(%rbp), %rdx
	subq	%rdx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	cmpl	$10, -8(%rbp)
	jg	.L12
	movl	-8(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -4(%rbp)
	jmp	.L13
.L14:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	z(%rip), %rax
	movsd	(%rdx,%rax), %xmm2
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	(%rdx,%rax), %xmm1
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	x(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-4(%rbp), %eax
	movapd	%xmm2, %xmm3
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rsi, %xmm0
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$4, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L13:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L14
	jmp	.L15
.L12:
	movl	-8(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	z(%rip), %rax
	movsd	(%rdx,%rax), %xmm0
	movl	-8(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	y(%rip), %rax
	movsd	(%rdx,%rax), %xmm7
	movl	-8(%rbp), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	x(%rip), %rax
	movsd	(%rdx,%rax), %xmm6
	movl	-8(%rbp), %eax
	leal	-1(%rax), %edi
	movl	-8(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-8(%rbp), %eax
	leal	-1(%rax), %edx
	movsd	z(%rip), %xmm4
	movsd	y(%rip), %xmm3
	movsd	x(%rip), %xmm2
	movsd	-16(%rbp), %xmm5
	movsd	-16(%rbp), %xmm1
	movl	-8(%rbp), %esi
	movq	-24(%rbp), %rax
	subq	$8, %rsp
	leaq	-8(%rsp), %rsp
	movsd	%xmm0, (%rsp)
	movl	%edi, %r8d
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$8, %eax
	call	printf@PLT
	addq	$16, %rsp
.L15:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	-1717986918
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 11.3.0-3) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
