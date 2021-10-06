.data

array:                  .space 40
arrsize:                .word 10
input_prompt:           .asciiz "Enter the 10 numbers of the array:"
output_prompt:          .asciiz "Sorted array :"
search_prompt:          .asciiz "Enter the number to be searched: "
output_if_found:        .asciiz " is FOUND in the array at index "
output_if_not_found:    .asciiz " NOT FOUND in the array.\n"
fullstop:               .asciiz ".\n"
space:                  .asciiz "\t"
endl:                   .asciiz "\n"


READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10

.text
.globl main
    main:

        # Initialising the stack
        jal initStack
        
        # Printing the prompt for the 10 integers input
        la $a0, input_prompt
        lw $v0, PRINT_STRING_CODE
        syscall

        # Printing the newline characters
        la $a0, endl
        lw $v0, PRINT_STRING_CODE
        syscall

        # For taking the input
        lw $s0, arrsize     # $s0 = 1
        li $t0, 0           # i = 0

    take_input:
        # If i >= 10 exit the loop
        bge $t0, $s0, search_main   

        # syscall to take the input number
        lw $v0, READ_INT_CODE
        syscall
        
        # Getting the address where the number is to be put
        mul $t1, $t0, 4
        sw $v0, array($t1)

        # next_iterations, i = i + 1
        addi $t0, $t0, 1
        j take_input

    search_main:


        la $a0, array       # $a0 = address of the array
        li $a1, 0           # left = 0
        addi $a2, $s0, -1   # rigth = 9 = 10 - 1 = n - 1

        jal recursive_sort  # Calling the recursive sort function

        # Printing the output prompt
        la $a0, output_prompt
        lw $v0, PRINT_STRING_CODE
        syscall

        la $a0, endl
        lw $v0, PRINT_STRING_CODE
        syscall

        # Calling the function printArray 
        la $a0, array
        lw $a1, arrsize
        jal printArray

        # Printing the prompt to take the input the integer for searching.
        la $a0, search_prompt
        lw $v0, PRINT_STRING_CODE
        syscall

        # Taking input the integer
        lw $v0, READ_INT_CODE
        syscall
        move $s1, $v0


        # Calling the recursive search function to search the key
        la $a0, array   # First argument = A
        li $a1, 0       # Second argument = start = 0 
        lw $a2, arrsize
        addi $a2, $a2, -1   # Third argument = end = 9 = 10 - 1 = n - 1
        move $a3, $s1       # Fourth argument = key
        jal recursive_search    # Calling the function.

        move $s2, $v0       # $s2 = return value from the function
        beq $s2, -1, print_not_found  # If return = -1 then print not found.

        # Printing the key and index if found 
        move $a0, $s1       
        li $v0, 1
        syscall
        la $a0, output_if_found
        lw $v0, PRINT_STRING_CODE
        syscall
        move $a0, $s2
        li $v0, 1
        syscall
        la $a0, fullstop
        lw $v0, PRINT_STRING_CODE
        syscall


        # Returning out of the main
        lw $v0, EXIT_CODE
        syscall


    # If not found found print the statement according to the question.
    print_not_found:
        move $a0, $s1
        lw $v0, PRINT_INT_CODE
        syscall
        la $a0, output_if_not_found
        lw $v0, PRINT_STRING_CODE
        syscall
        #Returning out of the main
        lw $v0, EXIT_CODE
        syscall



    # This is the recursive function that sorts the array
    # The algorithm followed is as defined in the question.
    # $a0 = A
    # $a1 = left
    # $a2 = right
    recursive_sort:
        move $t0, $a0   # $t0 = A

        # Pushing the function arguments in the stack for future use.
        # Pushing the address pointer for the return
        move $a0, $ra
        jal pushToStack
        # Pushing the address of the array
        move $a0, $t0
        jal pushToStack
        # Pushing left in the stack
        move $a0, $a1
        jal pushToStack
        # Pushing right in the stack
        move $a0, $a2
        jal pushToStack

        lw $a0, 8($sp)  # Restoring $a0 as A
        lw $t0, 4($sp)  # $t0 = l = left
        lw $t1, 0($sp)  # $t1 = r = right
        lw $t2, 4($sp)  # $t2 = p = left

        j outer_while_loop

    # This is the outer while in the function
    outer_while_loop:
        bge $t0, $t1, outer_while_exit    # If l>=r exit the loop
     
        lw $a0, 8($sp)  # Restoring $a0 as A
        j inner_first_while

    # This is the inner first while loop in the outer while
    inner_first_while:
        mul $t3, $t0, 4     # $t3 = 4*l
        add $t3, $a0, $t3   # $t3 = A + 4*l = address of A[l]
        lw $t3, 0($t3)      # $t3 = A[l]

        mul $t4, $t2, 4     # $t4 = 4*p
        add $t4, $a0, $t4   # $t4 = A + 4*p = address of A[p]
        lw $t4, 0($t4)      # $t3 = A[p]

        bgt $t3, $t4, inner_first_while_exit   # If A[l]>A[p] exit the loop
        
        lw $t3, 0($sp)      # $t3 = right
        bge $t0, $t3, inner_first_while_exit   # If l >= right exit the loop


        addi $t0, $t0, 1 # l = l + 1
        # next iteration
        j inner_first_while

    # After exiting the first inner first while loop. Helps while debugging.
    inner_first_while_exit:
        j inner_second_while

    # This is the second inner while loop inside the outer while loop
    inner_second_while:
        mul $t3, $t1, 4     # $t3 = 4*r
        add $t3, $a0, $t3   # $t3 = A + 4*r = address of A[r]
        lw $t3, 0($t3)      # $t3 = A[r]

        mul $t4, $t2, 4     # $t4 = 4*p
        add $t4, $a0, $t4   # $t4 = A + 4*p = address of A[p]
        lw $t4, 0($t4)      # $t4 = A[p]
        
        blt $t3, $t4, inner_second_while_exit  # If A[r]<A[p] exit the loop

        lw $t3, 4($sp)      # $t3 = left
        ble $t1, $t3, inner_second_while_exit  # If r<=left exit the loop

        addi $t1, $t1, -1   # r = r - 1
        # next iteration
        j inner_second_while

    inner_second_while_exit:
        blt $t0, $t1, if_exit # If l<r then don't enter the if statement.
        # This is the if block in the algorithm.

        # Preparation for the swap
        mul $t3, $t2, 4
        add $t3, $a0, $t3

        mul $t4, $t1, 4
        add $t4, $a0, $t4
        # Executing the swap
        move $a0, $t3
        move $a1, $t4
        jal SWAP

        # Pushing r in the stack
        move $a0, $t1
        jal pushToStack
        
        # calling the first recursive_sort in the if block
        lw $a0, 12($sp)     # $a0 = A
        lw $a1, 8($sp)      # $a1 = left
        lw $t1, 0($sp)
        addi $a2, $t1, -1   # a2 = r - 1
        jal recursive_sort

        lw $a0, 12($sp)     # $a0 = A
        lw $t1, 0($sp)  
        addi $a1, $t1, 1    # $a1 = r + 1
        lw $a2, 4($sp)      # $a2 = right
        jal recursive_sort

        add $sp, $sp, 4     # Removing r from the stack.

        # Returning from the function.
        j outer_while_exit

    if_exit:
        # If we don't enter the if block we swap(A[l], A[r]) as in the algorithm and continue with the next iteration
        mul $t3, $t0, 4
        add $t3, $a0, $t3

        mul $t4, $t1, 4
        add $t4, $a0, $t4

        # Swapping the numbers
        move $a0, $t3
        move $a1, $t4
        jal SWAP
        # next iteration
        j outer_while_loop

    outer_while_exit:
        # Loading the return pointer to the original value.
        lw $ra, 12($sp)
        # Removing the initially pushed variables from the stack
        addi $sp, $sp, 16
        # Returning from the function.
        jr $ra

    # This is the standard swap function to swap to integers.
    SWAP:
        lw $t5, 0($a0)
        lw $t6, 0($a1)
        sw $t6, 0($a0)
        sw $t5, 0($a1)
        jr $ra


    # This is the function for the printing array.
    printArray:
        li $t1, 0       # i = 0
        move $t0, $a0   
    print_loop:
        bge $t1, $a1, print_exit # if i >=n break the loop

        # Getting the address for the input
        mul $t2, $t1, 4
        add $t2, $t0, $t2
        lw $a0, 0($t2)

        # Printing the integer
        lw $v0, PRINT_INT_CODE
        syscall
        # Printing the space
        la $a0, space
        lw $v0, PRINT_STRING_CODE
        syscall
        
        # next iteration
        addi $t1, $t1, 1
        j print_loop

    print_exit:
        # Printing the newline characters   
        la $a0, endl
        lw $v0, PRINT_STRING_CODE
        syscall

        # Returning from the function
        jr $ra

    # allocate 4 bytes for the argument and store it in the stack.
    pushToStack:
        addi $sp, $sp, -4
        sw $a0, 0($sp)
        jr $ra

    # Function to initialising the stack pointer and the frame pointer.
    initStack:
        addi $sp, $sp, -4
        sw $fp, 0($sp)
        move $fp, $sp
        jr $ra


    # Function for the recursive search
    # $t0 = start
    # $t1 = end
    # $t3 = mid1
    # $t4 = mid2
    recursive_search:
        # Pushing the variables in the stack.
        move $t0, $a0
        # Pushing the return address.
        move $a0, $ra
        jal pushToStack
        # Pushing the address of the array
        move $a0, $t0
        jal pushToStack
        # Pushing the variable start in the stack.
        move $a0, $a1
        jal pushToStack
        # Pushing the variable end in the stack.
        move $a0, $a2
        jal pushToStack
        # Pushing the key in the stack.
        move $a0, $a3
        jal pushToStack

        # Start of the while loop.
        j while_loop_search

    while_loop_search:
        lw $t0, 8($sp)  # $t0 = start
        lw $t1, 4($sp)  # $t1 = end
        bgt $t0, $t1, not_found    # if start>end then return -1

        sub $t2, $t1, $t0   # $t2 = end - start
        li $t3, 3           # $t3 = 3
        div $t2, $t2, $t3   # $t2 = (end - start)/3
        add $t3, $t0, $t2   # $t3 = mid1 = start + (end - start)/3
        sub $t4, $t1, $t2   # $t4 = mid2 = end - (end - start)/3

        lw $t2, 12($sp)     # $t2 = address of A
        mul $t5, $t3, 4     # $t5 = 4 * mid1
        add $t5, $t2, $t5   # $t5 = A + 4*mid1 = address of A[mid1]
        lw $t5, 0($t5)      # $t5 = A[mid1]
        beq $a3, $t5, found_left  # If A[mid1]==key then jump to found_left

        lw $t2, 12($sp)     # $t2 = address of A
        mul $t5, $t4, 4     # $t5 = 4 * mid2
        add $t5, $t2, $t5   # $t5 = A + 4*mid2 = address of A[mid2]
        lw $t5, 0($t5)      # $t5 = A[mid2]
        beq $a3, $t5, found_right # If A[mid2]==key then jump to found_right

        lw $t2, 12($sp)     # $t2 = address of A
        mul $t5, $t3, 4     # $t5 = 4 * mid1
        add $t5, $t2, $t5   # $t5 = A + 4*mid1 = address of A[mid1]
        lw $t5, 0($t5)      # $t5 = A[mid1]
        blt $a3, $t5, search_left  # if key < A[mid1] then jump to search_left

        lw $t2, 12($sp)     # $t2 = address of A
        mul $t5, $t4, 4     # $t5 = 4 * mid2
        add $t5, $t2, $t5   # $t5 = A + 4*mid2 = address of A[mid2]
        lw $t5, 0($t5)      # $t5 = A[mid2]
        bgt $a3, $t5, search_right # If key>A[mid2] jump to search_right     

        # Call the recursive_search(A, mid1+1, mid2-1, key)
        lw $a0, 12($sp)     
        addi $a1, $t3, 1
        addi $a2, $t4, -1
        jal recursive_search
        
        # Return the value received.
        # Restoring the return address.
        lw $ra, 16($sp)
        # Pop out the variable stored in the stack.
        addi $sp, $sp, 20
        # Return from the function.
        jr $ra

    # Return the value mid1 from the function.
    found_left:
        move $v0, $t3
        lw $ra, 16($sp)
        addi $sp, $sp, 20
        jr $ra

    # Return the value mid2 from the function.
    found_right:
        move $v0, $t4
        lw $ra, 16($sp)
        addi $sp, $sp, 20
        jr $ra

    # Calls the function recursive_search(A, start, mid1-1, key) and return the value got.
    search_left:
        lw $a0, 12($sp)
        move $a1, $t0
        addi $a2, $t3, -1
        jal recursive_search
        lw $ra, 16($sp)
        addi $sp, $sp, 20
        jr $ra

    # Calls the function recursive_search(a, mid2+1, end, key) and return the value got.
    search_right:
        lw $a0, 12($sp)
        addi $a1, $t4, 1
        move $a2, $t1
        jal recursive_search
        lw $ra, 16($sp)
        addi $sp, $sp, 20
        jr $ra

    # Return the value -1 from the function.
    not_found:
        li $v0, -1
        lw $ra, 16($sp)
        addi $sp, $sp, 20
        jr $ra


        move $a0, $s1
    li $v0, 1
    syscall
    la $a0, output_if_not_found
    li $v0, 4
    syscall
