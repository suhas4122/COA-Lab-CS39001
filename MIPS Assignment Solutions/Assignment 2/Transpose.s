.data

input_prompt:       .asciiz "Enter four positive integers m, n, a and r: "
space:              .asciiz "\t"
newl:               .asciiz "\n"
matrix_A:           .asciiz "Matrix A:\n"
matrix_B:           .asciiz "Matrix B( Transpose of Matrix A ):\n"

# Variables:
# m = $s0 + 12
# n = $s0 + 8
# a = $s0 + 4
# r = $s0
# A = $s1
# B = $s2


READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10

.text
.globl main
    main:

        # Initialising the stack pointer and the frame pointer
        jal init_stack

        # Prompt for the input. The input is to be given in newline, instead of four integers in the same line with spaces.
        la $a0, input_prompt
        lw $v0, PRINT_STRING_CODE
        syscall

        # Taking the inputs and pushing them in the stack.
        lw $v0, READ_INT_CODE
        syscall
        move $a0, $v0
        jal pushToStack

        lw $v0, READ_INT_CODE
        syscall
        move $a0, $v0
        jal pushToStack

        lw $v0, READ_INT_CODE
        syscall
        move $a0, $v0
        jal pushToStack

        lw $v0, READ_INT_CODE
        syscall
        move $a0, $v0
        jal pushToStack

        # storing the addres of the current stack pointer in $s0
        la $s0, 0($sp)

        lw $t0, 12($s0) # $t0 = m
        lw $t1, 8($s0)  # $t1 = n

        mul $a0, $t0, $t1   # $a0 = m*n
        jal mallocInStack   # Allocating the array A in the stack.
        move $s1, $v0       # Store the starting of the array in $s1

        mul $a0, $t0, $t1   # $a0 = m*n
        jal mallocInStack   # Allocating the array B in the stack
        move $s2, $v0       # Store the starting of B in $s2

        mul $t2, $t0, $t1   # $t2 = m*n
        li $t3, 0           # i($t3) = 0
        lw $t4, 4($s0)      # $t4 = a
        lw $t5, 0($s0)      # $t5 = r
        j after_populate

    populate:
        mul $t6, $t3, 4     # $t6 = 4*i
        add $t6, $s1, $t6   # $t6 = A+4*i = A[i]

        sw $t4, 0($t6)      # A[i]= $t4(a*r^i)

        mul $t4, $t5, $t4   # $t4 = $t4*r => a*r^(i+1)
        addi $t3, $t3, 1    # i=i+1

    after_populate:
        blt $t3, $t2, populate  # Jump back to the loop

        # Print the statement before printing the matrix A
        la $a0, matrix_A        
        lw $v0, PRINT_STRING_CODE  #syscall code for printing string
        syscall

        # Set the arguments appropriately and call the function print matrix
        move $a0, $t0
        move $a1, $t1
        move $a2, $s1
        jal printMatrix

        la $a0, newl     # Print a new line at the end  
        lw $v0, PRINT_STRING_CODE           
        syscall 

        # Call the function to transpose the matrix after setting appropriate arguments
        move $a0, $t0
        move $a1, $t1
        move $a2, $s1
        move $a3, $s2
        jal transposeMatrix

        # Print the statement before printing the matrix B
        la $a0, matrix_B
        lw $v0, PRINT_STRING_CODE #syscall code for printing string
        syscall

        # Set the arguments appropriately and call the function print matrix
        move $a0, $t1
        move $a1, $t0
        move $a2, $s2
        jal printMatrix           
        
        # Exit the function
        lw $v0, EXIT_CODE
        syscall

    # Function to initialising the stack pointer and the frame pointer.
    init_stack:
        addi $sp, $sp, -4
        sw $fp, 0($sp)
        move $fp, $sp
        jr $ra

    # allocate 4 bytes for the argument and store it in the stack.
    pushToStack:
        addi $sp, $sp, -4
        sw $a0, 0($sp)
        jr $ra

    # Allocate the space with the amount store in $a0
    mallocInStack:
        mul $a0, $a0, 4     # $a0 = 4*m*n ( the size of the space that is to be allocated. )
        sub $sp, $sp, $a0   # push the stack pointer down for the space
        move $v0, $sp       # Return the current stack pointer value.
        jr $ra

    # Function to print the matrix.
    printMatrix:
        #$a0 -> integer m
        #$a1 -> integer n
        #$a2 -> address of array which is stored in row major

        addi $sp, $sp, -4   # Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
        sw $t0, 0($sp)      # Save $t0 to stack
        addi $sp, $sp, -4   # Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
        sw $t1, 0($sp)      # Save $t1 to stack

        move $t0, $a0       #Outer loop counter = m
        matPrintouter:
            move $t1, $a1       #Inner loop counter = n
            matPrintinner:
                lw $a0, 0($a2)      #$a0 = a[i] in row major
                lw $v0, PRINT_INT_CODE          #syscall code for printing integer
                syscall
                addi $a2, $a2, 4    #Incrementing i
                la $a0, space       #$a0 -> address of 'space'
                lw $v0, PRINT_STRING_CODE           #syscall code for printing string
                syscall             #syscall for printing 'space'
                addi $t1, $t1, -1   # Decrement $t1 for inner loop count
                bgtz $t1, matPrintinner
            la $a0, newl        #$a0 -> address of 'newl'
            lw $v0, PRINT_STRING_CODE           #syscall code for printing string
            syscall             #syscall for printing 'newl'
            addi $t0, $t0, -1   # Decrement $t0 for outer loop count
            bgtz $t0, matPrintouter

        lw $t1, 0($sp)      # Pop $t1 from stack
        addi $sp, $sp, 4    # Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
        lw $t0, 0($sp)      # Pop $t0 from stack
        addi $sp, $sp, 4    # Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

        jr $ra


    # Function to transpose the matrix.
    transposeMatrix:
        #$a0 -> integer m
        #$a1 -> integer n
        #$a2 -> address of array which is stored in row major
        #$a3 -> address of array where transpose is saved

        addi $sp, $sp, -4   # Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
        sw $t0, 0($sp)      # Save $t0 to stack
        addi $sp, $sp, -4   # Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
        sw $t1, 0($sp)      # Save $t1 to stack
        addi $sp, $sp, -4   # Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
        sw $t2, 0($sp)      # Save $t2 to stack
        addi $sp, $sp, -4   # Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
        sw $t3, 0($sp)      # Save $t3 to stack
        addi $sp, $sp, -4   # Decrement stack pointer by 4 -> Allocating memory of 4 bytes = 32 bits
        sw $t4, 0($sp)      # Save $t4 to stack

        move $t0, $a0       #Outer loop counter = m
        matTransouter:
            move $t1, $a1       #Inner loop counter = n
            matTransinner:
                lw $t2, 0($a2)      #$t2 = a[i] in row major
                sub $t3, $a0, $t0   #Get index i
                sub $t4, $a1, $t1   #Get index j
                mul $t4, $t4, $a0   #$t4 = m*j
                add $t4, $t4, $t3   #$t4 = m*j + i
                add $t4, $t4, $t4
                add $t4, $t4, $t4   #Quadrupling for address
                add $t4, $a3, $t4   #Address of b[j][i]
                sw $t2, 0($t4)
                addi $a2, $a2, 4    #Incrementing i
                move $t4, $a0       #Saving $a0 as it stores m
                la $a0, space       #$a0 -> address of 'space'
                lw $v0, PRINT_STRING_CODE           #syscall code for printing string
                syscall             #syscall for printing 'space'
                move $a0, $t4
                addi $t1, $t1, -1   # Decrement $t1 for inner loop count
                bgtz $t1, matTransinner
            move $t4, $a0       #Saving $a0 as it stores m
            la $a0, newl        #$a0 -> address of 'newl'
            lw $v0, PRINT_STRING_CODE           #syscall code for printing string
            syscall             #syscall for printing 'newl'
            move $a0, $t4
            addi $t0, $t0, -1   # Decrement $t0 for outer loop count
            bgtz $t0, matTransouter

        lw $t4, 0($sp)      # Pop $t4 from stack
        addi $sp, $sp, 4    # Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
        lw $t3, 0($sp)      # Pop $t3 from stack
        addi $sp, $sp, 4    # Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
        lw $t2, 0($sp)      # Pop $t2 from stack
        addi $sp, $sp, 4    # Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
        lw $t1, 0($sp)      # Pop $t1 from stack
        addi $sp, $sp, 4    # Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits
        lw $t0, 0($sp)      # Pop $t0 from stack
        addi $sp, $sp, 4    # Increment stack pointer by 4 -> De-allocating memory of 4 bytes = 32 bits

        jr $ra
