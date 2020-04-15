	.data
	xequal:		.asciiz "\n\tx = "
	yequal:		.asciiz "\n\ty = "
	calc:		.asciiz "\nCalculated values:"
	enterx:		.asciiz "Enter initial x value: "
	entery:		.asciiz "Enter initial y value: "
	againtext:	.asciiz "\n\nRun again (1: Yes, 0: No)? "
	.text
	
	li	$t1,	5
	li	$t2,	-3
	li	$t3,	25
main:	li	$v0,	4
	la	$a0,	enterx
	syscall
	li	$v0,	5
	syscall
	move	$s1,	$v0
	li	$v0,	4
	la	$a0,	entery
	syscall
	li	$v0,	5
	syscall
	move	$s2,	$v0
	
x1:	bge	$s1,	$t1,	x2
	addi	$s1,	$s1,	2
	j	y1
	
x2:	addi	$s1,	$s1,	3

y1:	ble	$s2,	$t2,	y2
	blt	$s2,	$t3,	y3
	
y2:	sub	$s2,	$s2,	$s1
	j	disp
	
y3:	add	$s2,	$s2,	$s1

disp:	li	$v0,	4
	la	$a0,	calc
	syscall
	li	$v0,	4
	la	$a0,	xequal
	syscall
	li	$v0,	1
	move	$a0,	$s1
	syscall
	li	$v0,	4
	la	$a0,	yequal
	syscall
	li	$v0,	1
	move	$a0,	$s2
	syscall

again:	li	$v0,	4
	la	$a0,	againtext
	syscall
	li	$v0,	5
	syscall
	bgt	$v0,	$0,	main

exit:	li	$v0,	10
	syscall
