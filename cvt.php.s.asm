.data

INF: .word 0x07F80000
LARGEST: .float 65504

.globl cvt.php.s
cvt.php.s:

mfc1 $t0, $f12
l.s $f13, LARGEST
c.le.s $f12, $f13
bc1t normal
l.s $f0, INF

jr $ra

normal:

mfc1 $t0, $f12
andi $t0, $t0, 0xFFFFE000
mtc1 $t0, $f0
jr $ra