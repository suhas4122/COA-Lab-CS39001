#    LAB TEST 1
#    Problem  - 1
#    Semester Aut - 2021 
#    Name : Suhas Jain 
#    Roll : 19CS30048

.data 
inp1:       .asciiz "String (max length: 20) : "
inp2:       .asciiz "Shift Value: "
inp3:       .asciiz "Enter 'E' or 'D': "    
out1:       .asciiz "Upper case string: "
out2:       .asciiz "Cipher: "

new_line:   .asciiz "\n"
new_line1:   .asciiz ""


READ_INT_CODE:       .word 5
READ_STRING_CODE:    .word 8
PRINT_INT_CODE:      .word 1
PRINT_STRING_CODE:   .word 4
EXIT_CODE:           .word 10
ALLOC_MEMORY:        .word 9

buffer: .space 20 
choice: .space 1

.text
.globl main
    main:        
        lw      $v0, PRINT_STRING_CODE
        la      $a0, inp1
        syscall      

        lw      $v0, READ_STRING_CODE     
        la      $a0, buffer  
        li      $a1, 20     
        syscall

        jal     to_upper_case

        lw      $v0, PRINT_STRING_CODE
        la      $a0, new_line
        syscall

        la      $a0, out1     
        lw      $v0, PRINT_STRING_CODE
        syscall
        
        lw      $v0, PRINT_STRING_CODE
        la      $a0, buffer
        syscall

        lw      $v0, PRINT_STRING_CODE
        la      $a0, new_line
        syscall

        lw      $v0, PRINT_STRING_CODE
        la      $a0, inp2
        syscall  

        lw      $v0, READ_INT_CODE
	    syscall
	    move    $s0, $v0	

        lw      $v0, PRINT_STRING_CODE
        la      $a0, new_line
        syscall

        lw      $v0, PRINT_STRING_CODE
        la      $a0, inp3
        syscall      

        lw      $v0, READ_STRING_CODE
        la      $a0, choice  
        li      $a1, 5
        syscall

        li      $t1, 1
        lb      $s1, choice($zero)    

        beq     $s1, 'E', encrypt
        beq     $s1, 'D', encrypt

        encrypt:
            move    $a0, $s0
            move    $t0, $zero

            for_loop1:
                lb      $t1, buffer($t0)
                beq     $t1, 0, exit_code
                
                lw      $v0, PRINT_STRING_CODE
                la      $a0, new_line1
                syscall

                subu    $t2, $t1, 'A'		
                addu    $t2, $t2, $s0
                li      $t3, 26
                div     $t2, $t3
                mfhi    $t2				
                
                lw      $v0, PRINT_STRING_CODE
                la      $a0, new_line1
                syscall

                addu    $t1, $t2, 'A'
                sb      $t1, buffer($t0)
            
                addu    $t0, $t0, 1
                j       for_loop1
                
        decrypt: 
            move    $a0, $s0
            move    $t0, $zero

            for_loop2:
                lb      $t1, buffer($t0)
                beq     $t1, 0, exit_code
                
                lw      $v0, PRINT_STRING_CODE
                la      $a0, new_line1
                syscall

                subu    $t2, $t1, 'A'	
                subu    $t2, $t2, $s0
                bge     $t2, $zero, decry
                addu    $t2, $t2, 26
                
            decry:
                li      $t3, 26
                div     $t2, $t3
                mfhi    $t2	

                lw      $v0, PRINT_STRING_CODE
                la      $a0, new_line1
                syscall
                                
                addu    $t1, $t2, 'A'
                sb      $t1, buffer($t0)
            
                addu    $t0, $t0, 1
		        j       for_loop2


        exit_code:

            lw      $v0, PRINT_STRING_CODE
            la      $a0, new_line
            syscall

            lw      $v0, PRINT_STRING_CODE
            la      $a0, new_line1
            syscall

            lw      $v0, PRINT_STRING_CODE
            la      $a0, out2 
            syscall
            
            lw      $v0, PRINT_STRING_CODE
            la      $a0, buffer
            syscall

            lw      $v0, PRINT_STRING_CODE
            la      $a0, new_line
            syscall

            lw      $v0, PRINT_STRING_CODE
            la      $a0, new_line
            syscall

            li      $v0, 10
            syscall 
     

    to_upper_case:
        li      $t2, 0

        for_loop3:
            lb      $t3, buffer($t2)
            beq     $t3, 0, return_upper
            blt     $t3, 'a', upper
            bgt     $t3, 'z', upper
            subu    $t3, $t3, 32
            sb      $t3, buffer($t2)

        upper: 
            addu    $t2, $t2, 1
            j       for_loop3
            
        return_upper:
            jr      $ra  