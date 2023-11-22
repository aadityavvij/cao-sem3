.data
prompt: .asciiz "Input natural number: "
result_msg: .asciiz "Sum till "
newline: .asciiz ": "

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
    li $t2, 1

loop:
    add $t1, $t1, $t2

    addi $t2, $t2, 1

    ble $t2, $t0, loop

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

