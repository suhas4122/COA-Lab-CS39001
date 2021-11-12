# ITERATIVE FIBONACCI CALCULATION
# SUHAS JAIN | 19CS30048
# MONAL PRASAD | 19CS30030

main:
    xor $1, $1      # $1 = 0 (previous element)
    xor $2, $2      # $2 = 0 (current element)
    xor $3, $3      # $3 = 0 (loop variable (i) )
    xor $4, $4      # $4 = 0 (n)
    xor $5, $5      # $5 = 0 (final answer)
    addi $1, 1      # $1 = 1 (first element)
    addi $2, 1      # $2 = 1 (second element)
    addi $3, 2      # i = 2 (as we already have 2 elements)
    addi $4, 6      # n = 6

fib:
    comp $6, $4     # $6 = - n
    add $6, $3      # $6 = i - n
    bz $6, endfib   # $6 = 0  ==> i = n, end loop 

    add $1, $2      # $1 = $1 + $2 
    xor $7, $7      # $7 = 0
    add $7, $1      # $7 = $1
    xor $1, $1      # $1 = 0
    add $1, $2      # $1 = $2
    xor $2, $2      # $2 = 0
    add $2, $7      # $2 = $7

    addi $3, 1      # i = i + 1
    b fib           # continue loop 

endfib:     
    add $5, $2      # Final asnwer = $2
    xor $8, $8      # $8 = 0 (completion flag)
    addi $8, 1      # $8 = 1

