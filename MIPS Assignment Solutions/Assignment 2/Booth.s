.data
    read_multiplicand:   .asciiz "Enter the 16-bit signed multiplicand : "
    read_multiplier:     .asciiz "Enter the 16-bit signed multiplier : "
    print_prod:          .asciiz "The product value of the two numbers entered is "
    new_line:            .asciiz "\n"
    error_msg:           .asciiz "ERROR!! The number entered is not in SIGNED 16 bit range.\n"


READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10

.text
.globl main
    main:
        # multiplicand printing and reading
        lw $v0, PRINT_STRING_CODE
        la $a0, read_multiplicand
        syscall

        lw $v0, READ_INT_CODE
        syscall
        move $s0, $v0

        #Sanity checking for multiplicand
        addi $t0, $zero, 32767
        addi $t1, $zero, -32768

        bgt $s0, $t0, error
        blt $s0, $t1, error

        # multiplier printing and reading
        lw $v0, PRINT_STRING_CODE
        la $a0, read_multiplier
        syscall

        lw $v0, READ_INT_CODE
        syscall
        move $s1, $v0

        #Sanity checking for multiplier
        bgt $s1, $t0, error
        blt $s1, $t1, error

        # multiplication function call
        move $a0, $s0
        move $a1, $s1
        jal seq_booth_mult
        
        #return value
        move $s2, $v0

        # printing the outputs
        lw $v0, PRINT_STRING_CODE
        la $a0, print_prod
        syscall

        lw $v0, PRINT_INT_CODE
        move $a0, $s2
        syscall

        lw $v0, PRINT_STRING_CODE
        la $a0, new_line
        syscall

        # program closure
        j exit


    seq_booth_mult:

        # The higher and lower 16 bits of product are evaluated seperately.
        # The final product is stored in $t1.
        addi $t5, $zero, 0x00        # counter = 0
        addi $t6, $zero, 0x10        # itertion limit
        addi $t2, $zero, 0x00        # reset the extra bit.
        addi $t0, $zero, 0x00        # zero high
        # copy the multiplier to lower 16 bits of the product register
        addi $t1, $a1, 0x00
        addi $t6, $t6, 0x10
        loop:
	        # higher 16 bit lsb of product 
            andi $t4, $t0, 0x01
            # lower 16 bit lsb of product
            andi $t3, $t1, 0x01
            
            # check whether the operation is addition or subtraction

            # case 00 or 11; do nothing
            xor $t7, $t3, $t2
            beq $t7, $zero, next_step

            # case 10; 
            beq $t2, $zero, subtraction

            # case 01;
            add $t0, $t0, $a0     # Add the multiplicand to the left half of the product
            j next_step
           
            subtraction:

                    sub $t0, $t0, $a0    # Subtract the multiplicand from the left half of the product
                    j next_step
                    
            next_step:
            	
                	andi $t4, $t0, 0x01  # LSB of left half of the product register
                	andi $t3, $t1, 0x01  # LSB of right half(multiplier) of the product
                
                    sra $t0, $t0, 0x01    # sign extended right shift for the higher 16 bits of product register
                    srl $t1, $t1, 0x01    # logical shift right on lower half of product register

                    # store lsb
                    add $t2, $t3, $zero     # low (copy low's lsb to the extra bit)
                    sll $t4, $t4, 0x1f      # high (copy the lsb from high to low)
                    add $t1, $t1, $t4       
  
            check_iter:
               
                    # check the iteration condition
                    addi $t5, $t5, 0x01
                    slt $t8, $t5, $t6
                    bne $t8, $zero, loop

        return_back:
            move $v0, $t1       #return value is stored in $t1 is moved to $v0 
            jr $ra

    exit:
        lw $v0, PRINT_STRING_CODE           # new line
        la $a0, new_line
        syscall

	    lw $v0, EXIT_CODE	       # exit code
	    syscall

    error:

         lw $v0, PRINT_STRING_CODE           # print_string
         la $a0, error_msg   # load string address
         syscall

         lw $v0, EXIT_CODE          # exit
         syscall
             
