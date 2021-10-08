.data

# output strings
input_msg1:     .asciiz "Enter  the  first  positive integer: "
input_msg2:     .asciiz "Enter  the  second  positive integer: "
output_msg:     .asciiz "GCD of the two integers is: "
error_msg:      .asciiz "Invalid Input"
new_line:       .asciiz "\n"
white_space:    .asciiz " "

READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10
ALLOC_MEMORY:        .word 9

.text
.globl main
    main:
        # READING AN INTEGER AFTER PRINTING A MESSAGE 
        la      $a0, input_msg1
        lw      $v0, PRINT_STRING_CODE
        syscall
        lw      $v0, READ_INT_CODE
        syscall
        move    $t0, $v0

        # PRINTING AN INTEGER AFTER PRINTING A MESSAGE 
        la      $a0, output_msg
        lw      $v0, PRINT_STRING_CODE
        syscall
        move    $a0, $t0
        lw      $v0, PRINT_INT_CODE
        syscall

    invalid_:
        la      $a0, error_msg
        lw      $v0, PRINT_STRING_CODE
        syscall
        j       exit_

    exit_:
        la      $a0, new_line
        lw      $v0, PRINT_STRING_CODE
        syscall
        lw      $v0, EXIT_CODE
        syscall

    printArray:
        li      $t0, 0           
        move    $t1, $a0      

        for_loop:
            lw      $t2, ($t1)       

            move    $a0, $t2     
            lw      $v0, PRINT_INT_CODE          
            syscall            

            addi    $t0, $t0, 1   
            addi    $t1, $t1, 4   

            la      $a0, white_space     
            lw      $v0, PRINT_STRING_CODE           
            syscall           

            blt     $t0, $a1, for_loop   

            la      $a0, new_line    
            lw      $v0, PRINT_STRING_CODE          
            syscall            

            jr      $ra            


    printMatrix:
        move    $t0, $a0            
        move    $t1, $a1
        move    $t2, $a2

        li      $t3, 0
        li      $t4, 0

        mul     $t5, $t0, $t1
    
        print_loop:
            lw      $a0, 0($t2)   
            li      $v0, PRINT_INT_CODE
            syscall
            
            addi    $t2, -4
            addi    $t3, 1
            addi    $t4, 1

            la      $a0, white_space
            lw      $v0, PRINT_STRING_CODE
            syscall
            
            beq     $t3, $t5, end_print_loop

            beq     $t4, $t1, print_newline
            
            j       print_loop

            end_print_loop: 
                la      $a0, new_line
                lw      $v0, PRINT_STRING_CODE
                syscall
                jr      $ra 

            print_newline:
                la      $a0, new_line
                lw      $v0, PRINT_STRING_CODE
                syscall

                li      $t4, 0              
                j       print_loop 
    
    init_stack:
        addi    $sp, $sp, -4
        sw      $fp, 0($sp)
        move    $fp, $sp
        jr      $ra

    pushToStack:
        addi    $sp, $sp, -4
        sw      $a0, 0($sp)
        jr      $ra

    popFromStack:
	    lw      $v0, 0($sp)
	    addi    $sp, $sp, 4
	    jr	    $ra

    mallocInStack:
        mul     $a0, $a0, 4     
        sub     $sp, $sp, $a0  
        move    $v0, $sp    
        jr      $ra


        li      $t1, 0           
    input_loop:           
        addi    $t1, $t1, 1    

        lw      $v0, READ_INT_CODE
        syscall         
        move    $t2, $v0  
        sw      $t2, 0($t0)    

        add     $t0, $t0, 4   
        blt     $t1, 10, input_loop

        sll     $a0, $a0, 2           
        la      $v0, ALLOC_MEMORY              
        syscall
        move    $s2, $v0            
            