.data
    	endl:   .asciiz  "\n"   # used for cout << endl;
    	sumlbl: .asciiz  "Sum: " # label for sum
    	revlbl: .asciiz  "Reversed Number: " # label for rev
    	pallbl: .asciiz  "Is Palindrome: " # label for isPalindrome
    	sumarr: .word 1
               	.word 3
              	.word 44
               	.word 66
               	.word 88
               	.word 90
               	.word 9
               	.word 232
               	.word 4325
               	.word 2321
    	arr:    .word 1
               	.word 2
               	.word 3
               	.word 4
               	.word 5
               	.word 4
               	.word 3
		.word 2
               	.word 1

.text

	# sum               --> $s0
	# address of sumarr --> $s1
	# rev               --> $s2
	# num               --> $s3
	# isPalindrome      --> $s4
	# address of arr    --> $s5
	# i                 --> $t0
	# beg               --> $s6
	# end               --> $s7
	# d                 --> $t1
	# 10                --> $t2
	# 100               --> $t3
	# i counter	    --> $t4
main:
	
	li	$s0,	0			# sum = 0
	la	$s1,	sumarr			# address of sumarr
	li	$s2,	0			# int rev = 0
	li	$s3,	45689			# int num = 45689
	li	$s4,	1			# int isPalindrome = 1
	la	$s5,	arr			# address of arr
	li	$s6,	0			# int beg = 0
	li	$s7,	32			# int end = 32
	
	li	$t0,	0			# i = 0
	li	$t1,	-1			# int d = -1
	li	$t2,	10			# 10
	li	$t3,	100			# 100

sumarrloop:
	add	$t4,	$s1,	$t0		# address of sumarr + index incrementation (4)
	lw	$t5,	($t4)			# load contents of memory address $t4 into $t5
	add	$s0,	$s0,	$t5		# sum = sum + summarr[i]
	addi	$t0,	$t0,	4		# increment i by 1 word (32 bits or 4 bytes)
	blt	$t0,	40,	sumarrloop	# if(i < 40) jump sumarrloop (10x 4 byte words)
	
numloop:
	ble	$s3,	0,	numout		# if num <= 0, jump numout
	rem	$t1,	$s3,	10		# d = num % 10
	mul	$s2,	$s2,	10		# rev = rev * 10
	add	$s2,	$s2,	$t1		# rev = rev + d
	div	$s3,	$s3,	10		# num = num / 10
	j	numloop

numout:
	add	$s6,	$s6,	$s5		# address of arr[beg] stored in $s6
	add	$s7,	$s7,	$s5		# address of arr[end] stored in $s7
	
begendloop:
	bge	$s6,	$s7,	exit		# while(beg < end) -> if(beg >= end) jump exit
	lw	$t4,	($s6)			# load contents of arr[beg] into $t4
	lw	$t5,	($s7)			# load contents of arr[end] into $t5
	beq	$t4,	$t5	increment 	# if arr[beg] == arr[end], jump to increment
	li	$s4,	-1			# isPalindrome = -1
	j	exit
	
increment:
	addi	$s6,	$s6,	4		# beg = beg + 4
	addi	$s7,	$s7,	-4		# end = end - 4
	j	begendloop
	
exit:
	la   	$a0, 	sumlbl    	# puts sumlbl into arg0 (a0 register) for cout
	addi 	$v0, 	$0, 	4     	# puts 4 in v0 which denotes we are printing a string
  	syscall             		# make a syscall to system

  	move 	$a0, 	$s0       	# puts sum into arg0 (a0 register) for cout
  	addi 	$v0, 	$0, 	1     	# puts 1 in v0 to denote we are printing an int
  	syscall             		# make a syscall to system

  	la   	$a0, 	endl      	# puts the address of the string endl into a0
  	addi 	$v0, 	$0, 	4     	# puts 4 into v0 saying we are printing a string
  	syscall

  	la   	$a0, 	revlbl    	# puts revlbl into arg0 (a0 register) for cout
  	addi 	$v0, 	$0, 	4     	# puts 4 in v0 which denotes we are printing an string
  	syscall             		# make a syscall to system

  	move 	$a0, 	$s2       	# puts rev into arg0 (a0 register) for cout
  	addi 	$v0, 	$0, 	1     	# puts 1 in v0 to denote we are printing an int
  	syscall             		# make a syscall to system

  	la   	$a0, 	endl      	# puts the address of the string endl into a0
  	addi 	$v0, 	$0, 	4     	# puts 4 into v0 saying we are printing a string
  	syscall

  	la   	$a0, 	pallbl    	# puts pallbl into arg0 (a0 register) for cout
  	addi 	$v0, 	$0, 	4     	# puts 4 in v0 which denotes we are printing a string
	syscall            		# make a syscall to system

	move 	$a0, 	$s4       	# puts isPalindrome into arg0 (a0 register) for cout
	addi 	$v0, 	$0, 	1     	# puts 1 in v0 to denote we are printing an int
	syscall             		# make a syscall to system

	la   	$a0, 	endl      	# puts the address of the string endl into a0
	addi 	$v0, 	$0, 	4     	# puts 4 into v0 saying we are printing a string
	syscall


	addi 	$v0,	$0, 	10
	syscall
