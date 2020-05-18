.data


array: .word -1, -2, 0, 10, 1, -1, 2, 3, 1, -1
nln: .asciiz "\n"

.text
.globl _start
_start:
li $t7, 0
li $t8, 0 # this is index 
li $t9, 10

read:

###### HERE SIMULATING THE CODE ########
beq $t7, $t9, EXIT

lw $t0, array($t8)

jal LPF

li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, nln
syscall


addi $t8, $t8, 4
addi $t7, $t7, 1

j read



LPF: #lpf ( in -> $t0);

li $t1, 16 # constant 16

##### w_old is $s0 ##### initialized to zero

#creating v_old

mul $t2, $s0, $t1
sub $t4, $t2, $s0  # v_old is in $t4

div $t4, $t1

mflo $t4 

# w = in + v_old

add $t5, $t0, $t4

# out = w + w_old

add $t6, $t5, $s0

# w_old = w

add $s0, $zero, $t5

# return out 
# out in register $t6

jr $ra

EXIT:

li $v0, 10
syscall