#    MIPS TEST 1 06.10.21
#    Question  - 2 (Max heapify an array)
#    Semester Aut - 2021 
#    Name : Monal Prasad
#    Roll No. : 19CS30030

.data 
#  Declaring output strings
welcome_msg:
    .asciiz "-----CONVERTING AN ARRAY INTO A MAX HEAP---- \n\n"

input_prompt1:
    .asciiz "Enter an array of 10 numbers: \n"

output_msg1:
    .asciiz "Max Heap: \n"

new_line:
    .asciiz "\n"

end_msg:
    .asciiz "\n\n ----------------THANK YOU-------------\n\n"

array: .space 40
# to store the input array

.text
.globl main
    main:
        # Printing welcome message at start
        li      $v0, 4
        la      $a0, welcome_msg
        syscall
        
        # Printing message before taking array  as input
        li      $v0, 4
        la      $a0, input_prompt1
        syscall      

        la      $t0, array  
        li      $t1, 0           

        loop1:           
            addi    $t1, $t1, 1    

            lw      $v0, 5
            syscall    

            move    $t2, $v0  
            sw      $t2, 0($t0)    

            add     $t0, $t0, 4   
            blt     $t1, 10, loop1      # continue the loop ofr 1 iterations

        jal     heapify
        la      $a0, output_msg1
        lw      $v0, 4
        syscall
    
        la      $a0, array
        # jal     printFunc

        exit:
            # Printing the message before exiting the code
            la      $a0, end_msg
            li      $v0, 4
            syscall
            
            # System call to exit the code
            li      $v0, 10
            syscall   

        heapify: 
            addi    $sp, $sp, -4  
            sw      $ra, 0($sp)
            li      $s1, 4

            loop2:
                move    $a0, $s1
                #jal     heapify_temp

                addi    $s1, -1
                bgez    $s1, loop2
            lw      $ra, 0($sp)
            addi    $sp, $sp, 4

            jr      $ra

        swap:
        lw      $t1, 0($a1)       # assign b to $t2
        lw      $t0, 0($a0)       # assign a to $t1
        sw      $t0, 0($a1)       # b now stores $t1
        sw      $t1, 0($a0)       # a now stores $t2
        jr      $ra 

        