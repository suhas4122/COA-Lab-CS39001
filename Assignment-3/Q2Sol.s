#    Assignment - 3
#    Problem  - 2 (Insertion sort of 10 numbers)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data 

# Declaration of output strings 
enter_message:
    .asciiz "*** FINDING Kth LARGEST NUMBER AND INSERTION SORT ***\n\n"

input_message1: 
    .asciiz "Enter ten integers to be sorted (press enter after each integer): \n"

input_message2:
    .asciiz "\nEnter the value of K (between 1 to 10): "

output_message1:
    .asciiz "\nTen integers in ascending order are: "

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

        jal     find_k_largest              # Calling the function to find Kth largest integer

    find_k_largest:
	    li      $a0, 10                     # Set count arg (length of array)
		la      $a1, array 		            # Load address of array in $a1 
        jal     sort_array
        jal     print_array

        # Loading the address of array into the memort and accessing the Kth element
        la      $a1, array 		
        addi    $s0, $s0, -10               # K = K - 10
        li      $t0, -1                     
        mul     $s0, $s0, $t0               # K = -K
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

        j       exit_code                   # Exiting the code

    # Printing the sorted array 
    print_array:
        # Loading address of array and initialising variables 				
        la      $a1, array 		 
        li      $t0, 0
        move    $t0, $a0	
        la      $a0, output_message1 	
        li      $v0, 4
        syscall

        print_loop: 
            # Check if loop has run 10 times 
            ble     $t0, $zero, return 	        
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
            j       print_loop 	

    return:
        jr      $ra				


    sort_array:
        # Loading variables passed in function in temporary memory 
        move    $t0  $a0
        move    $t1, $a1
        li      $t2, 1

        # Outer foe loop as mentioned in the pseudo-code 
        for_loop:
            la      $t1, array          # Loading array into temporary memory
            bge     $t2, $t0, return    # Checking loop condition (if j >= 10, then exit)
            addi    $t3, $t2, -1        # i = j - 1
            
            # Storing temp (arr[j]) in $t6
            sll     $t4, $t2, 2         # Calculating 4*j to access arr[j]
            add     $t6, $t1, $t4       # $t1 stores arr+4(j)
            lw      $t6, 0($t6)         # Loading arr[j]

            # Inner while loop as mentioned in the pseudo-code
            while_loop:
                blt     $t3, 0, end_while       # if i < 0 then exit while loop
                la      $t1, array              # Loading array into temporary memory 
                sll     $t4, $t3, 2             # Calculating 4*i to access arr[i]
                add     $t1, $t1, $t4           # $t1 stores arr+4(i)
                lw      $t5, 0($t1)             # Loading arr[i+1]
                bge     $t6, $t5, end_while     # Check if temp <= arr[i], if yes then exit
                sw      $t5, 4($t1)             # arr[i+1] = arr[i]
                addi    $t3, $t3, -1            # i = i - 1
                j       while_loop              # Continue the while loop 

        end_while:
            la      $t1, array              # Loading array into temporary memory 
            mul     $t4, $t3, 4             # Calculating 4*i to access arr[i]
            add     $t1, $t1, $t4           # $t1 stores arr+4*i
            sw      $t6, 4($t1)             # arr[i+1] = temp 
            addi    $t2, $t2, 1             # j = j + 1 ( increasing iterator of for loop )
            j       for_loop               # Continue the for loop


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