.data

    promptStart:    .asciiz "This program does A/B without using mult or div"
           getN:    .asciiz "Give number of BITS (N) : "
           getA:    .asciiz "Please enter the first number(dividend): "
           getB:    .asciiz "Please enter the second number(divisor): "

          space:    .asciiz " "

         result:    .asciiz "The quotient, using my program is: "
       quotient:    .asciiz " quotient : "
        divisor:    .asciiz " divisor : "
      remainder:    .asciiz " remainder : "
          error:    .asciiz " ***TOO BIG NUMBER PLEASE CHECK YOUR INPUT (INPUTS SHOULD NOT BE GREATER THAT 2^N***"

       endLine: .asciiz "\n"


###########################
# $s0 -> Dividend 32BIT
# $s1 -> Divisor lw 64BIT
# $s2 -> Divisor hw 64BIT
#
# $s3 -> Remainder lw 64BIT
# $s4 -> Remainder hw 64BIT
#
# $s5 -> Quotient 32BIT
#
#
#
#

.text

main:

# welcome message 
li $v0, 4
la $a0, promptStart
syscall

li $v0, 4
la $a0, endLine
syscall

######GETTING N BITS ######
li $v0, 4
la $a0, getN
syscall

li $v0, 5
syscall

move $t3, $v0

li $v0, 4
la $a0, endLine
syscall

#########################################

li $v0, 4
la $a0, endLine
syscall


li $v0, 4
la $a0, getA
syscall

# get divedend
li $v0, 5
syscall
# copy dividend 
move $s0, $v0

li $v0, 4
la $a0, getB
syscall

#get divisor

li $v0, 5
syscall
#copy divisor to hw register
move $s2, $v0


wlcome:



li $t4, 2
li $t5, 0
li $t6, 2
N_bit_to_dec:
####CALC N BITS -> DECIMAL####
##### here mult instruction used for calculation of N-BITS to DECIMAL
##### NOT USED FOR THE FINAL RESULT! ###########
beq $t5, $t3, MyDiv
mul $t6, $t6, $t4 
addi $t5, $t5, 1

j N_bit_to_dec

MyDiv:
#counter:
li $t1, 0
li $t2, 32


bgt $s0, $t6, err_exit
bgt $s2, $t6, err_exit



#initialize values
# copy dividend to remainder lw register

add $s3, $zero, $s0 #dividend in lw reg of remainder register ($s3)

li $s5, 0  # init Quotient to 0 (zero)

#First step
step_1:

######Stats Printing here #########

li $v0, 4
la $a0, quotient
syscall

li $v0, 1 
move $a0, $s5
syscall
li $v0, 4
la $a0, endLine
syscall

li $v0, 4
la $a0, divisor
syscall

li $v0, 1 
move $a0, $s2
syscall

li $v0, 4
la $a0, space
syscall


li $v0, 1 
move $a0, $s1
syscall

li $v0, 4
la $a0, endLine
syscall

li $v0, 4
la $a0, remainder
syscall

li $v0, 1 
move $a0, $s4
syscall

li $v0, 4
la $a0, space
syscall


li $v0, 1 
move $a0, $s3
syscall




###################################







subu $s3, $s1, $s3 # remainder_lw =- divisor_lw
subu $s4, $s2, $s4 # remainder_hw =- divisor_hw


bge $s3, $zero, step_2a
blt $s3, $zero, step_2b

step_2a:
#Shift the Quotient to left
#setting the new rightmost bit 1

sll $s5, $s5, 1
ori $s5, $s5, 1

jal step_3

step_2b:

#replace the origianl value

addu $s3, $s3, $s1 # remainder_lw += divisor_lw
addu $s4, $s4, $s2 # remainder_hw += divisor_hw

# shift left quotient by one 
# and set LSB to 0
sll $s5, $s5, 1
andi $s5, $s5, 0

step_3:
# shift Divisor right 1 BIT

# copy bits from hw to lw

sll $t0, $s2, 31
srl $s1, $s1, 1
srl $s2, $s2, 1
addu $s1, $s1, $t0

addi $t1, $t1, 1

beq $t1, $t2, done

jal step_1

done:


li $v0, 4
la $a0, endLine
syscall

li $v0, 4
la $a0, result
syscall


li $v0, 1
move $a0, $s5
syscall


li $v0, 10
syscall


err_exit:

li $v0, 4
la $a0, error
syscall

li $v0, 10
syscall