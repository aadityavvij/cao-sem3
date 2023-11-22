.data
prompt: .asciiz "Enter a number: "
result: .asciiz "Factors: "
comma: .asciiz ", "
.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall

    move $t0, $v0
    
    li $v0, 4
    la $a0, result
    syscall

    li $t1, 1
    li $t2, 1

print_factors:
    bge $t1, $t0, end_program
    
    bge $t2, 5, end_program

    div $t0, $t1
    mfhi $t2

    beqz $t2, print_factor

    addi $t1, $t1, 1
    j print_factors

print_factor:
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, comma
    syscall

    addi $t1, $t1, 1
    j print_factors

end_program:
    li $v0, 10
    syscall