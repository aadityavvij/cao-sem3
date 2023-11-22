.data
	myDouble: .double 2.3564563456

.text
	li $v0, 3
	ldc1 $f12, myDouble
	syscall
