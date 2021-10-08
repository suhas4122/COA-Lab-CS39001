#    LAB TEST 1
#    Problem  - 2
#    Semester Aut - 2021 
#    Name : Suhas Jain 
#    Roll : 19CS30048
.data 

input_msg:      .asciiz "Input Array (10 numbers): "
output_msg:     .asciiz "Output Max-Heap: "
Printee:        .asciiz "\n\nNext i: "
new_line:       .asciiz "\n"
white_space:    .asciiz " "

READ_INT_CODE:       .word 5
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10
ALLOC_MEMORY:        .word 9

array: .space 40

.text
.globl main
    main:
        la      $a0, input_msg
        lw      $v0, PRINT_STRING_CODE
        syscall

        la      $t0, array  
        li      $t1, 0           

        input_loop:           
            addi    $t1, $t1, 1    

            lw      $v0, READ_INT_CODE
            syscall         
            move    $t2, $v0  
            sw      $t2, 0($t0)    

            add     $t0, $t0, 4   
            blt     $t1, 10, input_loop

        jal     Max_heap

        la      $a0, output_msg
        lw      $v0, PRINT_STRING_CODE
        syscall
    
        la      $a0, array
        jal     printArray
    
    exit_:
        la      $a0, new_line
        lw      $v0, PRINT_STRING_CODE
        syscall
        lw      $v0, EXIT_CODE
        syscall
    
    Max_heap:

        addi    $sp, $sp, -4  
        sw      $ra, 0($sp)

        li      $s1, 4
        main_for:
            move    $a0, $s1
            jal     Heapify

            # move    $a0, $s1 
            # lw      $v0, PRINT_INT_CODE
            # syscall

            addi    $s1, -1
            bgez    $s1, main_for
        
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4

        jr      $ra
    
    Heapify:
        addi    $sp, $sp, -4  
        sw      $ra, 0($sp)

        move    $t0, $a0
        move    $t1, $a0
        mul     $t2, $a0, 2
        addi    $t2, 1
        mul     $t3, $a0, 2
        addi    $t3, 2
        la      $s0, array

        sll     $t4, $t1, 2
        add     $t5, $s0, $t4
        lw      $t5, 0($t5)

        sll     $t4, $t2, 2
        add     $t6, $s0, $t4
        lw      $t6, 0($t6)

        sll     $t4, $t3, 2
        add     $t7, $s0, $t4
        lw      $t7, 0($t7)

        L1:
            bge     $t2, 10, L2
            ble     $t6, $t5, L2
            move    $t1, $t2

            sll     $t4, $t1, 2
            add     $t5, $s0, $t4
            lw      $t5, 0($t5)

        L2:
            bge     $t3, 10, L3
            ble     $t7, $t5, L3
            move    $t1, $t3

            sll     $t4, $t1, 2
            add     $t5, $s0, $t4
            lw      $t5, 0($t5)

        L3: 
            beq     $t0, $t1, end_heapify 

            sll     $t4, $t0, 2
            add     $a0, $s0, $t4

            sll     $t4, $t1, 2
            add     $a1, $s0, $t4

            jal     SWAP

            move    $a0, $t1
            jal     Heapify

    end_heapify:
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra

    SWAP:
        lw      $t8, 0($a0)       # temp1 = a
        lw      $t9, 0($a1)       # temp2 = b
        sw      $t8, 0($a1)       # b = temp1
        sw      $t9, 0($a0)       # a = temp2
        jr      $ra 

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

            blt     $t0, 10, for_loop   

            la      $a0, new_line    
            lw      $v0, PRINT_STRING_CODE          
            syscall            

            jr      $ra       
