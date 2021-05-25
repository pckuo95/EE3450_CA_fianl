.data
msg_str: .asciiz "Enter some number : "

.text

.globl main

main:
	la		$a0, msg_str 			# load the address of the message "Enter some Number : ".
	li		$v0, 4					# prepare for syscall 4, printing string to the user.
	syscall 						# syscall 4.
	li		$v0, 5					# prepare for syscall 5, reading integer from the user.
	syscall							# syscall 5.
	move	$a0, $v0				# Now input integer is in $v0. We cocy it to $a0 for function call.
	jal fac							# call "fac" function and jump to fac tag.
	move	$a0, $v0				# Now the result of fac(n) is in $v0. Copy it to $a0 for syscall 1.
	li 		$v0, 1					# prepare for syscall 1, printing an integer.
	syscall							# syscall 1.
	li		$v0, 10					# prepare for syscall 10, finish.
	syscall
	
fac:
	bne		$a0, $zero, loophead	# If input is 0, return 1. If not, go to the loop.
	li		$v0, 1
	jr		$ra						# return value 1

loophead:
	move	$v0, $a0				# copy input to $v0 (prod). We will keep multiplying it until loop ends.
	li		$t0, 1					# load value 1 to $t0 as loop end condition

loopbody:
	addi	$a0, $a0, -1			# i--
	mul		$v0, $v0, $a0			# n = n * i
	bne		$a0, $t0, loopbody		# if $a0 != 1, iteration keep going
	jr		$ra						# return final result