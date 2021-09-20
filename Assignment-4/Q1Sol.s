#    Assignment - 4
#    Problem  - 1 (Transpose of a matrix)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data 

# Declaration of output strings 
enter_message:
    .asciiz "*** STORING A GP IN A MATRIX AND FINDING DETERMINANT *** \n\n"

input_message: 
    .asciiz "Enter four positive integers n, a and r (press enter after entering each):  \n"

output_message1:
    .asciiz "Matrix after storing the GP (matrix A): \n"

output_message2:
    .asciiz "\nDeterminant of matrix A: "

white_space:
    .asciiz " "

new_line:
    .asciiz "\n"

end_message:
    .asciiz "\n*********** THANK YOU *********** \n\n"

.text
.globl main

    main:
		jal		initStack
		
		# Printing welcome message when the program starts
		la      $a0, enter_message
		li      $v0, 4
		syscall

		# Printing message to make the 2-D array
		la      $a0, input_message
		li      $v0, 4
		syscall

        # Taking first number (n) as input in $s0 
        li      $v0, 5
        syscall
        move    $s0, $v0

        # Taking first number (a) as input in $s0 
        li      $v0, 5
        syscall
        move    $s1, $v0

        # Taking first number (r) as input in $s0 
        li      $v0, 5
        syscall
        move    $s2, $v0    

        mul     $a0, $s0, $s0
        jal     mallocInStack
        move    $s3, $v0
        
        mul     $t0, $s0, $s0
        li      $t1, 0
        move    $t2, $s1
        move    $t3, $s3
        j       loop1

        loop1:
            sw      $t2, 0($t3)
            mul		$t2, $t2, $s2
            addi    $t3, 4
            addi    $t1, 1
            blt     $t1, $t0, loop1
        
        la      $a0, new_line
        li      $v0, 4
        syscall

        la      $a0, output_message1
		li      $v0, 4
		syscall
        
        move    $a0, $s0
        move    $a1, $s3
        jal     printMatrix
	
		move 	$a1, $s0
		move 	$a0, $s3	
		jal 	recursive_Det
		move 	$t1, $v0


		li 		$v0, 4
		la 		$a0, output_message2
		syscall
		
		
		li 		$v0, 1
		move 	$a0, $t1
		syscall

	exit_code:
        # Printing thank you message 
        la      $a0, end_message
        li      $v0, 4
        syscall

        # System call to exit the code
        li      $v0, 10
        syscall 
		
	# Initialise the stack ($sp and $fp pointers)
    initStack:
        addi    $sp, $sp, -4        # Give 4 bytes to the stack to store the frame pointer
        sw      $fp, 0($sp)         # Store the old frame pointer
        move    $fp, $sp            # Set frame pointer as stack pointer 
        jr      $ra                 # Return 

    # Function to allocate space of size m*n in stack and return base pointer 
    mallocInStack:
        move    $t0, $a0            
        sll     $t0, $t0, 2         # Calculating 4*m*n
        add     $sp, $sp, $t0       # Allocating  4*m*n bytes of memory in stack 
        move    $v0, $sp            # Store the value of base pointer to return 
		jr      $ra                 # Return 

    # Function to push an element to a stack 
    pushToStack:
        addi    $sp, $sp, -4        # Give 4 bytes to the stack to store the value
        sw      $a0, 0($sp)         # Store the value 
        jr      $ra                 # Return 

	popFromStack:
		lw      $v0, 0($sp)         # Store the value 
		addi    $sp, $sp, 4         # Give 4 bytes to the stack to store the value
        jr      $ra                 # Return 

    printMatrix:
        move    $t0, $a0
        move    $t1, $t0
        move    $t2, $a1
        li      $t3, 0
        li      $t4, 0
        mult    $t0, $t1
        mflo    $t5
    
        print_loop:
            lw      $a0, 0($t2)
            li      $v0, 1
            syscall

            addi    $t2, 4
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

	recursive_Det:
		li 		$s1, 0
		li 		$t1, 1						# To compare with 1
		bgt 	$a1, $t1, findDet			# Check to see if size of matrix not is 1x1
		lw		$v0, 0($s2)					# Set return value if size if 1x1
		jr 		$ra							# Return 

		findDet: 
			move 	$t0, $a1
			move 	$s0, $a0

			move 	$a0, $ra
			jal 	pushToStack

			move 	$a0, $t0
			jal 	pushToStack

			move 	$a0, $s0
			jal 	pushToStack
			
			move 	$a0, $t1
			jal 	pushToStack

			move 	$a0, $t2
			jal 	pushToStack

			move 	$a0, $s1
			jal 	pushToStack
					
			li 		$t1, 1
			li 		$t2, 0	# Loop counter
			
		det_loop:	
			beq 	$t2, $t0, end_det
			sw 		$t1, 8($sp)
			sw 		$t2, 4($sp)
			sw 		$s1, 0($sp)
			
			addi 	$t1, $t0, -1
			mul 	$a0, $t1, $t1
			sll 	$a0, $a0, 2
			li 		$v0, 9
			syscall
			move 	$s2, $v0
			
			move 	$a0, $t2
			move 	$a1, $t0
			move 	$a2, $s0
			move 	$a3, $s2
			jal 	getCoFactor
			
			
			subu 	$t0, $t0, 1


			move 	$a0, $s2
			move 	$a1, $t0
			jal 	recursive_Det
			move 	$t4, $v0
			
			lw 		$t0, 16($sp)
			lw 		$s0, 12($sp)
			lw 		$t1, 8($sp)
			lw 		$t2, 4($sp)
			lw 		$s1, 0($sp)

			li 		$t5, 0
			addu 	$t5, $t5, $t2
			sll 	$t5, $t5, 2
			add 	$t5, $s0, $t5
			lw 		$t3, 0($t5)
			mul 	$t3, $t3, $t1
			
			mul 	$t3, $t3, $t4
			addu 	$s1, $s1, $t3
			neg 	$t1, $t1
			addu 	$t2, $t2, 1

			b 		det_loop

	end_det: 
		jal 	popFromStack
		move 	$s1, $v0

		jal 	popFromStack
		move 	$t2, $v0

		jal 	popFromStack
		move 	$t1, $v0

		jal 	popFromStack
		move 	$s0, $v0

		jal 	popFromStack
		move 	$t0, $v0

		jal 	popFromStack
		move 	$ra, $v0

		# lw 		$ra, 20($sp)
		# lw 		$t0, 16($sp)
		# lw 		$s0, 12($sp)
		# lw 		$t1, 8($sp)
		# lw 		$t2, 4($sp)
		# lw 		$s1, 0($sp)
		# lw 		$fp, 24($sp)
		move 	$v0, $s1
		# addu 	$sp, $sp, 24
		
		jr 		$ra
	 
	getCoFactor: 
		move 	$t2, $a0		# a0=i	#q	
		move 	$t0, $a1		# a1=n	#n	
		move 	$s0, $a2		# a2 = address of original matrix	
		move 	$s2, $a3		# a3 = address of temp matrix 
			
		li 		$t6, 0	#i	
		li 		$t7, 0	#j	
		li 		$t8, 1	#row
		
		subu 	$s6, $t0, 1

		outer: 
			beq 	$t8, $t0, break_outer
			li 		$t9, 0	#col
			li 		$t7, 0	#col

			inner: 
				beq 	$t9, $t0, break_inner
				beq 	$t9, $t2, inc_col

				mul 	$s3, $t6, $s6       # $t5 <-- width * i
				add 	$s3, $s3, $t7       # $t5 <-- width * i + j
				sll 	$s3, $s3, 2         # $t5 <-- 2^2 * (width * i + j)
				add 	$s3, $s2, $s3       # $t5 <-- base address + (2^2 * (width * i + j))

				mul 	$s4, $t8, $t0       # $t5 <-- width * i
				add 	$s4, $s4, $t9       # $t5 <-- width * i + j	
				sll 	$s4, $s4, 2         # $t5 <-- 2^2 * (width * i + j)
				add 	$s4, $s0, $s4 

				lw 		$s5, 0($s4)          # store input number into array
				sw 		$s5, 0($s3)
		
				addu 	$t7, $t7, 1
				addu 	$t9, $t9, 1
				b 		inner


			inc_col: 
				addu 	$t9, $t9, 1
				b 		inner

			break_inner:
				addu 	$t6, $t6, 1
				addu 	$t8, $t8, 1	
				b 		outer

		break_outer: 
			jr 		$ra