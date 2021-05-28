#####################################################
#    EE3450 Computer Architecture - Spring 109      #
#    Project: Find Greatest Common Divisors (GCD)   #
#    Binary GCD (gcdC.asm)                          #
#	 Student Name: Po-Chen Kuo						#
#	 Student ID: 107012045							#
#####################################################

.data

msg1: .asciiz "Please give 2 integers separated by enter:\n"
msg2: .asciiz "The greatest common divisor is "

.text

.globl main
main: 

	li $v0, 4 					# prepare syscall 4 (print string)
	la $a0, msg1 				# argument: msg1
	syscall

	li $v0, 5 					# prepare syscall 5 (get int)
	syscall
    move $s0, $v0

	li $v0, 5 					# prepare syscall 5 (get int)
	syscall
    move $s1, $v0

# ##########################
    move $a0, $s0				# prepare argument a0
	move $a1, $s1				# prepare argument a1
	jal BGCDloop				# call "BGCDloop" function and jump.
	move $s0, $v0				# save return value from v0 to s0
# ##########################


	li $v0, 4 					# prepare syscall 4 (print string)
	la $a0, msg2 				# argument: msg2 
	syscall

	li $v0, 1 					# prepare syscall 1 (print int)
	move $a0, $s0 				# argument: gcd value
	syscall

exit:

	li $v0, 10 					# terminate program run and
	syscall 					# Exit


BGCDloop:
	beq		$a0, $a1, ret_a		# branch to "ret" if input $a0, $a1 is equal.
	addi	$sp, $sp, -4		# make room for stack push
	sw		$ra, 0($sp)			# push return address to the stack.
	
	# prepare needed arguments
	
	
	
	andi $t0, $a0, 1			# check a0 is odd(1) or even(0)
	andi $t1, $a1, 1			# check a1 is odd(1) or even(0)
	beq $t0, $0, evenA			# jump if a even
	beq $t1, $0, oddAevenB  	# jump if b even
	slt $t2, $a0, $a1			# check a < b
	bne $t2, $0, lableoddAlB 	# a < b jump
	sub $a0, $a0, $a1			# else if (a > b) a = a - b
	add $a1, $a1, $a0			# let b = (b + a) - a  below
lableoddAlB:
	sub $a1, $a1, $a0			# b = b - a
	jal	BGCDloop				# recursive call
	
	j Endloop
oddAevenB:
	srl $a1, $a1, 1
	jal	BGCDloop				# recursive call
	j Endloop
evenA:
	beq $t1, $0, evenAnB		# jump if b even
	srl $a0, $a0, 1				# even A odd B 
	jal	BGCDloop				# recursive call
	j Endloop
evenAnB:
	srl $a0, $a0, 1
	srl $a1, $a1, 1
	jal	BGCDloop				# recursive call
	sll $v0, $v0, 1				# Multiply2
Endloop:
	lw		$ra, 0($sp)			# pop return address from the stack.
	addi	$sp, $sp, 4			# restore the stack
	j	ret						# exit procedure

ret_a:
	move	$v0, $a0			# prepare value $a0 for return

ret:
	jr	$ra						# return

	