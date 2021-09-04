#    Assignment - 2
#    Problem  - 2 (Calaculating GCD of 2 positive integers)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data 

# declaration of output strings 
input_message1: 
    .asciiz "Enter the first positive integer: "

input_message2: 
    .asciiz "Enter the second positive integer: "

error_message: 
    .asciiz "Invalid input"

output_message: 
    .asciiz "GCD of the two integers is: "

newline_message: 
    .asciiz "\n\n"

.text 

.globl main

# main program
# program variables
#  n1	:   $t0
#  n2	:	$t1 

    main:
        # Printing message before taking first integer as input
        la      $a0, input_message1
        li      $v0, 4
        syscall

        # Taking first integer as input (n1)
        li      $v0, 5
        syscall
        move    $t0, $v0

        # Sanity check of first integer (n1)
        blt     $t0, 1, invalid_input

        # Printing message before taking second integer as input
        la      $a0, input_message2
        li      $v0, 4
        syscall

        # Taking second integer as input (n2)
        li      $v0, 5
        syscall
        move    $t1, $v0

        # Sanity check of second integer (n2)
        blt     $t1, 1, invalid_input
   
    loop:
        # If n1 and n2 are equal end the loop 
        beq     $t1, $t0, end_loop

        # If n1 is greater than n2 execute N1
        bgt     $t0, $t1, N1

        # Else execute N2
        j       N2
    
    N1:
        # n1 = n1 - n2 
        sub     $t0, $t0, $t1

        # Return back to the loop
        j       loop
    
    N2:
        # n2 = n2 - n1
        sub     $t1, $t1, $t0

        # Return back to the loop
        j       loop

    end_loop:
        # Printing the output message
        la      $a0, output_message
        li      $v0, 4
        syscall

        #Printing the GCD
        move    $a0, $t0
        li      $v0, 1
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
        #Printing the newline ("\n") 
        la      $a0, newline_message
        li      $v0, 4
        syscall

        # System call to exit the code
        li      $v0, 10
        syscall