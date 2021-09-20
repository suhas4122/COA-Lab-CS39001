.data

enterN: .asciiz " Enter the order of the square matrix whose determinant is to be found\n"

enterSeed: .asciiz "Enter some positive integer for the value of the for the seed s\n"

printDet: .asciiz "Finally the  determinant is : "

sp: .asciiz " "

line: .asciiz "\n"


printFirst: .asciiz "print first\n"
invoc: .asciiz "The matrix passed on this invocation is:\n"
invoDet: .asciiz "The determinant value returned in this invocation is:\n" 
.text

.globl main




main:	
# Set up return address and stack pointer 
	
subu $sp, $sp, 32
	
sw $ra, 28($sp)
	
sw $fp, 24($sp)
	

# Read n
	
li $v0, 4
    
la $a0,enterN

syscall
	
li $v0, 5

syscall
	
sw $v0, 20($sp)		# Save n


	
# Read seed value
	
li $v0, 4
    
la $a0,enterSeed
	
syscall
	
li $v0, 5
	
syscall	
					# t0 =n , t1= s, t2=330, t3=i, t4=j
	
sw $v0, 16($sp)				# s0 - array start

		
lw $t1, 16($sp)		# Load seed value into t1
	
addu $fp, $sp, 32

li $t0, 10	
mul $a0, $t0, $t0   # Allocate space for 2d array
	
sll $a0, $a0, 2		# Since each is an integer of 4 bytes
	
	
# Dynamically allocate the array
	
li $v0, 9
	
syscall
	
move $s0, $v0	# Get starting address of the array
lw $t0, 20($sp)  # Load n into t0

	
	
li $t2, 1




init_row:li $t3, 0               # initialize outer-loop counter to 0



loop_outer:bge $t3, $t0, end_loop_outer
	
li $t4, 0               # initialize inner-loop counter to 0



loop_inner:bge $t4, $t0, end_loop_inner
	
mul $t5, $t3, 10       # $t5 <-- width * i
	
add $t5, $t5, $t4       # $t5 <-- width * i + j
	
sll $t5, $t5, 2         # $t5 <-- 2^2 * (width * i + j)
	
add $t5, $s0, $t5       # $t5 <-- base address + (2^2 * (width * i + j))
	
	
mul $t1, $t1, $t2
	
addu $t1, $t1, 100
	
rem $t1, $t1, 101	
sw $t1, 0($t5)          # store input number into array
	
	
addiu $t4, $t4, 1       # increment inner-loop counter
	
b loop_inner    # branch unconditionally back to beginning of the inner loop



end_loop_inner:addiu $t3, $t3, 1       # increment outer-loop counter

	b loop_outer    # branch unconditionally back to beginning of the outer loop



end_loop_outer: li $v0, 4
		la $a0, invoc
		syscall
		
		
		move $a1, $t0
		
		move $a0, $s0

		li $s1, 0	# To find D
		#li $t1, 1	# To store sign	
		jal detBase

		
move $s1, $v0


		li $v0, 4
		
		la $a0, printDet
		
		syscall
		
		
		li $v0, 1
		
		move $a0, $s1
		
		syscall

	
		
		li $v0, 10
		
		syscall			
  

		
sqMatPrint: move $t0, $a0
	
	move $s0, $a1
	
	li $t3, 0



outer_loop: bge $t3, $t0, outer_loop_end
	
	li $t4, 0



inner_loop: bge $t4, $t0, inner_loop_end
	
mul $t5, $t3, 10       # $t5 <-- width * i
	
add $t5, $t5, $t4       # $t5 <-- width * i + j
	
sll $t5, $t5, 2         # $t5 <-- 2^2 * (width * i + j)
	
add $t5, $s0, $t5       # $t5 <-- base address + (2^2 * (width * i + j))
	
	
lw $t2, 0($t5)          # store input number into array
	
	
li $v0, 1
	
move $a0, $t2
	
syscall
	
	
li $v0, 4
	
la $a0, sp
	
syscall
	
	
addiu $t4, $t4, 1       # increment inner-loop counter
	
b inner_loop



inner_loop_end:addiu $t3, $t3, 1       # increment outer-loop counter
	
li $v0, 4
	
la $a0, line
	
syscall
	
b outer_loop    # branch unconditionally back to beginning of the outer loop



outer_loop_end: jr $ra


detBase:li $s1, 0
	li $t1, 1	# To compare with 1
	bgt $a1, $t1, findDet

	move $s2, $a0

	li $v0, 1
	lw $a0, 0($s2)
	syscall
	
	li $v0, 4
	la $a0, line
	syscall

	lw $v0, 0($s2)
	jr $ra

findDet: subu $sp, $sp, 32
	sw $ra, 28($sp)
	sw $fp, 24($sp)
	addu $fp, $sp, 32
	
	move $t0, $a1
	move $s0, $a0
	sw $s0, 20($sp)
	sw $t0, 16($sp)
	#sw $t1, 8($sp)
	#sw $s1, 12($sp)
	move $a0, $t0
	move $a1, $s0
	jal sqMatPrint
	#sw $ra, 28($sp)
	
	#subu $t0, $t0, 1
	li $t0, 10
	mul $a0, $t0, $t0
	sll $a0, $a0, 2
	li $v0, 9
	syscall
	move $s2, $v0
	lw $t0, 16($sp)
	#addu $t0, $t0, 1
	
	li $t1, 1
	li $t2, 0	# Loop counter
	
	

loop:	beq $t2, $t0, end_det
	sw $t1, 12($sp)
	sw $t2, 8($sp)
	sw $s1, 4($sp)
	move $a0, $t2
	move $a1, $t0
	move $a2, $s0
	move $a3, $s2
	jal getCoFactor
	
	li $v0, 4
	la $a0, invoc
	syscall
	
	subu $t0, $t0, 1

	#move $s7, $s0
	#move $a1, $s2
	#move $a0, $t0
	#jal sqMatPrint
	#move $s0, $s7
	#sw $ra, 28($sp)

	move $a0, $s2
	move $a1, $t0
	jal detBase
	move $t4, $v0
	
	#move $a0, $t0
	#move $a1, $s2
	#jal sqMatPrint

	li $v0, 4
	la $a0, invoDet
	syscall

	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, line
	syscall
	
	lw $t0, 16($sp)
	lw $s0, 20($sp)
	lw $t2, 8($sp)
	lw $t1, 12($sp)
	lw $s1, 4($sp)

	li $t5, 0
	addu $t5, $t5, $t2
	sll $t5, $t5, 2
	add $t5, $s0, $t5
	lw $t3, 0($t5)	# m[0][i]
	mul $t3, $t3, $t1
	
	mul $t3, $t3, $t4
	addu $s1, $s1, $t3
	neg $t1, $t1
	addu $t2, $t2, 1
	b loop

end_det: lw $ra, 28($sp)
	lw $fp, 24($sp)
	move $v0, $s1
	addu $sp, $sp, 32
	jr $ra
	 


getCoFactor: 
		
move $t2, $a0	# a0=i	#q
		
move $t0, $a1	# a1=n	#n
		
move $s0, $a2	# a2 = address of original matrix
		
move $s2, $a3	# a3 = address of temp matrix 
		
		
li $t6, 0	#i
		
li $t7, 0	#j
		
li $t8, 0	#row


#lw $a0, 0($s0)
#li $v0, 1
#syscall


outer: beq $t8, $t0, break_outer
	
li $t9, 0	#col



inner: beq $t9, $t0, break_inner
	
	
beqz $t8, inc_col	
beq $t9, $t2, inc_col

	 
	
mul $s3, $t6, 10       # $t5 <-- width * i
	
add $s3, $s3, $t7       # $t5 <-- width * i + j
	
sll $s3, $s3, 2         # $t5 <-- 2^2 * (width * i + j)
	
add $s3, $s2, $s3       # $t5 <-- base address + (2^2 * (width * i + j))

	
	
mul $s4, $t8, 10       # $t5 <-- width * i
	
add $s4, $s4, $t9       # $t5 <-- width * i + j

#add $s4, $s4, $t0	
sll $s4, $s4, 2         # $t5 <-- 2^2 * (width * i + j)
	
add $s4, $s0, $s4 
	
	
lw $s5, 0($s4)          # store input number into array
	
sw $s5, 0($s3)


	
#li $v0, 1
	
#move $a0, $s5
	
#syscall

	
	
#li $v0, 4
	
#la $a0, sp
	
#syscall


	
addu $t7, $t7, 1
	
subu $s6, $t0, 1
	
beq $t7, $s6, reinit
	
addu $t9, $t9, 1
	
b inner



reinit: li $t7, 0
		
addu $t6, $t6, 1
		
addu $t9, $t9, 1
		
b inner


inc_col: addu $t9, $t9, 1
	b inner


break_inner: addu $t8, $t8, 1
		
#li $v0, 4
		
#la $a0, line
		
#syscall
		
b outer



break_outer: jr $ra