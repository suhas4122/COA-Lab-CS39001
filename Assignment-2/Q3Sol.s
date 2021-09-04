#    Assignment - 2
#    Problem  - 3 (Finding if the number is prime or not)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data 

# declaration of output strings 
input_message: 
    .asciiz "Enter a positive integer greater than or equals to 10: "

error_message: 
    .asciiz "Invalid input (input should be greater than or equals to 10)\n"

output_message1: 
    .asciiz "Entered number is a PRIME number\n\n"

output_message2: 
    .asciiz "Entered number is a COMPOSITE number\n\n"

.text 

.globl main

# main program
# program variables
#  n	:   $a0
#  i	:	$t0 
 
    main:
        # Printing message before taking integer as input
        la      $a0, input_message
        li      $v0, 4
        syscall

        # Taking the integer as input (n)
        li      $v0, 5
        syscall
        move    $a0, $v0       	       

        # Sanity check of first integer (n should be >= 10)
        blt     $a0, 10, invalid_input

        # Function call to test if the number is prime
        jal     test_prime

        # When the return value ($v0) is 0 (not prime)
        beqz    $v0, not_prime
        
        # When the return value ($v0) is 1 (prime)
        j       is_prime

    test_prime:
        # Initialise the loop variable (i) from 2
        li      $t0, 2

        test_loop:
            # number is prime if i*i > n
            mul     $t1, $t0, $t0
            slt     $t2, $a0, $t1
            bne     $t2, $zero, test_exit_true

            # dividing n by i
            div     $a0, $t0
            mfhi    $t1
            addi    $t0, $t0, 1

            # Continue the loop if remainder ($t1) is non-zero
            bnez    $t1, test_loop

            # Number is not prime otherwise
            j test_exit_false

        test_exit_true:
            # Returning 1 if number is prime 
            li      $v0, 1
            jr      $ra
        
        test_exit_false:
            # Returning 0 if number is not prime 
            li      $v0, 0
            jr      $ra

    is_prime:
        # Printing the message when number is prime
        la      $a0, output_message1
        li      $v0, 4
        syscall

        # Exit the code
        j       exit_code
   
    not_prime:
        # Printing the message when number is not prime 
        la      $a0, output_message2
        li      $v0, 4
        syscall

        # Exit the code
        j       exit_code
    
    invalid_input:
        # Printing the error message
        la      $a0, error_message
        li      $v0, 4
        syscall

        # Exit the code
        j       exit_code
    
    exit_code:
        # System call to exit the code
        li      $v0, 10
        syscall          