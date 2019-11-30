###########  Sum of array Elements ####################
###########  Author:               ####################
###########  Sali Kadir Chousein   ####################
###########  sdi1200044@di.uoa.gr  ####################

.data

array : .word 1, 2, 5, 8, 20, 21, 98, 75
msg1: .asciiz "Hello, Welcome to the Summation of aray!\n"
msg2: .asciiz "Sum of array is:\n"
msg3: .asciiz "Summing the array....\n"
.text
.globl main
main:

li $v0, 4
la $a0, msg1
syscall

li $v0, 4
la $a0, msg3
syscall

li $t0, 0
li $t1, 0
li $t2, 8
li $t3, 0
li $t4, 0

adding:

lw $t3, array($t0) #get data from array
addu $t1, $t1, $t3 # add data to Register $t1

addi $t0, $t0, 4 # increment index of array

addi $t4, $t4, 1
blt $t4, $t2, adding
bgt $t4, $t2, print_sum

print_sum:

li $v0, 1
move $a0, $t1
syscall

#Exit

li $v0, 10
syscall


