#    Assignment - 3
#    Problem  - 3 (Transpose of a matrix)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data 

# Declaration of output strings 
enter_message:
    .asciiz "*** STORING GP IN A MATRIX AND PRINTING IT ALONG WITH ITS TRANSPOSE *** \n\n"

input_message: 
    .asciiz "Enter four positive integers m, n, a and r (press enter after entering each):  \n"

output_message1:
    .asciiz "Matrix after storing the GP (matrix A): \n"

output_message2:
    .asciiz "Matrix after taking the transpose (matrix B): \n"

white_space:
    .asciiz " "

new_line:
    .asciiz "\n"

end_message:
    .asciiz "\n*********** THANK YOU *********** \n\n"

.text
.globl main

    main:
        # Printing welcome message when the program starts
		la      $a0, enter_message
		li      $v0, 4
		syscall

		# Printing message to make the 2-D array
		la      $a0, input_message
		li      $v0, 4
		syscall

        # Taking first number (m) as input in $s0 
        li      $v0, 5
        syscall
        move    $s0, $v0

        # Taking first number (n) as input in $s0 
        li      $v0, 5
        syscall
        move    $s1, $v0

        # Taking first number (a) as input in $s0 
        li      $v0, 5
        syscall
        move    $s2, $v0

        # Taking first number (r) as input in $s0 
        li      $v0, 5
        syscall
        move    $s3, $v0    

        # Initialise the stack before inserting any array into it 
        jal     initStack

        mult    $s0, $s1
        mflo    $a0
        jal     mallocInStack
        move    $s4, $v0
        
        mult    $s0, $s1
        mflo    $t0
        li      $t1, 0
        move    $t2, $s2
        move    $t3, $s4
        j       loop

        loop:
            sw      $t2, 0($t3)
            mult    $t2, $s3
            mflo    $t2
            addi    $t3, -4
            addi    $t1, 1
            blt     $t1, $t0, loop
        
        la      $a0, new_line
        li      $v0, 4
        syscall

        la      $a0, output_message1
		li      $v0, 4
		syscall
        
        move    $a0, $s0
        move    $a1, $s1
        move    $a2, $s4
        jal     printMatrix

        mult    $s0, $s1
        mflo    $a0
        jal     mallocInStack
        move    $s5, $v0

        move    $a0, $s0
        move    $a1, $s1
        move    $a2, $s4
        move    $a3, $s5
        jal     transposeMatrix

        la      $a0, new_line
		li      $v0, 4
		syscall

        la      $a0, output_message2
		li      $v0, 4
		syscall

        move    $a0, $s1
        move    $a1, $s0
        move    $a2, $s5
        jal     printMatrix
        
        move    $sp, $fp         # Restore stack pointer to its initial memory location 

        j		exit_code      

    # Initialise the stack ($sp and $fp pointers)
    initStack:
        addi    $sp, $sp, -4        # Give 4 bytes to the stack to store the frame pointer
        sw      $fp, 0($sp)         # Store the old frame pointer
        move    $fp, $sp            # Set frame pointer as stack pointer 
        jr      $ra                 # Return 

    # Function to allocate space of size m*n in stack and return base pointer 
    mallocInStack:
        move    $t0, $a0            
        move    $v0, $sp            # Store the value of base pointer to return 
        sll     $t0, $t0, 2         # Calculating 4*m*n
        add     $sp, $sp, $t0       # Allocating  4*m*n bytes of memory in stack 
        jr      $ra                 # Return 

    # Function to push an element to a stack 
    pushToStack:
        addi    $sp, $sp, -4        # Give 4 bytes to the stack to store the value
        sw      $a0, 4($sp)         # Store the value 
        jr      $ra                 # Return 

    printMatrix:
        move    $t0, $a0
        move    $t1, $a1
        move    $t2, $a2
        li      $t3, 0
        li      $t4, 0
        mult    $t0, $t1
        mflo    $t5
    
        print_loop:
            lw      $a0, 0($t2)
            li      $v0, 1
            syscall

            addi    $t2, -4
            addi    $t3, 1
            addi    $t4, 1

            la      $a0, white_space
            li      $v0, 4
            syscall

            beq     $t3, $t5, end_print_loop
            beq     $t4, $t1, print_newline
            j       print_loop

            end_print_loop:
                la      $a0, new_line
                li      $v0, 4
                syscall
                jr      $ra 

            print_newline:
                la      $a0, new_line
                li      $v0, 4
                syscall
                li      $t4, 0
                j       print_loop 
    
    transposeMatrix:
        move    $t0, $a0
        move    $t1, $a1
        move    $t2, $a2
        move    $t3, $a3

        li      $t4, 0
        li      $t5, 0
        move    $t6, $t3

        outer_loop:
            beq     $t4, $t0, exit_outer_loop

            inner_loop:
                beq     $t5, $t1, exit_inner_loop
                lw      $t7, 0($t2)
                sw      $t7, 0($t6) 
                addi    $t5, $t5, 1
                addi    $t2, $t2, -4
                sll     $t7, $t0, 2
                sub     $t6, $t6, $t7
                j		inner_loop
                
            exit_inner_loop:
                li      $t5, 0
                addi    $t4, $t4, 1
                addi    $t3, $t3, -4
                move    $t6, $t3
                j       outer_loop
                
        exit_outer_loop:
            jr      $ra


    exit_code:
        # Printing thank you message 
        la      $a0, end_message
        li      $v0, 4
        syscall

        # System call to exit the code
        li      $v0, 10
        syscall 
