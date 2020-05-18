.data

INF: .word 0x07F80000
z: .float 0.0


.globl cvt.h.php
cvt.h.php:



li $s0, 255 #X
li $s1, 31  #Y



mfc1 $t0, $f12

sll $t3, $t0, 1 # checking X 8 bit
srl $t4, $t3, 23 # X in $t4 


srl $t5, $t4, 3 # Y in $t5 // Through out 3 LSB

beq $t4, $s0, inf_yes

beq $t4, $zero, zero_yes

NORMAL: 

andi $t7, $t0, 0xFC000000 # GET SIGN BIT AND 5 BITS for Y

srl $t8, $t7, 3 

andi $t9, $t0, 0x007FE000 # GET W BITS

or $s0, $t8, $t9

srl $s1, $s0, 13

move $v0, $s1

jr $ra

zero_yes:

l.s $f0, z

mfc1 $v0, $f0 #output in $v0

jr $ra


inf_yes:


l.s $f0, INF


mfc1 $v0, $f0 #output in $v0

jr $ra


