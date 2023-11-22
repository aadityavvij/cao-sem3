.data
	myFloat: .float 3.14 
	myDouble: .double 2.346476645
	newLine: .asciiz "\n"
	myString: .asciiz "Hello World"
	
.text
	li $v0, 1
	li $a0, 10
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $v0, 2
	lwc1 $f12, myFloat
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $v0, 3
	ldc1 $f12, myDouble
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $v0, 11
	li $a0, 'A'
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	li $v0, 4
	la $a0, myString
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
