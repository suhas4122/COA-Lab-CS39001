#    Assignment - 3
#    Problem  - 1 (Booth's multiplication algorithm)
#    Semester Aut - 2021 
#    Group - 8
#    Name_1 : Suhas Jain 
#    Roll_1 : 19CS30048
#    Name_2 : Monal Prasad
#    Roll_2 : 19CS30030

.data

# Declaration of output strings 
enter_message:
    .asciiz "*** BOOTH'S MULTIPLICATION OF TWO 16-BIT SIGNED NUMBERS *** \n\n"

input_message1: 
    .asciiz "Enter first number: "

input_message2:
    .asciiz "\nEnter second number: "

output_message:
    .asciiz "\nThe product of both numbers is: "

white_space:
    .asciiz " "

new_line:
    .asciiz "\n"

end_message:
    .asciiz "\n\n*********** THANK YOU *********** \n\n"

error_message:
    .asciiz "Number should be a signed 16 bit integer"

.text
.globl main 

    main:
        # Printing welcome message when the program starts
        li      $v0, 4
        la      $a0, enter_message
        syscall
        
        # Printing message before taking first number (n1) as input
        li      $v0, 4
        la      $a0, input_message1
        syscall

        # Taking first number (n1) as input in $s0 
        li      $v0, 5
        syscall
        move    $s0, $v0

        # Sanity check of n1
        move    $a0, $s0
        jal     check_overflow
        beq     $v0, 0, overflow_error

        # Printing message before taking second number as input
        li      $v0, 4
        la      $a0, input_message2
        syscall

        # Taking first number (n2) as input in $s1 
        li      $v0, 5
        syscall
        move    $s1, $v0

        # Sanity check of n2
        move    $a0, $s1
        jal     check_overflow
        beq     $v0, 0, overflow_error

        # Storing n1 and n2 in appropriate registers and calling multiply_booth 
        move    $a0, $s0    
        move    $a1, $s1
        jal     multiply_booth

        # Storing return value (multiplied quantity) in a temporary register 
        move    $t0, $v0         

        # Printing output string 
        li      $v0, 4          
        la      $a0, output_message      
        syscall

        # Printing the final number after multiplication
        li      $v0, 1        
        move    $a0, $t0
        syscall

        # Exit the code 
        j exit

    check_overflow:
        # Check if the number is within the range of 16 bit signed 
        move    $t0, $s0
        bgt     $t0, 32767, return0     
        ble     $t0, -32769, return0

        # Return 1 if both the checks are passed
        li      $v0, 1
        j       $ra 

        return0:
            # Return 0 if even one of the check is failed
            li      $v0, 0
            j       $ra

    overflow_error:
        # Printing the error message if overflow is detected       
        li      $v0, 4
        la      $a0, error_message
        syscall

        # Exiting the code 
        j       exit

    multiply_booth:
        move    $t0, $a0                    # Loading n1 into temporary register 
        move    $t1, $a1                    # Loading n2 into temporary register
        addi    $s0, $zero, 16              # Initialising Count as 16
        addi    $t2, $zero, 0               # Initiling Product
        add     $t2, $t2, $t1               # Product = n2 (Multiplier)
        addi    $s2, $zero, 0               # Initialising previous bit
        sll     $t0, $t0, 16                # Left shift n1 (Multiplicand) by 16

        loop:
            andi    $t3, $t2, 1             # Store current bit in $t3
            beq     $t3, $s2, update        # if $t3 == $s2 (11 or 00), then jump to update
            beq     $t3, $zero, addition    # if $t3 == 0 (01), then add
            j       subtraction             # else (10), jump to subtraction 

            addition:
                add     $t2, $t2, $t0       # Sum = Sum + Multiplicand 
                j       update              # Jump to update 

            subtraction:
                sub     $t2, $t2, $t0       # Sum = Sum - Multiplicand
                j       update              # Jump to update 

            update:
                move    $s2, $t3            # Set previous bit as cuttent bit 
                sra     $t2, $t2, 1         # Right arithmetic shift   
                addi    $s0, $s0, -1        # Count = Count - 1 (as given in flow chart)
                beq     $s0, 0, end         # Exit loop if Count == 0 (as given in flow chart)
                j       loop                # Otherwise continue the loop

        end:
            # Check if n2 was negative
            blt     $t1, $zero, set_neg
            j       return 
            
        set_neg:
            # Set the value as negative
            addi    $t2, $t2, 1
            j       return

        return: 
            move    $v0, $t2
            jr      $ra

    exit:
        # Printing the message before exiting the code
        la      $a0, end_message
        li      $v0, 4
        syscall
        
        # System call to exit the code
        li      $v0, 10
        syscall 