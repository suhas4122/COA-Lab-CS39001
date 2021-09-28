#    Assignment - 4
#    Problem  - 3 (Recursive search in an sorted array)
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

input_message1: 
    .asciiz "Enter ten integers to be sorted (press enter after each integer): \n"

input_message2: 
    .asciiz "\nEnter an integer to be searched in the array (n): "

output_message:
    .asciiz "\nSorted array : "

found:
    .asciiz " is FOUND in the array at index "

not_found:
    .asciiz " NOT FOUND in the array."

white_space:
    .asciiz " "

new_line:
    .asciiz "\n\n"

end_message:
    .asciiz "\n\n*********** THANK YOU *********** \n\n"

# Allocating space for the array
.align 2
array: .space 40

.text
.globl main 

    main:
        # Printing welcome message when the program starts
        la      $a0, enter_message
        li      $v0, 4
        syscall

        # Printing message before taking array as input
        la      $a0, input_message1
        li      $v0, 4
        syscall

        # Initialising $t1 and loading adress of array in $t3
        li      $t1, 1                  
        la      $t3, array          

        # Loop to take input from the user
        input_Loop:             
            li      $v0, 5                          # Taking integer as input
            syscall
            move    $t0, $v0                        # Moving input value to $t0
            addi    $t1, $t1, 1                     # Increasing $t1(i) by 1
            sw      $t0, ($t3)                      # Storing entered value at array[i]
            addi    $t3, $t3, 4                     # Increasing address of $t3 to access next address
            bne     $t1, 11, input_Loop             # Get user input 10 times

        la      $a0, input_message2
        li      $v0, 4
        syscall

        li      $v0, 5                              # Taking integer to be searched (key)  as input
        syscall
        move    $a0, $v0
        jal     pushToStack

        # Calling function recursive sort to sort the array 
        la      $a0, array                          # First argument = array address
        addi    $a1, $zero, 0                       # Second argument = start index
        addi    $a2, $zero, 9                       # Third argument = end index
        jal     recursive_sort

        la      $a0, array                          # First argument = array address
        addi    $a1, $zero, 10                      # Second argument = number of elements in the array
        jal     printArray

        la      $a0, array                          # First argument = array address
        addi    $a1, $zero, 0                       # Second argument = start index
        addi    $a2, $zero, 9                       # Third argument = end index
        lw      $a3, 0($sp)

        jal     recursive_search                    # Calls recursive_search

        move    $t0, $v0                            # Stores return value of recursive_search in $t0
        li      $t1, -1                             # Stores -1 in $t1
        
        jal     popFromStack                        # gets value of key
        move    $a0, $v0
        li      $v0, 1
        syscall                                     # prints value of key

        beq     $t0, $t1, fail                      # if value returned by recursive_search equals -1, key was not found
        j       success                             # else key was found in array
             
        fail:
            la      $a0, not_found                  # Printing failure message
            li      $v0, 4
            syscall
            j       exit_code                       # Control jumps to exit_code block

        success:
            la      $a0, found                      # Printing success message if number is found
            li      $v0, 4
            syscall

            move    $a0, $t0                        # Printing the position of the key in the array
            li      $v0, 1
            syscall

        j       exit_code                           # Control jumps to exit_code block

    #---------HELPER FUNCTIONS-------------------   

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
        move    $t0, $a0                            # Loading argumen1 into temporary register
        move    $t1, $a1                            # Loading argumen2 into temporary register
        lw      $t2, 0($t0)                         # Extracting value from address 
        lw      $t3, 0($t1)                         # Extracting value from address 
        sw      $t2, 0($t1)                         # Saving back the swapped value
        sw      $t3, 0($t0)                         # Saving back the swapped value 
        jr $ra

    # Printing the sorted array 
    printArray:
        # Loading address of array and initialising variables               
        move    $t0, $a0         
        move    $t1, $a1    
        la      $a0, output_message
        li      $v0, 4
        syscall

        print_loop: 
            # Check if loop has run 10 times 
            ble     $t1, $zero, return          
            lw      $a0, 0($t0)                     # Load word at current address 
            li      $v0, 1                      
            syscall                                 # Print word
            
            # Increment current word address by 4 and decrease $t1
            addi    $t0, $t0, 4                 
            sub     $t1, $t1, 1             

            # Print white space
            la      $a0, white_space                   
            li      $v0, 4
            syscall 

            # Continue the loop 
            j       print_loop  

        return:
            # Print newline before returning 
            la      $a0, new_line                  
            li      $v0, 4
            syscall

            jr      $ra             

    #-----------SORTING FUNCTION--------------
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

        j       sort_return                         # Jump to sort_return


    #------------SEARCHING FUNCTION----------
    recursive_search:
        move    $t0, $a0                            # Stores the sorted array A
        move    $t1, $a1                            # Stores the value of start
        move    $t2, $a2                            # Stores the value of end
        move    $t3, $a3                            # Stores the value of key

        move    $a0, $ra
        jal     pushToStack
    
        bgt     $t1, $t2, search_fail               # if start>end Jump to search_fail

        sub     $t4, $t2, $t1                       # Stores value of (end - start) in $t4
        li      $t5, 3                              # Stores 3 in $t5
        div     $t4, $t5
        mflo    $t4                                 # Stores (end - start)/3 in $t4
        sub     $t5, $t2, $t4                       # Stores value of mid2
        add     $t4, $t1, $t4                       # Stores value of mid1

        sll     $t6, $t4, 2                         # Stores value of mid1*4
        add     $t6, $t0, $t6                       # Stores position of A[mid1]
        lw      $t6, 0($t6)                         # Stores A[mid1]

        sll     $t7, $t5, 2                         # Stores value of mid2*4
        add     $t7, $t0, $t7                       # Stores position of A[mid2]
        lw      $t7, 0($t7)                         # Stores A[mid2]

        beq     $t3, $t6, if_1                      # if key is found at mid1
        beq     $t3, $t7, if_2                      # if key is found at mid2
        blt     $t3, $t6, if_3                      # if key < A[mid1]---> search in left subarray
        bgt     $t3, $t7, if_4                      # if key > A[mid2] ---> search in right subarray
        j       else                                # else search in the center subarray
    
    # if key is found at mid1
    if_1:
        move    $v0, $t4                            # Stores mid1 in register
        j       return_search                       # Calls return_search to return mid1
    
    # if key is found at mid2
    if_2:
        move    $v0, $t5                            # Stores mid2 in register
        j       return_search                       # Calls return_search to return mid2

    # if key < A[mid1]---> search in left subarray
    if_3:
        subu    $t4, $t4, 1                         # mid1 = mid1 - 1
        move    $a0, $t0                            # Stores the array A for recursive call
        move    $a1, $t1                            # Stores the value of start
        move    $a2, $t4                            # Stores the value of end = mid1-1
        move    $a3, $t3                            # Stores the value of key
        jal     recursive_search                    # Calls the function in the left subarray
        j       return_search                       # Jump to return_search block

    # if key > A[mid2] ---> search in right subarray
    if_4:
        addu    $t5, $t5, 1                         # mid2 = mid2 + 1
        move    $a0, $t0                            # Stores the array A for recursive call
        move    $a1, $t5                            # Stores the value of start = mid2+1
        move    $a2, $t2                            # Stores the value of end
        move    $a3, $t3                            # Stores the value of key
        jal     recursive_search                    # Calls the function in the right subarray
        j       return_search                       # Jump to return_search block
    
    # if A[mid1] < key < A[mid2] ---> seearch in center subarray
    else:
        addu    $t4, $t4, 1                         # mid1 = mid1 + 1
        subu    $t5, $t5, 1                         # mid2 = mid2 - 1   
        move    $a0, $t0                            # Stores the array A for recursive call
        move    $a1, $t4                            # Stores the value of start = mid1+1
        move    $a2, $t5                            # Stores the value of end = mid2-1
        move    $a3, $t3                            # Stores the value of key
        jal     recursive_search                    # Calls the function in the center subarray
        j       return_search                       # Jump to return_search block

    # Called when start>end
    search_fail:                    
        jal     popFromStack                        # Calls helper function 
        move    $ra, $v0                 
        li      $v0, -1                             # Load -1 in register $v0
        jr      $ra                                 # Return -1 to caller function
    
    return_search:
        move    $t0, $v0                            # Store index of key in $t0
        jal     popFromStack                        # Calls helper function
        move    $ra, $v0
        move    $v0, $t0                            # Load index of key in $v0
        jr      $ra                                 # Return index to caller function

    exit_code: 
        la      $a0, end_message                    # Printing thank you message
        li      $v0, 4
        syscall

        li      $v0, 10                             # System call to exit the code
        syscall 
