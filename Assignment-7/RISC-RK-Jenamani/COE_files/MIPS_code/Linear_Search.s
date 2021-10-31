begin
lw $s0, 0($zero)
addi $s0, 1
lw $s1, 0($zero)
addi $s1, 9
comp $s2, $s1
lw $t0, 0($zero)
addi $t0, 5
sw $t0, 0($s0)
lw $t0, 0($zero)
addi $t0, 6
sw $t0, 1($s0)
lw $t0, 0($zero)
addi $t0, 8
sw $t0, 2($s0)
lw $t0, 0($zero)
addi $t0, 2
sw $t0, 3($s0)
lw $t0, 0($zero)
addi $t0, 1
sw $t0, 4($s0)
lw $t0, 0($zero)
addi $t0, 7
sw $t0, 5($s0)
lw $t0, 0($zero)
addi $t0, 4
sw $t0, 6($s0)
lw $t0, 0($zero)
addi $t0, 3
sw $t0, 7($s0)
lw $t0, 15($zero)
lw $t1, 0($zero)
addi $t1, 8 
lw $t2, 0($zero) 
add $t2, $s0 
lw $t4, 0($zero)
add $t4, $s2
add $t4, $t2
bns 13
lw $t3, 0($t2)
addi $t2, 1
lw $t5, 0($zero)
comp $t5, $t1
add $t5, $t3
bs -10
lw $t6, 0($zero)
comp $t6, $t3
add $t6, $t1
bs -14
lw $t0, 0($zero)
comp $t0, $s0
add $t0, $t2
end