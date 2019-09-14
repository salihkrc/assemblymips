.data

prompt0: .asciiz "This Program prints Given number XYZ like : X*10^P + ... \n"
prompt1: .asciiz "Give XYZ:\n"

star: .asciiz "*"
powe: .asciiz "^"
plus: .asciiz "+"
tenn: .asciiz "10"
buffer: .space 10
nwline: .asciiz "\n"

.text
.globl main
main:

li $t1, 10
li $t2, 1
li $t5, 1

li $v0, 4
la $a0, nwline
syscall 


li $v0, 4
la $a0, prompt0
syscall 

li $v0, 5
syscall

move $t0, $v0

jal div_store

div_store:


div $t0, $t1
mfhi $t3
mflo $t0

sb $t3, buffer($t2)
beqz $t0, print
addi $t2, $t2, 1
addi $t6, $t6, 1


j div_store

print:



lb $t4, buffer($t5)

beqz $t4, main

li $v0, 1
move $a0, $t4
syscall

li $v0, 4
la $a0, star
syscall

li $v0, 4
la $a0, tenn
syscall

li $v0, 4
la $a0, powe
syscall

li $v0, 1
move $a0, $t6
syscall



li $v0, 4
la $a0, plus
syscall


addi $t5, $t5, 1
addi $t6, $t6, -1




j print



