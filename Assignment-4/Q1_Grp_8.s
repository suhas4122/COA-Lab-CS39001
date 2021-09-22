#    Assignment - 4
#    Problem  - 1 (Determinant of a matrix)
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
    .asciiz "Enter four positive integers n, a, r and m (press enter after entering each):  \n"

output_message1:
    .asciiz "Matrix after storing the GP with MOD m (matrix A): \n"

output_message2:
    .asciiz "\nFinal determinant of the matrix A is "

return:
	.asciiz "\nReturn value : "

white_space:
    .asciiz " "

new_line:
    .asciiz "\n"

end_message:
    .asciiz "\n\n*********** THANK YOU *********** \n\n"

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

		# Taking first number (m) as input in $s0 
        li      $v0, 5
        syscall
        move    $s4, $v0    

		# Calculating size of matrix and allocating memory on stack
        mul     $a0, $s0, $s0
        jal     mallocInStack
        move    $s3, $v0				

		# Filling the matrix with a GP with mod 
        mul     $t0, $s0, $s0				# $t0 = n*n (size of matrix)
        li      $t1, 0						# $t0 = 0, iterator for the loop 
        move    $t2, $s1					# $t2 = a, storing the current term of the gp
		div		$t2, $s4					# Dividing by m to find the mod
		mfhi 	$t2							# Storing mod back in $t2
        move    $t3, $s3					# Storing starting address of the matrix in $t3
        j       loop				

        loop:
            sw      $t2, 0($t3)				# Save current term of the gp in the matrix
            mul		$t2, $t2, $s2			# Multiply the current term by r, to get the next term
			div		$t2, $s4				# Dividing by m to find the mod
			mfhi 	$t2						# Storing mod back in $t2
            addi    $t3, 4					# Moving to the address of next element of the matrix
            addi    $t1, 1					# Increasing the iterator ($t1)
            blt     $t1, $t0, loop			# if iterator ($t1) < n*n, continue loop
        
		# Printing newline before pprinting the next message
        la      $a0, new_line		
        li      $v0, 4
        syscall
		
		# Printing the message before printing the matrix
        la      $a0, output_message1
		li      $v0, 4
		syscall
        
		# Function call to print the matrix
        move    $a0, $s0					# First argument, storing the matrix dimention (n)
        move    $a1, $s3					# Second argument, storing the starting address of the matrix
        jal     printMatrix			
	
		# Function call to compute the determinant recursively
		move 	$a1, $s0					# First argument, storing the matrix dimention (n)
		move 	$a0, $s3					# Second argument, storing the starting address of the matrix
		jal 	recursive_Det		
		move 	$t1, $v0					# Storing the return value in $t1

		# Printing the output message before printing the determinant
		li 		$v0, 4						
		la 		$a0, output_message2
		syscall

		# Printing the value of the determinant (stored in $t1)		
		li 		$v0, 1
		move 	$a0, $t1
		syscall

		j 		exit_code
		
	# Initialise the stack ($sp and $fp pointers)
    initStack:
        addi    $sp, $sp, -4        		# Give 4 bytes to the stack to store the frame pointer
        sw      $fp, 0($sp)         		# Store the old frame pointer
        move    $fp, $sp            		# Set frame pointer as stack pointer 
        jr      $ra                 		# Return 

    # Function to allocate space of size m*n in stack and return base pointer 
    mallocInStack:
        move    $t0, $a0            
        sll     $t0, $t0, 2         		# Calculating 4*m*n
        add     $sp, $sp, $t0       		# Allocating  4*m*n bytes of memory in stack 
        move    $v0, $sp            		# Store the value of base pointer to return 
		jr      $ra                 		# Return 

    # Function to push an element to a stack 
    pushToStack:
        addi    $sp, $sp, -4        		# Give 4 bytes to the stack to store the value
        sw      $a0, 0($sp)         		# Store the value 
        jr      $ra                 		# Return 

	popFromStack:
		lw      $v0, 0($sp)         		# Store the value 
		addi    $sp, $sp, 4         		# Give 4 bytes to the stack to store the value
        jr      $ra                 		# Return 

    printMatrix:
		# Load function parameters into temporary registers 
        move    $t0, $a0
        move    $t1, $t0
        move    $t2, $a1

		# Initialise iterators to 0 (i1 = 0 and i2 = 0)
        li      $t3, 0
        li      $t4, 0

        # Store total size as n*n 
        mul     $t5, $t0, $t1
    
        print_loop:
			# Loading current element and printing it
            lw      $a0, 0($t2)
            li      $v0, 1
            syscall

			# Move address pointing to current element and the iterators
            addi    $t2, 4
            addi    $t3, 1
            addi    $t4, 1

			# Print white space after each number
            la      $a0, white_space
            li      $v0, 4
            syscall

			# If all the elements have been printed (i1 == m*n) then exit loop
            beq     $t3, $t5, end_print_loop

			# If current row has ended then print newline (i2 == n)
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

	recursive_Det:
		li 		$s1, 0
		li 		$t1, 1						# To compare with 1
		bgt 	$a1, $t1, findDet			# Check to see if size of matrix not is 1x1
		lw		$v0, 0($s2)					# Set return value if size if 1x1
		jr 		$ra							# Return 

		findDet: 	
			move 	$t0, $a1				# Storing starting address of the matirx in $t0
			move 	$s0, $a0				# Storing dimention of the matrix (n) in $s0

			move 	$a0, $ra				# Pushing return address in the stack
			jal 	pushToStack

			move 	$a0, $t0				# Pushing starrting address of the array in stack
			jal 	pushToStack
			
			move 	$a0, $s0				# Pushed dimention of the matrix (n) in the stack
			jal 	pushToStack

			move 	$a0, $t1				# Pushing the sign (that alternates between +1/-1) in the stack
			jal 	pushToStack

			move 	$a0, $t2				# Pushing loop iterator in the stack
			jal 	pushToStack

			move 	$a0, $s1				# Storing the sum (storing the determinant) in the stack
			jal 	pushToStack
					
			li 		$t1, 1					# Initialising sign variable to +1
			li 		$t2, 0					# Initialising loop iterator
			
		det_loop:	
			sw 		$t1, 8($sp)				# Save updated value of $t1 in stack 
			sw 		$t2, 4($sp)				# Save updated value of $t2 in stack 
			sw 		$s1, 0($sp)				# Save updated value of $s1 in stack 
			
			addi 	$t1, $t0, -1			# Calculating dimention of cofactor matrix (n-1)
			mul 	$a0, $t1, $t1			# Size of cofactor matrix (n*n)
			
			# Allocating memory for the temporary matrix
			sll 	$a0, $a0, 2				# Calculating the memory required 4*(n-1)*(n-1)
			li 		$v0, 9				
			syscall
			move 	$s2, $v0				# Storing starting address of temporary matrix
			
			# Function call to get the cofactor matrix in temporary matrix
			move 	$a0, $t2				# First argument, column to be excluded 
			move 	$a1, $t0				# Second argument, dimention of the matrix 
			move 	$a2, $s0				# Third argument, starting address of original matrix 
			move 	$a3, $s2				# Fourth argument, starting address of temporary matrix
			jal 	getCoFactor
			
			
			subu 	$t0, $t0, 1				# Decrease $t0 by 1 (n to n-1)

			# Function call to compute the determinant of the cofactor matrix
			move 	$a0, $s2				# First argument, starting address of temporary matrix
			move 	$a1, $t0				# Second argument, dimention of the matrix
			jal 	recursive_Det
			move 	$t4, $v0				# Storing return value of the function in $t4
			
			# Updating values of all the registers from the stack after function call
			lw 		$t0, 16($sp)
			lw 		$s0, 12($sp)
			lw 		$t1, 8($sp)
			lw 		$t2, 4($sp)
			lw 		$s1, 0($sp)
			
			# multipling determinant of cofactor matrix with matrix element and sign 
			move 	$t5, $t2				# $t5 = $t2
			mul 	$t5, $t5, 4			
			add 	$t5, $s0, $t5			
			lw 		$t3, 0($t5)				# Storing A[0][i] in $t3
			mul 	$t3, $t3, $t1			# Storing (-1)^(i+1)*A[0][i] in $t3
			
			mul 	$t3, $t3, $t4			# Storing (-1)^(i+1)*M[0][i]*A[0][i] in $t3
			addu 	$s1, $s1, $t3			# Add this value in the sum ($s1)
			neg 	$t1, $t1				# Change the sign of the sign variable
			addu 	$t2, $t2, 1				# Increase loop counter

			blt 	$t2, $t0, det_loop		# if loop iterator < n continue

	end_det: 
		move 	$t3, $s1					# Store sum temporarily 

		jal 	popFromStack				# Pop the register $s1 from stack before returning 
		move 	$s1, $v0

		jal 	popFromStack				# Pop the register $t2 from stack before returning
		move 	$t2, $v0

		jal 	popFromStack				# Pop the register $t1 from stack before returning
		move 	$t1, $v0

		jal 	popFromStack				# Pop the register $s0 from stack before returning
		move 	$s0, $v0

		jal 	popFromStack				# Pop the register $t0 from stack before returning
		move 	$t0, $v0

		jal 	popFromStack				# Pop the register $ra from stack before returning
		move 	$ra, $v0

		move 	$v0, $t3					# Store the value of determinant (temporarily stored in $t3) in return value 
		jr 		$ra							# Return 
	 
	# Function that fills the temporary matrix with cofactor matrix
	getCoFactor: 
		move 	$t2, $a0					# $a0 = q	(Column to be excluded)	
		move 	$t0, $a1					# $a1 = n	
		move 	$s0, $a2					# $a2 = address of original matrix	
		move 	$s2, $a3					# $a3 = address of temp matrix 
			
		li 		$t6, 0						# i1, row counter of the temporary matrix	
		li 		$t7, 0						# j1, column counter of the temporary matrix	
		li 		$t8, 1						# i2, row counter of the original matrix
		
		subu 	$s6, $t0, 1					# Dimention of temporary matrix

		outer: 
			beq 	$t8, $t0, break_outer	# if all the rows are finished then break loop
			li 		$t9, 0					# j2, column counter of the original matrix
			li 		$t7, 0					# j1 - 0, after every row

			inner: 
				beq 	$t9, $t0, break_inner  	# Break loop if all the elements of a row are finished
				beq 	$t9, $t2, inc_col		# Skip the column q

				mul 	$s3, $t6, $s6      	 	# $s3 <-- width * i1
				add 	$s3, $s3, $t7       	# $s3 <-- width * i1 + j1
				sll 	$s3, $s3, 2         	# $s3 <-- 2^2 * (width * i1 + j1)
				add 	$s3, $s2, $s3       	# $s3 <-- base address + (2^2 * (width * i1 + j1))

				mul 	$s4, $t8, $t0       	# $s4 <-- width * i2
				add 	$s4, $s4, $t9       	# $s4 <-- width * i2+ j2	
				sll 	$s4, $s4, 2         	# $s4 <-- 2^2 * (width * i2 + j2)
				add 	$s4, $s0, $s4 			# $s4 <-- base address + (2^2 * (width * i2 + j2))

				lw 		$s5, 0($s4)          	# Store input number into array
				sw 		$s5, 0($s3)
		
				addu 	$t7, $t7, 1				# j1 += 1
				addu 	$t9, $t9, 1				# j2 += 1
				b 		inner					# Continue the loop


			inc_col: 
				addu 	$t9, $t9, 1				# j2 += 1
				b 		inner					# Continue the loop

			break_inner:
				addu 	$t6, $t6, 1				# i1 += 1
				addu 	$t8, $t8, 1				# i2 += 1
				b 		outer					# Jump back to outer loop 

		break_outer: 
			jr 		$ra							# Return 
	
	exit_code: 
        la      $a0, end_message               	# Printing thank you message
        li      $v0, 4
        syscall

        li      $v0, 10                        	# System call to exit the code
        syscall 