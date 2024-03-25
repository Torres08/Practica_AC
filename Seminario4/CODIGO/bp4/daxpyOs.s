	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Faltan argumentos de entrada (n. componentes, alpha)"
.LC3:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%d\n"
.LC4:
	.string	"/ alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
.LC5:
	.string	"Tiempo:%11.9f\t / Tama\303\261o Vectores:%d\t/ alpha*x[0]+y[0]=z[0](%8.6f*%8.6f+%8.6f=%8.6f) / / alpha*x[%d]+y[%d]=z[%d](%8.6f*%8.6f+%8.6f=%8.6f) /\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	cmpl	$2, %edi
	jg	.L2
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	orl	$-1, %edi
	call	exit@PLT
.L2:
	movq	8(%rsi), %rdi
	movq	%rsi, %rbx
	call	atoi@PLT
	movq	16(%rbx), %rdi
	movl	%eax, %ebp
	call	atof@PLT
	movq	%xmm0, %r14
	cmpl	$33554432, %ebp
	jg	.L14
	cmpl	$8, %ebp
	jg	.L3
	xorl	%eax, %eax
	movsd	.LC1(%rip), %xmm2
	leaq	x(%rip), %rdx
	leaq	y(%rip), %rcx
.L4:
	cmpl	%eax, %ebp
	jle	.L6
	cvtsi2sdl	%ebp, %xmm0
	cvtsi2sdl	%eax, %xmm1
	mulsd	%xmm2, %xmm0
	mulsd	%xmm2, %xmm1
	movaps	%xmm0, %xmm3
	addsd	%xmm1, %xmm3
	subsd	%xmm1, %xmm0
	movsd	%xmm3, (%rdx,%rax,8)
	movsd	%xmm0, (%rcx,%rax,8)
	incq	%rax
	jmp	.L4
.L14:
	movl	$33554432, %ebp
.L3:
	xorl	%ebx, %ebx
	leaq	x(%rip), %r12
.L7:
	call	drand48@PLT
	movsd	%xmm0, (%r12,%rbx,8)
	call	drand48@PLT
	leaq	y(%rip), %rax
	movsd	%xmm0, (%rax,%rbx,8)
	incq	%rbx
	cmpl	%ebx, %ebp
	jg	.L7
.L6:
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	xorl	%eax, %eax
	leaq	z(%rip), %rdx
	leaq	x(%rip), %rcx
	leaq	y(%rip), %rsi
.L8:
	cmpl	%eax, %ebp
	jle	.L19
	movq	%r14, %xmm0
	mulsd	(%rcx,%rax,8), %xmm0
	addsd	(%rsi,%rax,8), %xmm0
	movsd	%xmm0, (%rdx,%rax,8)
	incq	%rax
	jmp	.L8
.L19:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	divsd	.LC2(%rip), %xmm0
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	cmpl	$10, %ebp
	jg	.L10
	movl	%ebp, %esi
	leaq	.LC3(%rip), %rdi
	movb	$1, %al
	xorl	%ebx, %ebx
	call	printf@PLT
	leaq	z(%rip), %r12
.L11:
	movl	%ebx, %esi
	cmpl	%ebx, %ebp
	jle	.L13
	leaq	y(%rip), %rax
	movq	%r14, %xmm0
	movl	%esi, %ecx
	movl	%esi, %edx
	movsd	(%rax,%rbx,8), %xmm2
	leaq	x(%rip), %rax
	movsd	(%r12,%rbx,8), %xmm3
	leaq	.LC4(%rip), %rdi
	movsd	(%rax,%rbx,8), %xmm1
	movb	$4, %al
	incq	%rbx
	call	printf@PLT
	jmp	.L11
.L10:
	leal	-1(%rbp), %edx
	pushq	%rcx
	.cfi_def_cfa_offset 88
	movl	%ebp, %esi
	movq	%r14, %xmm5
	movslq	%edx, %rax
	leaq	z(%rip), %rcx
	movsd	z(%rip), %xmm4
	movsd	y(%rip), %xmm3
	pushq	(%rcx,%rax,8)
	.cfi_def_cfa_offset 96
	leaq	y(%rip), %rcx
	leaq	.LC5(%rip), %rdi
	movl	%edx, %r8d
	movsd	(%rcx,%rax,8), %xmm7
	leaq	x(%rip), %rcx
	movq	%r14, %xmm1
	movsd	(%rcx,%rax,8), %xmm6
	movsd	x(%rip), %xmm2
	movl	%edx, %ecx
	movb	$8, %al
	call	printf@PLT
	popq	%rsi
	.cfi_def_cfa_offset 88
	popq	%rdi
	.cfi_def_cfa_offset 80
.L13:
	addq	$40, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE6:
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
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Debian 11.3.0-3) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
