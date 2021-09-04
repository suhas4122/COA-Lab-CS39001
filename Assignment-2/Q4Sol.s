#    Assignment - 2
#    Problem  - 4 (Checking if the number is perfect or not)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data

# declaration of output strings 
input_message:
    .asciiz "Enter a positive integer: "

perfect_msg:
    .asciiz "Entered number is a perfect number\n\n"

not_perfect_msg:
    .asciiz "Entered number is not a perfect number\n\n"

error_msg:
    .asciiz "Argument should be an integer greater than 0\n\n"


.text

.globl main

# main program
# program variables
#  n	:   $s0
#  sum	:	$s1 
#  i	:	$t1 

	main: 
		# Printing message before taking integer as input	
		la		$a0, input_message
		li		$v0, 4                  
		syscall

		# Taking the integer as input
		li		$v0, 5
		syscall
		move 	$s0, $v0

		# Sanity check of first integer (n should be >= 1)
		blt		$s0, 1, invalid_input

		# initialise variables for sum and loop variable i
		li      $s1, 0           		# sum = 0
		li		$t1, 1					# i=1
		
		# loop till i<n
		loop:
			# exit loop if 	i>=n		
			bge     $t1, $s0, end_loop

			# calculate n%i
			rem		$t2, $s0, $t1

			# check if remainder is not equal to 0
			bne		$t2, $zero, increment_loop	

			# sum = sum + i
			add		$s1, $s1, $t1
	
			increment_loop:
				addi 	$t1, $t1, 1
				j	loop
		
		# checks if number is not perfect
		end_loop:
			bne $s0, $s1, is_not_perfect

	# Printing the message when number is perfect
	is_perfect:
		la      $a0, perfect_msg
		li      $v0, 4
		syscall

		# Exit the code
		j       exit_code

	# Printing the message when number is not perfect
	is_not_perfect:
		la      $a0, not_perfect_msg
		li      $v0, 4
		syscall

		# Exit the code
		j       exit_code
		
	invalid_input:
	# Printing the error message
		la		$a0, error_msg
		li		$v0, 4
		syscall

	exit_code:
		# System call to exit the code
		li		$v0, 10
		syscall

