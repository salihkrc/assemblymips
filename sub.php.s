.data

#Function call of this function
#   
# sub_php(A,B); returns C ----> sub.php($f12,$f13)
A: .float 3.0
B: .float 2.0

INF: .word 0x07F80000
LARGEST: .float 65504

msk: .word 0xFFFFE000
.text
.globl main
main:

l.s $f12, A
l.s $f13, B

jal cvt.php.s


mov.s $f1, $f0   # A in $f1 as PHP number

mov.s $f12, $f13 # transfer value of $f13 to $f12 to convert it to PHP number

jal cvt.php.s

mov.s $f2, $f0 # B in $f2 as PHP number

sub.s $f0, $f1, $f2 # C = A - B || C in $f0

li $v0, 10
syscall


cvt.php.s:

mfc1 $t0, $f12
l.s $f13, LARGEST
c.le.s $f12, $f13
bc1t normal
l.s $f0, INF

jr $ra

normal:

lw $t8, msk($zero)
mfc1 $t0, $f12
and $t0, $t0, $t8
mtc1 $t0, $f0
jr $ra