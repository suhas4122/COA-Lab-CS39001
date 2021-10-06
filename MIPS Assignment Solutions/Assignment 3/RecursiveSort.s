.data

array:          .space 40
arrsize:        .word 10
input_prompt:   .asciiz "Enter the 10 numbers of the array:"
output_prompt:  .asciiz "Sorted array :"
space:          .asciiz "\t"
endl:           .asciiz "\n"


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
        bge $t0, $s0, sort_main   

        # syscall to take the input number
        lw $v0, READ_INT_CODE
        syscall
        
        # Getting the address where the number is to be put
        mul $t1, $t0, 4
        sw $v0, array($t1)

        # next_iterations, i = i + 1
        addi $t0, $t0, 1
        j take_input

    sort_main:

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

        # Calling the function printArray as defined in the question to print in the array
        la $a0, array
        lw $a1, arrsize
        jal printArray

        # Returning out of the main
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
