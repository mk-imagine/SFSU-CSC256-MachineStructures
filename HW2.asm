	.data
	newline:	.asciiz "\n"
	xequal:		.asciiz "x = "
	yequal:		.asciiz "y = "
	enterx:		.asciiz "Enter initial x value: "
	entery:		.asciiz "Enter initial y value: "
	.text
	
main:	li	$t1,	5
	li	$t2,	-3
	li	$t3,	25
	li	$s1,	25
	li	$s2,	50
	
x1:	bge	$s1,	$t1,	x2
	addi	$s1,	$s1,	2
	j	y1
	
x2:	addi	$s1,	$s1,	3

y1:	ble	$s2,	$t2,	y2
	blt	$s2,	$t3,	y3
	
y2:	sub	$s2,	$s2,	$s1
	j	exit
	
y3:	add	$s2,	$s2,	$s1

exit:	li	$v0,	4
	la	$a0,	xequal
	syscall
	li	$v0,	1
	move	$a0,	$s1
	syscall
	li	$v0,	4
	la	$a0,	newline
	syscall
	li	$v0,	4
	la	$a0,	yequal
	syscall
	li	$v0,	1
	move	$a0,	$s2
	syscall
	li	$v0,	10
	syscall
