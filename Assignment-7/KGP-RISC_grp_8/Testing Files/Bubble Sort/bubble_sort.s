# BUBBLE SORT OF 10 NUMBERS 
# SUHAS JAIN | 19CS30048
# MONAL PRASAD | 19CS30030

main:
    xor $20, $20        # $20 = 0 (base address)
    xor $21, $21        # $21 = 0 (n)
    addi $21, 10        # $21 = n = 10
    xor $8, $8          # $8 = 0 (outer loop variable (i))
    xor $9, $9          # $9 = 0 (inner loop variable (j))

fori:
    xor $10, $10        # label 20
    add $10, $8         # $10 = i
    comp $11, $21       # $11 = -n 
    add $10, $11        # $10 = i - n
    addi $10, 1         # $10 = i - (n - 1) = i - n + 1
    bz $10, exitfori    # if i = n-1, end outer loop 
    xor $9, $9          # j = 0

forj:
    xor $11, $11        # $11 = 0
    add $11, $9         # $11 = j
    add $11, $10        # $11 = j + i - n + 1
    bz $11, exitforj    # if j = n - i - 1, end inner loop 

    xor $12, $12        # $12 = 0
    add $12, $9         # $12 = j 
    shll $12, 2         # $12 = 4 * j
    add $12, $20        # $12 =  arr + 4 * j
    lw $13, 0($12)      # $13 = arr[j]

    xor $4, $4          # $4 = 0
    add $4, $12         # $4 = arr + 4 * j
    addi $12, 4         # $4 = arr + 4 * j + 4
    lw $14, 0($12)      # $14 = arr[j + 1]

    xor $5, $5          # $5 = 0
    add $5, $12         # $5 = arr + 4 * j
    comp $15, $14       # $5 = -arr[j+1]
    add $13, $15        # $13 = arr[j] - arr[j + 1]
    bltz $13, incj      # don't swap if arr[j] > arr[j + 1]
    bz $13, incj        # don't swap if arr[j] = arr[j + 1]
    bl swap             # swap otherwise 

incj:
    addi $9, 1          # j = j + 1
    b forj              # continue inner loop 

swap:
    lw $18, 0($4)       # $18 = arr[j]
    lw $19, 0($5)       # $19 = arr[j + 1]
    sw $18, 0($5)       # arr[j+1] = $18 (save in swpped location) 
    sw $19, 0($4)       # arr[j] = $19 (save in swpped location) 
    br $31

exitforj:
    addi $8, 1          # i = i + 1
    b fori              # continue inner loop

exitfori:
    xor $16, $16        # $16 = 0
    addi $16, 1         # $16 = 1 (flag indication completion of execution)
