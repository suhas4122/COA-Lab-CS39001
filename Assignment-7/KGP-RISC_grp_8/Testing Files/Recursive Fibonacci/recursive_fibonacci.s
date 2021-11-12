# RECURSIVE FIBONACCI CALCULATION
# SUHAS JAIN | 19CS30048
# MONAL PRASAD | 19CS30030

main:
	xor $29, $29 		# $29 = sp = 0 (stack pointer)
	xor $1, $1   		# finish flag set to 0
	xor $4, $4   		# $4 = n = 0 
	xor $3, $3   		# $3 = n = 0 (won't change)
	addi $4, 6		# $4 = n = 6
	add $3, $4   		# $3 = n = 6
	bl fib			# branch and link to fib 
	addi $1, 1   		# flag set to 1 on completion

fib:
	addi $29, 12      	# sp = sp + 12 (make space in stack)
    	sw $31, -12($29)  	# store return address on stack
	sw $4, -8($29)   	# store n onto stack
	compi $10, 2 		# $10 = -2
	add $10, $4  		# $10 = n-2
	bltz $10, endfib 	# if n-2 < 0, jump to endfib
	addi $4, -1 		# $4 = n-1
	bl fib			# branch and link to fib
	sw $2, -4($29) 		# store fib(n-1) in memory

	lw $4, -8($29) 		# load n from memory into $4
	addi $4, -2		# $4 = n - 2
	bl fib			# branch and link to fib
	lw $8, -4($29) 		# load fib(n-1) into $t0
	add $2, $8     		# $2  = fib(n-1) + fib(n-2) (return value)
	b end

endfib:
	xor $2, $2 		# $2 = 0
	add $2, $4 		# $2 = n, if n = 0 or n = 1

end:
	lw $31 -12($29)		# $31 = return adress
	addi $29, -12   	# restore stack pointer
	br $31				
