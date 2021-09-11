#    Assignment - 3
#    Problem  - 2 (Insertion sort of 10 numbers)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data
.data 

# Seclaration of output strings 
input_message1: 
    .asciiz "Enter ten integers to be sorted (press enter after each integer): \n"

input_message2:
    .asciiz "\nEnter the value of K (between 1 to 10): "

output_message1:
    .asciiz "\nTen integers in decending order are: "

output_message2:
    .asciiz "\n\nKth largest integer: "

white_space:
    .asciiz " "

new_line:
    .asciiz "\n"

end_message:
    .asciiz "\n\n*********** THANK YOU *********** \n\n"

error_message:
    .asciiz "K should be between 1 and 10"

# Allocating space for the array
.align 2
array: .space 40

.text

.globl main 

	main:
		# Printing message before taking array as input
		la      $a0, input_message1
		li      $v0, 4
		syscall

        # Initialising $t1 and loading adress of array in $t3
		li      $t1, 1  				
		la      $t3, array			

        # Loop to take input from the user
		input_Loop: 			
	        li      $v0, 5 			        # Taking integer as input
	        syscall
	        move    $t0, $v0 		        # Moving input value to $t0
	        addi    $t1, $t1, 1 	        # Increasing $t1(i) by 1
	        sw      $t0, ($t3) 		        # Storing entered value at array[i]
	        addi    $t3, $t3, 4 		    # Increasing address of $t3 to access next address
	        bne     $t1, 11, input_Loop     # Get user input 10 times

        # Printing message before taking integer (k) as input
        la      $a0, input_message2
        li      $v0, 4
        syscall

        # Taking the integer as input (k)
        li      $v0, 5
        syscall
        move    $s0, $v0   

        # Sanity check of k (k should be <= 10 and >= 0)
        blt     $s0, 0, invalid_input
        bgt     $s0, 10, invalid_input

	    li      $a0, 10                     # Set count arg (length of array)
		la      $a1, array 		            # Load address of array in $a1 
		li      $t0, 0
		j       insertion_sort
        
        # Printing the sorted array 
		print_loop:
            # Loading address of array and initialising variables 				
			la      $a1, array 		 
			li      $t0, 0
			move    $t0, $a0	
			la      $a0, output_message1 	
			li      $v0, 4
			syscall

            print_loop_helper: 
                # Check if loop has run 10 times 
                ble     $t0, $zero, print_kth_largest 	        
                lw      $a0, ($a1)           # Load word at current address 
                li      $v0, 1 				        
                syscall         		     # Print word
                
                # Increment current word address by 4 and decrease $t0
                addi    $a1, $a1, 4 		        
                sub     $t0, $t0, 1    	        

                # Print white space
                la      $a0, white_space     		       
                li      $v0, 4
                syscall 

                # Continue the loop 
                j       print_loop_helper 					

    insertion_sort:				
        beq     $t0, $a0, print_loop 	    # Check if loop has run 10 times
        move    $t1, $t0 				    # $t1 = $t0
        move    $t2, $a1				    # Assigning current address to $t2 (storing current maximum)
        move    $t3, $a1                    # Assigning current address to $t2 (storing current value)

		loop: 			
			beq     $t1, $a0, swap_pos 		# If inner loop has reached last position

			lw      $t5, ($t2) 				# Load current max
			lw      $t6, ($t3) 				# Load current value

			bgt     $t5, $t6 , store 		# If t5 > t6 store

			addi    $t2, $t2, 4 			# Increase t2
			addi    $t1, $t1, 1 			# Increase inner loop counter 
			j       loop

		store:
			move    $t3, $t2 				# Store address of numbers to be exchanged
			
			addi    $t2, $t2, 4 			# Increase t2
			addi    $t1, $t1, 1 			# Increase innerloop
			j loop
							
		swap_pos: 
			lw      $t5, ($a1) 			    # $t5 = ($a1)
			lw      $t6, ($t3)			    # $t6 = ($t3) 
			sw      $t6, ($a1) 				# ($a1) = $t6
			sw      $t5, ($t3) 				# ($t3) = $t5
			addi    $t0, $t0, 1			    # Increase outer loop
			addi    $a1, $a1, 4			    # Increase a1 by 4
			j insertion_sort

    print_kth_largest:
        # Loading the address of array into the memort and accessing the Kth element
        la      $a1, array 		
        addi    $s0, $s0, -1                # Decrement K by 1 (0 based indexing)
        sll     $s0, $s0, 2                 # K = K*4
        add     $a1, $a1, $s0               # Move address of array by K

        # Printing output message before printing kth largest integer
        la      $a0, output_message2
        li      $v0, 4
        syscall

        # Printing Kth largest integer
        lw      $a0, ($a1)                  # Load word at current address 
        li      $v0, 1 				        
        syscall  

        j       exit_code

	invalid_input:
        # Printing the error message
        la      $a0, error_message
        li      $v0, 4
        syscall

        # Exit the code
        j       exit_code
    
    exit_code:
        # Printing thank you message 
        la      $a0, end_message
        li      $v0, 4
        syscall
        
        # System call to exit the code
        li      $v0, 10
        syscall 