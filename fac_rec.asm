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
	beq		$a0, $zero, ret_one		# branch to "ret_one" if input is 0.
	addi	$sp, $sp, -8			# make room for stack push. we must do this before recursive call.
	sw		$a0, 0($sp)				# push input n to the stack.
	sw		$ra, 4($sp)				# push return address to the stack.
	addi	$a0, $a0, -1
	jal		fac						# recursive call
	lw		$t0, 0($sp)				# pop input n back from the stack.
	lw		$ra, 4($sp)				# pop return address from the stack.
	addi	$sp, $sp, 8				# restore the stack
	
	mul		$v0, $v0, $t0			# do n! = (n - 1)! * n, and prepare value n! for return
	j		ret						# exit procedure
ret_one:
	li		$v0, 1					# prepare value 1 for return
ret:
	jr		$ra						# return