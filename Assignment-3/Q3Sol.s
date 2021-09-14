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

        # Set appropriate parameters and allocate space in stack foe martix A
        mul     $a0, $s0, $s1
        jal     mallocInStack
        move    $s4, $v0
        
        # Storing the GP in matrix A
        mul     $t0, $s0, $s1       # Set size of matrix as m*n
        li      $t1, 0              # Set counter as 0
        move    $t2, $s2            # Store a in temporary register
        move    $t3, $s4            # Store r in temporary register
        j       loop

        loop:
            sw      $t2, 0($t3)     # Save current GP term in current element of the matrix
            mul     $t2, $t2, $s3   # Multiply GP term by r
            addi    $t3, -4         # Move current matrix pointer to next position
            addi    $t1, 1          # Increase counter by 1
            blt     $t1, $t0, loop  # if counter < m*n continue loop 
        
        # Print new line
        la      $a0, new_line
        li      $v0, 4
        syscall

        # Print the output message before printing matrix A
        la      $a0, output_message1
		li      $v0, 4
		syscall
        
        # Set appropriate parameter and print matrix A
        move    $a0, $s0
        move    $a1, $s1
        move    $a2, $s4
        jal     printMatrix

        # Set appropriate parameters and allocate space in stack for martix B
        mul     $a0, $s0, $s1    
        jal     mallocInStack
        move    $s5, $v0

        # Set appropriate parameters and call transposeMatrix to store transpose of A into B
        move    $a0, $s0
        move    $a1, $s1
        move    $a2, $s4
        move    $a3, $s5
        jal     transposeMatrix

        # Print new line 
        la      $a0, new_line
		li      $v0, 4
		syscall

        # Print the output message before printing matrix B
        la      $a0, output_message2
		li      $v0, 4
		syscall

        # Set appropriate parameter and print matrix B
        move    $a0, $s1
        move    $a1, $s0
        move    $a2, $s5
        jal     printMatrix
        
        # Restore stack pointer to its initial memory location 
        move    $sp, $fp            

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
        # Load function parameters into temporary registers (m, n and matrix base address)
        move    $t0, $a0            
        move    $t1, $a1
        move    $t2, $a2

        # Initialise iterators to 0 (i1 = 0 and i2 = 0)
        li      $t3, 0
        li      $t4, 0

        # Store total size as m*n 
        mul     $t5, $t0, $t1
    
        print_loop:
            # Loading current element and printing it
            lw      $a0, 0($t2)   
            li      $v0, 1
            syscall
            
            # Move address pointing to current element and the iterators 
            addi    $t2, -4
            addi    $t3, 1
            addi    $t4, 1

            # Print white space after each number
            la      $a0, white_space
            li      $v0, 4
            syscall
            
            # If all the elements have been printed (i1 == m*n) then exit loop
            beq     $t3, $t5, end_print_loop

            #If current row has ended then print newline (i2 == n)
            beq     $t4, $t1, print_newline
            
            # Continue the loop otherwise 
            j       print_loop

            end_print_loop: 
                # Print new line and return back
                la      $a0, new_line
                li      $v0, 4
                syscall
                jr      $ra 

            print_newline:
                # Print new line
                la      $a0, new_line
                li      $v0, 4
                syscall

                # Set i2 = 0 after end of each line 
                li      $t4, 0              
                j       print_loop 
    

    transposeMatrix:
        # Load function parameters into temporary registers (m, n and matrix base addresses)
        move    $t0, $a0
        move    $t1, $a1
        move    $t2, $a2
        move    $t3, $a3

        # Initiasise loop variables (i and j) 
        li      $t4, 0
        li      $t5, 0

        # Store start address of B in another temporary register for looping 
        move    $t6, $t3

        outer_loop:
            beq     $t4, $t0, exit_outer_loop           # If all the rows have ended then end the loop

            inner_loop:
                beq     $t5, $t1, exit_inner_loop       # If all the elements of the current row have finished then end the loop
                lw      $t7, 0($t2)                     # Loading current element of A into memory 
                sw      $t7, 0($t6)                     # Storing the element in B
                addi    $t5, $t5, 1                     # Increasing loop variable (j)
                addi    $t2, $t2, -4                    # Moving address of current element of A to next position 
                sll     $t7, $t0, 2                     # Calculate value of 4*n
                sub     $t6, $t6, $t7                   # Move address of current element of B by 4*n (to the next row)
                j		inner_loop                      # Continue the loop
                
            exit_inner_loop:
                li      $t5, 0                          # Set j = 0
                addi    $t4, $t4, 1                     # Increment i
                addi    $t3, $t3, -4                    # Move address of current element of B by 4 (to the next column)
                move    $t6, $t3                        # Store the current address in temporary register for looping 
                j       outer_loop                      # Continue the loop 
                
        exit_outer_loop:
            jr      $ra                                 # Return 


    exit_code:
        # Printing thank you message 
        la      $a0, end_message
        li      $v0, 4
        syscall

        # System call to exit the code
        li      $v0, 10
        syscall 
