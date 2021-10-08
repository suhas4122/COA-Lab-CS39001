.data

# output strings
input_msg1:     .asciiz "Enter the  positive integer: "
input_msg2:     .asciiz "Enter array: "
output_msg:     .asciiz "Output array: "
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
        move    $s0, $v0

        sll     $a0, $s0, 2 
        lw      $v0, ALLOC_MEMORY              
        syscall
        move    $s1, $v0

        la      $a0, input_msg2
        lw      $v0, PRINT_STRING_CODE
        syscall         

        readArray:
        li      $t0, 0           
        move    $t1, $s1  

        for_loop1:

            lw      $v0, READ_INT_CODE
            syscall
            sw      $v0, ($t1)           

            addi    $t0, $t0, 1   
            addi    $t1, $t1, 4    

            blt     $t0, $s0, for_loop1   

        printArray:
        li      $t0, 0           
        move    $t1, $s1     

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

            blt     $t0, $s0, for_loop   

            la      $a0, new_line    
            lw      $v0, PRINT_STRING_CODE          
            syscall           

        exit_:
            la      $a0, new_line
            lw      $v0, PRINT_STRING_CODE
            syscall
            lw      $v0, EXIT_CODE
            syscall
