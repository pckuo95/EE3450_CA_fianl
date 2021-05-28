#####################################################
#    EE3450 Computer Architecture - Spring 109      #
#    Project: Find Greatest Common Divisors (GCD)   #
#    Recursive method (gcdA.asm)                    #
#	 Student Name: Po-Chen Kuo						#
#	 Student ID: 107012045							#
#####################################################

.data

msg1: .asciiz "Please give 2 integers separated by enter:\n"
msg2: .asciiz "The greatest common divisor is "

.text

.globl main
main: 

	li $v0, 4 				# prepare syscall 4 (print string)
	la $a0, msg1 			# argument: msg1
	syscall

	li $v0, 5 				# prepare syscall 5 (get int)
	syscall
    move $s0, $v0

	li $v0, 5 				# prepare syscall 5 (get int)
	syscall
    move $s1, $v0

# #############
	move $a0, $s0			# prepare argument a0
	move $a1, $s1			# prepare argument a1
	jal GCDloop				# call "fac" function and jump to fac tag.
	move $s0, $v0			# save return value from v0 to s0
# ##############
	
	li $v0, 4 				# prepare syscall 4 (print string)
	la $a0, msg2 			# argument: msg2 
	syscall

	li $v0, 1 				# prepare syscall 1 (print int)
	move $a0, $s0 			# argument: gcd value (s0)
	syscall

exit:
	li $v0, 10 				# terminate program run and
	syscall 				# Exit

GCDloop:
	beq		$a0, $a1, ret_a	# branch to "ret" if input $a0, $a1 is equal.
	addi	$sp, $sp, -4	# make room for stack push
	sw		$ra, 0($sp)		# push return address to the stack.
	
	# prepare needed arguments
	slt $t0, $a0, $a1		# else(a < b) 1:0
	bne $t0, $0, lableAlB 	# 'else (a < b)', branch while a less than b
	sub $a0, $a0, $a1		# else if (a > b) a = a - b
	add $a1, $a1, $a0		# let b = (b + a) - a  below

lableAlB:
	sub $a1, $a1, $a0		# b = b - a
	jal		GCDloop			# recursive call
	lw		$ra, 0($sp)		# pop return address from the stack.
	addi	$sp, $sp, 4		# restore the stack
	j	ret					# exit procedure


ret_a:
	move	$v0, $a0		# prepare value $a0 for return

ret:
	jr	$ra					# return

	