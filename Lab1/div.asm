.data
	msg1: .asciiz "Enter Number 1: "
	msg2: .asciiz "Enter Number 2: "
	newLine: .asciiz "\n" 

.text
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	div $t2 $t0, $t1
	mul $t3 $t2, $t1
	sub $t4 $t0, $t3
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	
	
