.data

# output strings
input_msg1:     .asciiz "Enter  the  first  positive integer: "
input_msg2:     .asciiz "Enter  the  second  positive integer: "
output_msg:     .asciiz "GCD of the two integers is: "
error_msg:      .asciiz "Invalid Input"
newline:        .asciiz "\n"

READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10

.text
.globl main
    main:
        # Reading first no. n1
        la $a0, input_msg1
        lw $v0, PRINT_STRING_CODE
        syscall
        lw $v0, READ_INT_CODE
        syscall
        move $t0, $v0

        # Reading second no. n2
        la $a0, input_msg2
        lw $v0, PRINT_STRING_CODE
        syscall
        lw $v0, READ_INT_CODE
        syscall
        move $t1, $v0

        # invalid inputs
        blt $t0, 1, invalid_
        blt $t1, 1, invalid_

        # while(n1 != n2)
    loop:
        beq $t1, $t0, end_loop
        # if(n1 > n2)
        bgt $t0, $t1, N1
        # else
        j N2
        # n1 = n1-n2
    N1: sub $t0, $t0, $t1
        # loop continues
        j loop
        # n3 = n2-n1
    N2: sub $t1, $t1, $t0
        # loop continues
        j loop
        # loop ends
    end_loop:
        # Print results
        la $a0, output_msg
        lw $v0, PRINT_STRING_CODE
        syscall
        move $a0, $t0
        lw $v0, PRINT_INT_CODE
        syscall
        j exit_
    invalid_:
        # Print error statement
        la $a0, error_msg
        lw $v0, PRINT_STRING_CODE
        syscall
        j exit_
    exit_:
        # Exit
        la $a0, newline
        lw $v0, PRINT_STRING_CODE
        syscall
        lw $v0, EXIT_CODE
        syscall