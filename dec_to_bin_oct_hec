.data
bufferhex: .space 10
bufferoct: .space 10
bufferbin: .space 10
prompt0: .asciiz "Enter number in DEC: \n" 
prompt1: .asciiz "Given number in BIN: \n"
prompt2: .asciiz "Given number in OCT: \n"
prompt3: .asciiz "Given number in HEX: \n"
nwline: .asciiz "\n"

ten: .asciiz "A"
eleven: .asciiz "B"
twelve: .asciiz "C"
thirteen: .asciiz "D"
fourteen: .asciiz "E"
fifteen: .asciiz "F"


.text
.globl main


##############THIS PROGRAM CONVERTS INTEGER TO BIN / OCT / HEX ################################################

main:


li $v0, 4
la $a0, nwline
syscall

li $t1, 1 # index for bufferbin
li $t2, 2
li $t5, 1 # index for bufferoct
li $t6, 8
li $t7, 1 #index for bufferhex
li $t8, 16



li $v0, 4
la $a0, prompt0
syscall

li $v0, 5
syscall

move $t0, $v0

jal copyoct  
jal copyhex
jal loop

copyoct:

add $s0, $zero, $t0

jr $ra

copyhex:

add $s6, $zero, $t0

jr $ra

loop:
div $t0, $t2
mflo $t0
mfhi $t3
sb $t3, bufferbin($t1)
addi $t1, $t1, 1

beqz $t0, prom



j loop

print:

lb $t4, bufferbin($t1)

move $a0, $t4
li $v0, 1
syscall

addi $t1, $t1, -1
beqz $t1, calcoct
j print


prom:

li $v0, 4
la $a0, prompt1
syscall

jal print

calcoct:

div $s0, $t6
mflo $s0
mfhi $s4
sb $s4, bufferoct($t5)
addi $t5, $t5, 1

beqz $s0, promoct

j calcoct

promoct:

li $v0, 4
la $a0, nwline
syscall

li $v0, 4
la $a0,prompt2
syscall


jal printoct

printoct:

lb $s2, bufferoct($t5)

move $a0, $s2
li $v0, 1
syscall

addi $t5, $t5, -1
beqz $t5, calchex

j printoct

calchex:

div $s6, $t8
mflo $s6
mfhi $s7
sb $s7, bufferhex($t7)
addi $t7, $t7, 1

beqz $s6, promhex

j calchex

promhex:

li $v0, 4
la $a0, nwline
syscall

li $v0, 4
la $a0, prompt3
syscall

jal clearreg

clearreg:

li $t0, 10
li $t1, 11
li $t2, 12
li $t3, 13
li $s0, 14
li $s4, 15
li $s2, 0

jal printhex


printhex:

beqz $t7, main
lb $s2, bufferhex($t7)

beq $s2, $t0, printten
beq $s2, $t1, printeleven
beq $s2, $t2, printtwelve
beq $s2, $t3, printthirteen
beq $s2, $s0, printfourteen
beq $s2, $s4, printfifteen

move $a0, $s2
li $v0, 1
syscall

addi $t7, $t7, -1


j printhex


printten:

li $v0, 4
la $a0, ten
syscall
addi $t7, $t7, -1
j printhex



printeleven:

li $v0, 4
la $a0, eleven
syscall

addi $t7, $t7, -1
j printhex



printtwelve:

li $v0, 4
la $a0, twelve
syscall

addi $t7, $t7, -1
j printhex


printthirteen:

li $v0, 4
la $a0, thirteen
syscall


addi $t7, $t7, -1
j printhex

printfourteen:

li $v0, 4
la $a0, fourteen
syscall


addi $t7, $t7, -1
j printhex

printfifteen:

li $v0, 4
la $a0, fifteen
syscall

addi $t7, $t7, -1
j printhex

exit:

li $v0, 10
syscall
