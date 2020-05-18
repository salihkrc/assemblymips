.data

const: .float 0.5  # 0.5
w_old: .float 0.0  # w_old
nln: .asciiz "\n"

array: .word  -5, 3, 2, 7, -9, 20, 10, 3, 2, 1

.text
.globl _start
_start:

init:
l.s $f1, const # 0.5 in $f1 register (floating point)
l.s $f2, w_old # w_old in $f2 register (floating point)

###counter j is $t7 ####

li $t7, 0
li $t8, 0 # this is index 
li $t9, 10

read:

###### HERE SIMULATING THE CODE ########
beq $t7, $t9, EXIT

lw $t0, array($t8)

jal HPF

li $v0, 1
move $a0, $t1
syscall

li $v0, 4
la $a0, nln
syscall


addi $t8, $t8, 4
addi $t7, $t7, 1

j read


##############################################

HPF:

#int in is $t0 for this hpf(in) function
#int out is $t1 -------<>---------------

mul.s $f3, $f1, $f2 # 0.5 * w_old

cvt.w.s $f4, $f3 # convert float result to integer

mfc1 $t2, $f4  # transfer the result to $t2 register

add $t3, $t0, $t2  # w = in + 0.5 * w_old || w is in $t3

cvt.w.s $f5, $f2 # convert w_old to integer 

mfc1 $t4, $f5    # tranfer

sub $t1, $t3, $t4 # out = w - w_old

add $t4, $zero, $t3 # w_old = w 

###convert #t4 to float again to use it ######

mtc1 $t4, $f2
cvt.s.w $f2, $f2

jr $ra

EXIT:

li $v0, 10
syscall