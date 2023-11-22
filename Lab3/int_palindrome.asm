.data
prompt: .asciiz "Enter an integer: "
palindrome_msg: .asciiz "The entered integer is a palindrome."
not_palindrome_msg: .asciiz "The entered integer is not a palindrome."

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 0
    move $t2, $t0

reverse_loop:
    beqz $t2, check_palindrome

    div $t2, $t2, 10
    mfhi $t3

    mul $t1, $t1, 10
    add $t1, $t1, $t3

    j reverse_loop

check_palindrome:
    beq $t0, $t1, is_palindrome
    j not_palindrome

is_palindrome:
    li $v0, 4
    la $a0, palindrome_msg
    syscall
    j exit

not_palindrome:
    li $v0, 4
    la $a0, not_palindrome_msg
    syscall

exit:
    li $v0, 10
    syscall