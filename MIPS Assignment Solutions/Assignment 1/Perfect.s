.data

prompt: 		.asciiz "Enter a positive integer: "
output_prefix:	.asciiz "Entered number is "  
not_string: 	.asciiz "not "    
output_suffix:	.asciiz "a perfect number."
error_message:	.asciiz "Input integer should be greater than 0."
endl: 			.asciiz "\n"

READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10


# main program
#
# program variables:
#   n: $s0
#   sum: $s1
#   i: $s2


.text
.globl main
	main:
	    # Printing the prompt for taking input the integer
	    lw $v0, PRINT_STRING_CODE
	    la $a0, prompt
	    syscall

	    # Inputing the integer and storing it in $s0
	    lw $v0, READ_INT_CODE
	    syscall
	    move $s0, $v0

	    # Sanity checking for the first number
	    ble $s0, $zero, print_error             # if $s0 (n) is less than equal to 0. sanity check fails and go to label print_error

	    li $s1, 0                   # $s1(sum) = 0. sum is initialised to 0.
	    li $s2, 1                   # $s2(i) = 0. i is initialised to 1.

	for:
	    mul $t0, $s2, $s2           # Store $t0 = i*i
	    bgt $t0, $s0, after_for     # if i*i>n jump to after_for
	    rem $t1, $s0, $s2           # Store $t1 = n%i
	    beq $t1, $zero, inside_if   # if $t1 is equal to 0 i.e. remainder is zero go to label inside_if
	    j next_iteration            # jump to label next_iteration

	inside_if:
	    add $s1, $s1, $s2           # $s1 (sum) = $s1 (sum) + $s2 (i) 
	    div $t2, $s0, $s2           # $t2 = $s0 (n) / $s2 (i). $t2 is the other divisor
	    bne $s2, $t2, add_other     # if $s2(i) is not equal to $t2 jump to add_other. Divisors are not the same.
	    j next_iteration            # jump to label next_iteration

	add_other:
	    add $s1, $s1, $t2           # $s1 (sum) = $s1 (sum) + $t2 (other divisor)   
	    j next_iteration            # jump to label next_iteration

	next_iteration:
	    add $s2, $s2, 1             # $s2(i) = $s2(i) + 1. i is updated to i+1 
	    j for                       # jump to the start of for loop

	after_for:
	    sub $s1, $s1, $s0               # $s1 (sum) = $s1 (sum) - $s0 (n). n is substracted because it was added extra while adding 1(other divisor).

	    # Printing the prefix of the output format i.e. "Entered number is "
	    lw $v0, PRINT_STRING_CODE
	    la $a0, output_prefix
	    syscall

	    bne $s1, $s0, print_not             # if $s1(sum) is not equal to $s0(n) go to label print_not. (Condtion of perfect number fails)

	    # Printing the suffix of the ouput format i.e. "a perfect number."
	    lw $v0, PRINT_STRING_CODE
	    la $a0, output_suffix
	    syscall

	    # Printing the newline characters
	    lw $v0, PRINT_STRING_CODE
	    la $a0, endl
	    syscall

	    # returning from the main, and exiting.
	    lw $v0, EXIT_CODE
	    syscall

	print_not:
	    # Printing the not string of the ouput format
	    lw $v0, PRINT_STRING_CODE
	    la $a0, not_string
	    syscall

	    # Printing the suffix of the ouput format i.e. "a perfect number."
	    lw $v0, PRINT_STRING_CODE
	    la $a0, output_suffix
	    syscall

	    # Printing the newline characters
	    lw $v0, PRINT_STRING_CODE
	    la $a0, endl
	    syscall

	    # returning from the main, and exiting.
	    lw $v0, EXIT_CODE
	    syscall

	# This label will print the error if the sanity check is failed after the input.
	print_error:
	    # Printing the error message
	    lw $v0, PRINT_STRING_CODE
	    la $a0, error_message
	    syscall   

	    # Printing the newline characters
	    lw $v0, PRINT_STRING_CODE
	    la $a0, endl
	    syscall

	    # returning from the main, and exiting.
	    lw $v0, EXIT_CODE
	    syscall
	    
