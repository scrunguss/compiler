.globl main
.text
main:
# Creating new frame
addiu $sp, $sp -12
sw $ra, 4($sp)
li $t1, 12
sw $t1, 0($sp)
# End of creating frame
#saving global frame
# Saving frame
# End of saving frame
jal _main
#print integer result
move $a0 $v1
li $v0 1
syscall
li $a0 10
li $v0 11
syscall
li $v0 10
syscall
_main:
# Creating new frame
addiu $sp, $sp -12
sw $ra, 4($sp)
li $t1, 12
sw $t1, 0($sp)
# End of creating frame

# Saving frame
# End of saving frame

li $a0,1
li $a1,10
jal fact
# Restoring frame
lw $ra 4($sp)
# End of restoring frame

addiu $sp, $sp 12
jr $ra

fact:
# Creating new frame
addiu $sp, $sp -28
sw $ra, 4($sp)
li $t1, 28
sw $t1, 0($sp)
# End of creating frame

move $t0 $a0
move $t1 $a1
li $t2,0
bne $t1 $t2 L1
move $v1 $t0
addiu $sp, $sp 28
jr $ra
L1:
move $t0,$t0
move $t1,$t1
mult $t0,$t1
mflo $t2

move $t1,$t1
li $t0,1
sub $t3,$t1,$t0

# Saving frame
sw $t3 12($sp)
sw $t2 16($sp)
# End of saving frame

move $a0,$t2
move $a1,$t3
jal fact
# Restoring frame
lw $t3  12($sp)
lw $t2  16($sp)
lw $ra 4($sp)
# End of restoring frame

addiu $sp, $sp 28
jr $ra
jr $ra
