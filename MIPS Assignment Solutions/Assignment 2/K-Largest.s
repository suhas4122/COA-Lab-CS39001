.data
	array:				 .space 40
	size:				 .word 10
	ainp:				 .asciiz "Enter the elements one by one:"
	kinp:				 .asciiz "Enter the value of k: "
	sorted_array:		 .asciiz "Sorted Array: "
	out1:				 .asciiz "The "
	out2:				 .asciiz "-th largest number among is: "
	comma:				 .asciiz ", "
	newl:				 .asciiz "\n"
	inva:				 .asciiz "Invalid since k>n"
	READ_INT_CODE:       .word 5
	PRINT_INT_CODE:      .word 1
	PRINT_STRING_CODE:   .word 4
	EXIT_CODE:           .word 10

.text
.globl main

	main:
	    la $a0, ainp
	    lw $v0, PRINT_STRING_CODE
	    syscall

	    la $a0, newl
	    lw $v0, PRINT_STRING_CODE
	    syscall

	    lw $s0, size
	    li $t0, 0

	    takeInput:
		    lw $v0, READ_INT_CODE
		    syscall
		    mul $t1, $t0, 4
		    sw $v0, array($t1)
		    addi $t0, $t0, 1
		    blt $t0, $s0, takeInput

	    la $a0, array
	    move $a1, $s0
	    jal sort_array

	    la $a0, sorted_array
	    lw $v0, PRINT_STRING_CODE
	    syscall

		li $t0, 0

		sub $s0, $s0, 1 

		print:
		    mul $t1, $t0, 4
		    lw $a0, array($t1)
		    
		    lw $v0, PRINT_INT_CODE
		    syscall
		    
		    la $a0, comma
		    lw $v0, PRINT_STRING_CODE
		    syscall

		    addi $t0, $t0, 1
		    blt $t0, $s0, print

		mul $t1, $t0, 4
		lw $a0, array($t1)
		    
		lw $v0, PRINT_INT_CODE
		syscall

		addi $s0, $s0, 1 


	    la $a0, newl
	    lw $v0, PRINT_STRING_CODE
	    syscall
	    
	    la $a0, kinp
	    lw $v0, PRINT_STRING_CODE
	    syscall

	    lw $v0, READ_INT_CODE
	    syscall
	    move $s1, $v0

	    bgt $s1, $s0, errorMessage

	    move $a0, $s1
	    move $a1, $s0
	    jal find_k_largest

	    lw $v0, EXIT_CODE
	    syscall


	sort_array:
	    li $t1, 1
	    blt $t1, $a1, outsideForLoop

	outsideForLoop:
	    mul $t2, $t1, 4
	    add $t3, $a0, $t2

	    # temp = array[j]
	    lw $t3, ($t3)

	    # i = j-1
	    add $t5, $t1, -1

	whileLoop:
	    blt $t5, 0, afterWhile
	    mul $t2, $t5, 4     
	    add $t6, $a0, $t2
	    lw $t7, ($t6)
	    ble $t7, $t3, afterWhile
	   
	    # array[i+1] = array[i]
	    sw $t7, 4($t6) 
	   
	    # i = i-1     
	    addi $t5, $t5, -1 

	    j whileLoop

	afterWhile:
	    mul $t2, $t5, 4 
	    add $t6, $a0, $t2

	    # array[i+1] = temp
	    sw $t3, 4($t6)

	    # j=j+1
	    add $t1, $t1, 1

	    blt $t1, $a1, outsideForLoop

	    jr $ra

	find_k_largest:
	    move $s2, $a0
	    move $s3, $a1

	    la $a0, out1
	 	lw $v0, PRINT_STRING_CODE
	 	syscall

	 	move $a0, $s2
	 	lw $v0, PRINT_INT_CODE
	 	syscall

	 	la $a0, out2
	 	lw $v0, PRINT_STRING_CODE
	 	syscall

	    # k-th largest is array[n-k]
	    sub $t2, $s3, $s2
	    mul $t2, $t2, 4

	    lw $a0, array($t2)
	    lw $v0, PRINT_INT_CODE
	    syscall

	    la $a0, newl
	    lw $v0, PRINT_STRING_CODE
	    syscall

	    jr $ra

	errorMessage:
	    la $a0, inva
	    lw $v0, PRINT_STRING_CODE
	    syscall

	    la $a0, newl
	    lw $v0, PRINT_STRING_CODE
	    syscall

	    lw $v0, EXIT_CODE
	    syscall
 