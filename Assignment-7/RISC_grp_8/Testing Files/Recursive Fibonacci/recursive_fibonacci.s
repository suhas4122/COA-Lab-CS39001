main:
	xor $29, $29 
	xor $1, $1   
	xor $4, $4  
	xor $3, $3 
	addi $4, 7
	add $3, $4
	bl fib
	addi $1, 1   

fib:
	addi $29, 12     
    sw $31, -12($29)  
	sw $4, -8($29)   
	compi $10, 2
	add $10, $4  
	bltz $10, endfib
	addi $4, -1
	bl fib
	sw $2, -4($29)
	lw $4, -8($29) 
	addi $4, -2
	bl fib
	lw $8, -4($29) 
	add $2, $8     
	b end

endfib:
	xor $2, $2
	add $2, $4 

end:
	lw $31 -12($29)
	addi $29, -12   
	br $31