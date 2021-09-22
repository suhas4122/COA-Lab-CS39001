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
	        li      $v0, 5 			        # Taking integer as input
	        syscall
	        move    $t0, $v0 		        # Moving input value to $t0
	        addi    $t1, $t1, 1 	        	# Increasing $t1(i) by 1
	        sw      $t0, ($t3) 		        # Storing entered value at array[i]
	        addi    $t3, $t3, 4 		    	# Increasing address of $t3 to access next address
	        bne     $t1, 11, input_Loop     	# Get user input 10 times

        la      $a0, input_message2
		li      $v0, 4
		syscall

        li      $v0, 5 			            	# Taking integer to be searched (key)  as input
	    syscall
        move    $a0, $v0
        jal     pushToStack

        # Calling function recursive sort to sort the array 
        la      $a0, array                  		# First argument = array address
        addi    $a1, $zero, 0               		# Second argument = start index
        addi    $a2, $zero, 9               		# Third argument = end index
        jal     recursive_sort

        la      $a0, array                  		# First argument = array address
        addi    $a1, $zero, 10              		# Second argument = number of elements in the array
        jal     printArray

        la      $a0, array                  		# First argument = array address
        addi    $a1, $zero, 0               		# Second argument = start index
        addi    $a2, $zero, 9               		# Third argument = end index
        lw      $a3, 0($sp)

        jal     recursive_search			# calls recursive_search

        move    $t0, $v0				# stores return value of recursive_search in $t0
        li      $t1, -1					# stores -1 in $t1
        
        jal     popFromStack				# gets value of key
        move    $a0, $v0
        li      $v0, 1
        syscall						# prints value of key

        beq     $t0, $t1, fail				# if value returned by recursive_search equals -1, key was not found
        j       success 				# else key was found in array
             
        fail:
            la      $a0, not_found			# printing failure message
            li      $v0, 4
            syscall
            j       exit_code				# control jumps to exit_code block

        success:
            la      $a0, found				# printing success message if number is found
            li      $v0, 4
            syscall

            move    $a0, $t0				# printing the position of the key in the array
            li      $v0, 1
            syscall

        j       exit_code				# control jumps to exit_code block

	#---------HELPER FUNCTIONS-------------------	
	# Initialise the stack ($sp and $fp pointers)
    initStack:
        addi    $sp, $sp, -4                		# Give 4 bytes to the stack to store the frame pointer
        sw      $fp, 0($sp)                 		# Store the old frame pointer
        move    $fp, $sp                    		# Set frame pointer as stack pointer 
        jr      $ra                        	 	# Return 

    # Function to push an element to a stack 
    pushToStack:
        addi    $sp, $sp, -4                		# Give 4 bytes to the stack to store the value
        sw      $a0, 0($sp)                 		# Store the value 
        jr      $ra                        		# Return 

    popFromStack:
	lw      $v0, 0($sp)         			# Store the value 
	addi    $sp, $sp, 4         			# Give 4 bytes to the stack to store the value
        jr      $ra                 			# Return 

    # Function to swap two elements of an array 
    SWAP:
        move    $t0, $a0                    		# Loading argumen1 into temporary register
        move    $t1, $a1                    		# Loading argumen2 into temporary register
        lw      $t2, 0($t0)                 		# Extracting value from address 
        lw      $t3, 0($t1)                 		# Extracting value from address 
        sw      $t2, 0($t1)                 		# Saving back the swapped value
        sw      $t3, 0($t0)                		# Saving back the swapped value 
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
            lw      $a0, 0($t0)              		# Load word at current address 
            li      $v0, 1 				        
            syscall                         		# Print word
            
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
            la      $a0, new_line     		       
            li      $v0, 4
            syscall

            jr      $ra				

    recursive_sort:
        j       push_to_stack

    outer_while:
        blt     $s1, $s2, inner_while1

        j       restore_stack

        inner_while1:            
            lw      $t0, 4($sp)        
            mul     $t2, $t0, 4       
            addu    $t2, $t2, $s0
            lw      $t3, 0($t2)
            
            lw      $t0, 0($sp)
            
            mul     $t2, $s1, 4        
            addu    $t2, $t2, $s0       
            lw      $t4, 0($t2)

            blt     $t3, $t4, inner_while2   
            ble     $t0, $s1, inner_while2

            addu    $s1, 1 

            j       inner_while1
        
        inner_while2:
            lw      $t0, 4($sp) 

            mul     $t2, $t0, 4        
            addu    $t2, $t2, $s0      
            lw      $t3, 0($t2)
            
            mul     $t2, $s2, 4         
            addu    $t2, $t2, $s0     
            lw      $t4, 0($t2)         

            bge     $t0, $s2, check_if
            bgt     $t3, $t4, check_if 

            subu    $s2, 1            
        
            j       inner_while2

        check_if:
            bge     $s1, $s2, if_satisfied        
            j       continue_while

                if_satisfied:
                    lw      $t0, 4($sp) 
                    mul     $a0, $t0, 4          
                    addu    $a0, $a0, $s0       
                    mul     $a1, $s2, 4         
                    addu    $a1, $a1, $s0      
                    jal     SWAP                

                    lw      $a0, 16($sp)           
                    lw      $a1, 4($sp)        
                    subu    $a2, $s2, 1        
                    jal     recursive_sort      

                    lw      $a0, 16($sp)            
                    addu    $a1, $s2, 1        
                    lw      $a2, 0($sp)       
                    jal     recursive_sort

                    j       restore_stack      

        continue_while:
            mul     $a0, $s1, 4          
            addu    $a0, $a0, $s0       
            mul     $a1, $s2, 4        
            addu    $a1, $a1, $s0           
            jal     SWAP 

            j outer_while

    initialise_variables:
        la      $s0, array       
        add     $s1, $a1, $zero      
        add     $s2, $a2, $zero

        j       outer_while

    push_to_stack:
        add     $a0, $ra, $zero      
        jal     pushToStack

        add     $a0, $s0, $zero      
        jal     pushToStack

        add     $a0, $s1, $zero      
        jal     pushToStack

        add     $a0, $s2, $zero      
        jal     pushToStack

        add     $a0, $a1, $zero      
        jal     pushToStack

        add     $a0, $a2, $zero      
        jal     pushToStack

        j       initialise_variables
    
    sort_return:
        jr      $ra

    restore_stack:
        lw      $ra, 20($sp)
        lw      $s0, 16($sp)
        lw      $s1, 12($sp)
        lw      $s2, 8($sp)
        addu    $sp, $sp, 24

        j       sort_return

    
    recursive_search:
        move    $t0, $a0				# stores the sorted array A
        move    $t1, $a1				# stores the value of start
        move    $t2, $a2				# stores the value of end
        move    $t3, $a3				# stores the value of key

        move    $a0, $ra
        jal     pushToStack
	
        bgt     $t1, $t2, search_fail			# if start>end jump to search_fail

        sub     $t4, $t2, $t1				# stores value of (end - start) in $t4
        li      $t5, 3					# stores 3 in $t5
        div     $t4, $t5
        mflo    $t4					# stores (end - start)/3 in $t4
        sub     $t5, $t2, $t4				# stores value of mid2
        add     $t4, $t1, $t4				# stores value of mid1

        sll     $t6, $t4, 2				# stores value of mid1*4
        add     $t6, $t0, $t6				# stores position of A[mid1]
        lw      $t6, 0($t6)				# stores A[mid1]

        sll     $t7, $t5, 2				# stores value of mid2*4
        add     $t7, $t0, $t7				# stores position of A[mid2]
        lw      $t7, 0($t7)				# stores A[mid2]

        beq     $t3, $t6, if_1				# if key is found at mid1
        beq     $t3, $t7, if_2				# if key is found at mid2
        blt     $t3, $t6, if_3				# if key < A[mid1]---> search in left subarray
        bgt     $t3, $t7, if_4				# if key > A[mid2] ---> search in right subarray
        j       else					# else search in the center subarray
	
	# if key is found at mid1
    if_1:
        move    $v0, $t4				# stores mid1 in register
        j       return_search				# calls return_search to return mid1
	
	# if key is found at mid2
    if_2:
        move    $v0, $t5				# stores mid2 in register
        j       return_search				# calls return_search to return mid2

	# if key < A[mid1]---> search in left subarray
    if_3:
        subu    $t4, $t4, 1				# mid1 = mid1 - 1
        move    $a0, $t0				# stores the array A for recursive call
        move    $a1, $t1				# stores the value of start
        move    $a2, $t4				# stores the value of end = mid1-1
        move    $a3, $t3				# stores the value of key
        jal     recursive_search			# calls the function in the left subarray
        j       return_search				# jump to return_search block

	# if key > A[mid2] ---> search in right subarray
    if_4:
        addu    $t5, $t5, 1				# mid2 = mid2 + 1
        move    $a0, $t0				# stores the array A for recursive call
        move    $a1, $t5				# stores the value of start = mid2+1
        move    $a2, $t2				# stores the value of end
        move    $a3, $t3				# stores the value of key
        jal     recursive_search			# calls the function in the right subarray
        j       return_search				# jump to return_search block
	
	# if A[mid1] < key < A[mid2] ---> seearch in center subarray
    else:
        addu    $t4, $t4, 1				# mid1 = mid1 + 1
        subu    $t5, $t5, 1				# mid2 = mid2 - 1	
        move    $a0, $t0				# stores the array A for recursive call
        move    $a1, $t4				# stores the value of start = mid1+1
        move    $a2, $t5				# stores the value of end = mid2-1
        move    $a3, $t3				# stores the value of key
        jal     recursive_search			# calls the function in the center subarray
        j       return_search				# jump to return_search block

    search_fail:					# called when start>end
        jal     popFromStack				# calls helper function 
        move    $ra, $v0				 
        li      $v0, -1					# load -1 in register $v0
        jr      $ra					# return -1 to caller function
    
    return_search:
        move    $t0, $v0 				# store index of key in $t0
        jal     popFromStack				# calls helper function
        move    $ra, $v0
        move    $v0, $t0 				# load index of key in $v0
        jr      $ra					# return index to caller function

    exit_code:
        # Printing thank you message 
        la      $a0, end_message
        li      $v0, 4
        syscall

        # System call to exit the code
        li      $v0, 10
        syscall 
