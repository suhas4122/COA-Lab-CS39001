#    Assignment - 4
#    Problem  - 2 (Recursive sort of 10 numbers)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data 

# Declaration of output strings 
enter_message:
    .asciiz "*** SORTING ARRAY OF 10 NUMBERS BY RECURSIVE SORT ***\n\n"

input_message: 
    .asciiz "Enter ten integers to be sorted (press enter after each integer): \n"

output_message:
    .asciiz "\nSorted array : "

white_space:
    .asciiz " "

new_line:
    .asciiz "\n"

end_message:
    .asciiz "\n\n*********** THANK YOU *********** \n\n"

# Allocating space for the array
.align 2
array: .space 40

.text
.globl main 

    main:
            la      $a0, enter_message      # Printing welcome message
        li      $v0, 4
        syscall

                            # Prompting user to input array
        la      $a0, input_message
        li      $v0, 4
        syscall

        li      $t1, 1                              # Initialising $t1 (loop variable) (i)          
        la      $t3, array                          # loading adress of array in $t3

        # Loop to take input from the user
    input_Loop:             
            li      $v0, 5                          # Taking integer as input
            syscall

            move    $t0, $v0                        # Moving input value to $t0
            addi    $t1, $t1, 1                     # Increasing $t1(i) by 1
            sw      $t0, ($t3)                      # Storing entered value at array[i]
            addi    $t3, $t3, 4                     # Increasing address of $t3 to access next address
            bne     $t1, 11, input_Loop             # Get user input 10 times

        # Calling function recursive sort to sort the array 
        la      $a0, array                          # First argument = array address
        addi    $a1, $zero, 0                       # Second argument = start index
        addi    $a2, $zero, 9                       # Third argument = end index
        jal     recursive_sort

        la      $a0, array                          # First argument = array address
        addi    $a1, $zero, 10                      # Second argument = number of elements in the array
        jal     printArray                          # Function call to print sorted array

        j       exit_code                           # Jump control to exit_code block
        
    # Initialise the stack ($sp and $fp pointers)
    initStack:
        addi    $sp, $sp, -4                        # Give 4 bytes to the stack to store the frame pointer
        sw      $fp, 0($sp)                         # Store the old frame pointer
        move    $fp, $sp                            # Set frame pointer as stack pointer 
        jr      $ra                                 # Return 

    # Function to push an element to a stack 
    pushToStack:
        addi    $sp, $sp, -4                        # Give 4 bytes to the stack to store the value
        sw      $a0, 0($sp)                         # Store the value 
        jr      $ra                                 # Return 
    
    popFromStack:
    lw      $v0, 0($sp)                             # Store the value 
    addi    $sp, $sp, 4                             # Give 4 bytes to the stack to store the value
        jr      $ra                                 # Return 

    # Function to swap two elements of an array 
    SWAP:
        move    $t0, $a0                            # Loading argument1 into temporary register
        move    $t1, $a1                            # Loading argument2 into temporary register
        lw      $t2, 0($t0)                         # Extracting value from address 
        lw      $t3, 0($t1)                         # Extracting value from address 
        sw      $t2, 0($t1)                         # Saving back the swapped value
        sw      $t3, 0($t0)                         # Saving back the swapped value 
        jr $ra

    # Printing the sorted array 
    printArray:
                    
        move    $t0, $a0                            # Loads address of array in $t0 
        move    $t1, $a1                            # Stores length of array in $t1
        la      $a0, output_message                 # Prints output message
        li      $v0, 4
        syscall

        print_loop: 
            ble     $t1, $zero, return              # Check if loop has run 10 times 
            lw      $a0, ($t0)                      # Load word at current address 
            li      $v0, 1                      
            syscall                                 # Print word
             
            addi    $t0, $t0, 4                     # Increment current word address by 4               
            sub     $t1, $t1, 1                     # Decrease $t1 by 1      

            la      $a0, white_space                # Print white space        
            li      $v0, 4
            syscall 

            j       print_loop                      # Continue the loop 

        return:
            jr      $ra                             # Return control to caller function 

    # Function to sort the array recursively 
    recursive_sort:
        j       push_to_stack

    outer_while:
        blt     $s1, $s2, inner_while1              # Checking if l < r 

        j       restore_stack                       # Jump to restore_stack when sorting is complete

        inner_while1:            
            lw      $t0, 4($sp)                 
            mul     $t2, $t0, 4       
            addu    $t2, $t2, $s0                   # Store address of A[p] in $t2
            lw      $t3, 0($t2)                     # Store value of A[p] in $t3
            
            lw      $t0, 0($sp)                     # Load value of right
            
            mul     $t2, $s1, 4                 
            addu    $t2, $t2, $s0                   # Store address of A[l]
            lw      $t4, 0($t2)                     # Store value of A[l]

            blt     $t3, $t4, inner_while2          # Checking if A[p]<A[l]
            ble     $t0, $s1, inner_while2          # Checking if right<=l

            addu    $s1, 1                          # Increment l if above conditions fail

            j       inner_while1                    # Loop back for next iteration
        
        inner_while2:
            lw      $t0, 4($sp)                     # Load value of left

            mul     $t2, $t0, 4                 
            addu    $t2, $t2, $s0                   # Store address of A[p] in $t2
            lw      $t3, 0($t2)                     # Store value of A[p] in $t3
            
            mul     $t2, $s2, 4         
            addu    $t2, $t2, $s0                   # Store address of A[r]
            lw      $t4, 0($t2)                     # Store value of A[r]

            bge     $t0, $s2, check_if              # Checking if left >= r
            bgt     $t3, $t4, check_if              # Checking if A[p] > A[r]

            subu    $s2, 1                          # Decrement r if above conditions fail
        
            j       inner_while2                    # Loop back for next iteration

        check_if:
            bge     $s1, $s2, if_satisfied          # Checking if l >= r  
            j       continue_while

                if_satisfied:
                    lw      $t0, 4($sp)
                    mul     $a0, $t0, 4          
                    addu    $a0, $a0, $s0           # First argument = A[p]
                    mul     $a1, $s2, 4         
                    addu    $a1, $a1, $s0           # Second argument = A[r]
                    jal     SWAP                    # Function call to SWAP

                    lw      $a0, 16($sp)            # First argument = address of A
                    lw      $a1, 4($sp)             # Second argument = value of left
                    subu    $a2, $s2, 1             # Third argument = r-1
                    jal     recursive_sort      

                    lw      $a0, 16($sp)            # First argument = address of A
                    addu    $a1, $s2, 1             # Second argument = r + 1
                    lw      $a2, 0($sp)             # Third argument = value of right
                    jal     recursive_sort

                    j       restore_stack           # Jump to restore_stack after completion of loop

        continue_while:
            mul     $a0, $s1, 4          
            addu    $a0, $a0, $s0                   # First argument=  value of A[l]
            mul     $a1, $s2, 4         
            addu    $a1, $a1, $s0                   # Second argument =  value of A[r]
            jal     SWAP                            # Function call to SWAP

            j       outer_while                     # Jump back to outer_while for next iteration

    initialise_variables:
        la      $s0, array                          # Loads address of array in $s0
        add     $s1, $a1, $zero                     # Stores value of 'left' 
        add     $s2, $a2, $zero                     # Stores value of 'right'

        j       outer_while                         # Jump back to outer_while

    push_to_stack:
        add     $a0, $ra, $zero                     # Push return address into the stack 
        jal     pushToStack

        add     $a0, $s0, $zero                     # Push start address of array into the stack
        jal     pushToStack

        add     $a0, $s1, $zero                     # Push 'l' into the stack 
        jal     pushToStack

        add     $a0, $s2, $zero                     # Push 'r' into the stack 
        jal     pushToStack

        add     $a0, $a1, $zero                     # Push 'left' into the stack
        jal     pushToStack

        add     $a0, $a2, $zero                     # Push 'right' into the stack
        jal     pushToStack

        j       initialise_variables
    
    sort_return:
        jr      $ra                                 # Return after a recursive call

    restore_stack:
        lw      $ra, 20($sp)                        # After a recursive function call 
        lw      $s0, 16($sp)                        # Restore values of all the register back from the stack
        lw      $s1, 12($sp)
        lw      $s2, 8($sp)
        addu    $sp, $sp, 24

        j       sort_return

    exit_code: 
        la      $a0, end_message                    # Printing thank you message
        li      $v0, 4
        syscall

        li      $v0, 10                             # System call to exit the code
        syscall 
