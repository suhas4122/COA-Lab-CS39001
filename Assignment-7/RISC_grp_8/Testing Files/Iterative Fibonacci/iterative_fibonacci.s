main:
    xor $1, $1      # $1 = 0 (previous)
    xor $2, $2      # $2 = 0 (current)
    xor $3, $3      # $3 = 0 (loop variable (i) )
    xor $4, $4      
    xor $5, $5
    addi $1, 1
    addi $2, 1
    addi $3, 2
    addi $4, 6

fib:
    comp $6, $4     # - n
    add $6, $3      # i - n
    bz $6, endfib

    addi $6, -1
    bz $6, endone

    add $1, $2
    xor $7, $7
    add $7, $1
    xor $1, $1
    add $1, $2
    xor $2, $2
    add $2, $7

    addi $3, 1
    b fib

endone:
    add $5, $1
    xor $8, $8
    addi $8, 1

endfib:
    add $5, $2
    xor $8, $8
    addi $8, 1

