.data

# output strings
input_msg:      .asciiz "Enter  a  positive integer greater than equals to 10: "
output_msg_t:   .asciiz "Entered number is a PRIME number"
output_msg_f:   .asciiz "Entered number is a COMPOSITE number"
error_msg:      .asciiz "Invalid Input"
newline:        .asciiz "\n"

READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10

.text
.globl main
    main:
        # Reading no. n
        la $a0, input_msg
        lw $v0, PRINT_STRING_CODE
        syscall
        lw $v0, READ_INT_CODE
        syscall
        move $t0, $v0

        # invalid inputs
        blt $t0, 10, invalid_

        # loop control variable i
        li $t1, 1

    for_loop:
        # i = i+1
        add $t1, $t1, 1
        # if i >=n, exit
        bge $t1, $t0, exit_t

        # gcd b/w i and n
        li $t3, 0
        add $t3, $t3, $t0
        li $t4, 0
        add $t4, $t4, $t1
        # li $t3, ($t0)
        # li $t4, ($t1)

        loop:
            beq $t3, $t4, end_loop
            # if(n1 > n2)
            bgt $t3, $t4, N1
            # else
            j N2
            # n1 = n1-n2
        N1: sub $t3, $t3, $t4
            # loop continues
            j loop
            # n3 = n2-n1
        N2: sub $t4, $t4, $t3
            # loop continues
            j loop
        end_loop:
            # gcd != 1, not prime
            bne $t3, 1, exit_f
        # check for another number
        j for_loop

    exit_t :
        # if is prime
        la $a0, output_msg_t
        lw $v0, PRINT_STRING_CODE
        syscall
        j exit_
    
    exit_f :
        # if not prime
        la $a0, output_msg_f
        lw $v0, PRINT_STRING_CODE
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