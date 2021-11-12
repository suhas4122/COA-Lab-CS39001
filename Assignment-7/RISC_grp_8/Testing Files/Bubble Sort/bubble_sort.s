main:
    xor $20, $20  
    xor $21, $21
    addi $21, 10    
    xor $8, $8     
    xor $9, $9     
    
fori:
    xor $10, $10    
    add $10, $8
    comp $11, $21
    add $10, $11
    addi $10, 1    
    bz $10, exitfori
    xor $9, $9

forj:
    xor $11, $11    
    add $11, $9
    add $11, $10
    bz $11, exitforj   
    xor $12, $12
    add $12, $9
    shll $12, 2    
    add $12, $20    
    lw $13, 0($12)   
    xor $4, $4
    add $4, $12
    addi $12, 4
    lw $14, 0($12)   
    xor $5, $5
    add $5, $12
    comp $15, $14
    add $13, $15       
    bltz $13, incj      
    bz $13, incj
    bl swap

incj:
    addi $9, 1     
    b forj

swap:
    lw $18, 0($4)   
    lw $19, 0($5)
    sw $18, 0($5)
    sw $19, 0($4)
    br $31

exitforj:
    addi $8, 1      
    b fori

exitfori:
    xor $16, $16       
    addi $16, 1