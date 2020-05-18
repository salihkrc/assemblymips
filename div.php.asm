.data

#Function call of this function
#   
# div_php(A,B); returns C ----> div.php($f12,$f13)

.globl div.php
div.php:

jal cvt.php.s

mov.s $f1, $f0   # A in $f1 as PHP number

mov.s $f12, $f13 # transfer value of $f13 to $f12 to convert it to PHP number

jal cvt.php.s

mov.s $f2, $f0 # B in $f2 as PHP number

div.s $f0, $f1, $f2 # C = A / B || C in $f0

jr $ra