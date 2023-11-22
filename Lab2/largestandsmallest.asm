.data
	msg1: .asciiz "Enter Number 1: "
	msg2: .asciiz "Enter Number 2: "
	msg3: .asciiz "Enter Number 3: "
	largest_msg: .asciiz "Largest number: "
	smallest_msg: .asciiz "Smallest number: "
	newline: .asciiz "\n"

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
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0
	
.globl main

main:
    move $t3, $t0
    move $t4, $t0

    ble $t1, $t3, check_t2
    move $t3, $t1

check_t2:
    ble $t2, $t3, find_smallest
    move $t3, $t2

find_smallest:
    bge $t1, $t4, done
    move $t4, $t1

    bge $t2, $t4, done
    move $t4, $t2

done:
    li $v0, 4
    la $a0, largest_msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, smallest_msg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall
