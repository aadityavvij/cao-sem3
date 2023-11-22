.data
prompt:     .asciiz "Enter a string: "
palindrome_msg: .asciiz "The entered string is a palindrome."
not_palindrome_msg: .asciiz "The entered string is not a palindrome."

.text
.globl main

main:
    li $v0, 4               # Print prompt
    la $a0, prompt
    syscall

    li $v0, 8               # Read string
    la $a0,  buffer         # Buffer to store the string
    li $a1,  256            # Maximum length of the string
    syscall

    move $t0, $a0           # $t0 points to the beginning of the string
    jal is_palindrome       # Call the function to check palindrome

    bnez $v0, print_palindrome   # If $v0 is non-zero, print palindrome message
    j print_not_palindrome       # Otherwise, print not palindrome message

print_palindrome:
    li $v0, 4
    la $a0, palindrome_msg
    syscall
    j exit

print_not_palindrome:
    li $v0, 4
    la $a0, not_palindrome_msg
    syscall

exit:
    li $v0, 10
    syscall

is_palindrome:
    move $t1, $t0           # $t1 points to the beginning of the string
    jal str_length          # Call the function to get the length of the string
    move $t2, $v0           # $t2 contains the length of the string

    li $t3, 0               # Initialize $t3 to 0 (loop counter)

check_palindrome_loop:
    bge $t3, $t2, is_palindrome_end   # If $t3 >= $t2, the string is a palindrome

    lb $t4, 0($t1)          # Load a character from the beginning of the string
    lb $t5, -1($t1)         # Load a character from the end of the string

    bne $t4, $t5, not_palindrome     # If characters are not equal, it's not a palindrome

    addi $t1, $t1, 1        # Move to the next character from the beginning
    subi $t2, $t2, 1        # Move to the next character from the end
    addi $t3, $t3, 1        # Increment the loop counter
    j check_palindrome_loop

is_palindrome_end:
    li $v0, 1               # Set $v0 to 1 (true) to indicate a palindrome
    jr $ra                  # Return to the calling function

not_palindrome:
    li $v0, 0               # Set $v0 to 0 (false) to indicate not a palindrome
    jr $ra                  # Return to the calling function

str_length:
    li $v0, 0               # System call code for getting string length
    move $t0, $a0           # $t0 points to the beginning of the string

str_length_loop:
    lb $t1, 0($t0)          # Load a character from the string
    beqz $t1, str_length_end     # If the character is null, end the loop
    addi $t0, $t0, 1        # Move to the next character
    j str_length_loop

str_length_end:
    sub $v0, $t0, $a0        # Calculate the length of the string
    jr $ra                  # Return to the calling function

.data
buffer:     .space 256      # Buffer to store the input string

