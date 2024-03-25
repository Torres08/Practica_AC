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
	.text
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
	jle	.L23
	movq	%rsi, %r12
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol@PLT
	movq	%rax, %rbx
	movl	%eax, %ebp
	movq	16(%r12), %rdi
	movl	$0, %esi
	call	strtod@PLT
	movsd	%xmm0, 8(%rsp)
	cmpl	$33554432, %ebx
	jg	.L14
	cmpl	$8, %ebx
	jg	.L3
	testl	%ebx, %ebx
	jle	.L4
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%ebx, %xmm1
	mulsd	.LC1(%rip), %xmm1
	movl	$0, %eax
	movsd	.LC1(%rip), %xmm3
	leaq	x(%rip), %rcx
	leaq	y(%rip), %rdx
.L5:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm3, %xmm0
	movapd	%xmm1, %xmm2
	addsd	%xmm0, %xmm2
	movsd	%xmm2, (%rcx,%rax,8)
	movapd	%xmm1, %xmm2
	subsd	%xmm0, %xmm2
	movsd	%xmm2, (%rdx,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebp
	jg	.L5
	jmp	.L6
.L23:
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %edi
	call	exit@PLT
.L14:
	movl	$33554432, %ebp
.L3:
	movl	$0, %ebx
	leaq	x(%rip), %r14
	leaq	y(%rip), %r13
.L7:
	call	drand48@PLT
	movsd	%xmm0, (%r14,%rbx,8)
	call	drand48@PLT
	movsd	%xmm0, 0(%r13,%rbx,8)
	addq	$1, %rbx
	cmpl	%ebx, %ebp
	jg	.L7
.L6:
	leaq	32(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, %eax
	leaq	z(%rip), %rsi
	leaq	x(%rip), %rcx
	leaq	y(%rip), %rdx
.L8:
	movsd	8(%rsp), %xmm0
	mulsd	(%rcx,%rax,8), %xmm0
	addsd	(%rdx,%rax,8), %xmm0
	movsd	%xmm0, (%rsi,%rax,8)
	addq	$1, %rax
	cmpl	%eax, %ebp
	jg	.L8
	leaq	16(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC5(%rip), %xmm0
	movq	16(%rsp), %rax
	subq	32(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	cmpl	$10, %ebp
	jle	.L12
	leal	-1(%rbp), %edx
	movslq	%edx, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	leaq	z(%rip), %rcx
	pushq	(%rcx,%rax,8)
	.cfi_def_cfa_offset 128
	leaq	y(%rip), %rcx
	movsd	(%rcx,%rax,8), %xmm7
	leaq	x(%rip), %rcx
	movsd	(%rcx,%rax,8), %xmm6
	movsd	24(%rsp), %xmm5
	movl	%edx, %r8d
	movl	%edx, %ecx
	movsd	z(%rip), %xmm4
	movsd	y(%rip), %xmm3
	movsd	x(%rip), %xmm2
	movapd	%xmm5, %xmm1
	movl	%ebp, %esi
	leaq	.LC3(%rip), %rdi
	movl	$8, %eax
	call	printf@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 112
.L20:
	movl	$0, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.L12:
	.cfi_restore_state
	movl	%ebp, %esi
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %ebx
	leaq	z(%rip), %r15
	leaq	y(%rip), %r14
	leaq	x(%rip), %r13
	leaq	.LC2(%rip), %r12
.L10:
	movl	%ebx, %esi
	movsd	(%r15,%rbx,8), %xmm3
	movsd	(%r14,%rbx,8), %xmm2
	movsd	0(%r13,%rbx,8), %xmm1
	movsd	8(%rsp), %xmm0
	movl	%ebx, %ecx
	movl	%ebx, %edx
	movq	%r12, %rdi
	movl	$4, %eax
	call	printf@PLT
	addq	$1, %rbx
	cmpl	%ebx, %ebp
	jg	.L10
	jmp	.L20
.L4:
	leaq	32(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	leaq	16(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	40(%rsp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC5(%rip), %xmm0
	movq	16(%rsp), %rax
	subq	32(%rsp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm0
	movl	%ebx, %esi
	leaq	.LC4(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L20
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
