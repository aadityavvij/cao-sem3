.data
msg1: .asciiz "Enter the first number : "
msg2: .asciiz "Enter the second number : "
r_same: .asciiz "The two numbers are same "
r_diff: .asciiz "The two numbers are diff " 

.text
main:
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,msg2
syscall

li $v0,5
syscall
move $t1,$v0

beq $t0,$t1,same
j different

same:
li $v0,4
la $a0,r_same
syscall
j exit

different:
li $v0,4
la $a0,r_diff
syscall

exit:
li $v0,10
syscall
