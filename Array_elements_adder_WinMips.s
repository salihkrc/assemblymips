#        
#
#
#    THIS PROGRAM CALCULATES ADDITION OF ARRAY ELLEMENTS ( K[i]+K[i+1]...K[i+n] )           #
#    AUTHOR: SALI KADIR CHOUSEIN                                                            #
#    AM    : 1115201200044                                                                  #
#    e-mail: sdi1200044@di.uoa.gr                                                           #
#    GITHUB: https://github.com/salihkrc/assemblymips                                       #
#                                                                                           #
#    IMPLEMENTATION TECHNICS USED:                                                          #
#    ARRAY K[i] SPLITTED IN 7 TO REDUCE THE EXECUTION TIME                                  #
#    LOOP UNROLLING                                                                         #
#    RUNNING METHOD : FORWARDING            ||            1521 CYCLES, CPI: 1.003           #
#############################################################################################


.data

array: .word 101,33,125,24,7,68,14,87,51,32,75,21,31,125,19,92,103,15,88,59,67,125,122,103,122,80,95,90,30,26,39,115,9,83,71,64,22,66,54,84,126,119,127,58,38,79
       .word 127,108,5,28,117,83,93,48,127,56,56,71,94,51,86,115,108,83,47,32,116,89,5,57,11,54,84,120,38,39,114,31,70,78
       .word 76,78,113,55,24,112,79,16,44,55,4,53,113,74,127,31,55,45,106,49,48,63,54,5,6,31,123,27,26,43,13,34,29,43,31
       .word 43,56,125,117,28,47,47,1,41,43,109,53,13,49,3,70,39,96,116,52,91,89,124,57,82,100,113,63,100,19,91,9,50
       .word 94,19,95,53,45,126,81,102,127,86,107,69,26,27,8,1,75,119,14,80,11,61,34,92,105,79,118,80,83,100,81
       .word 114,89,74,103,58,125,41,96,77,9,19,49,69,52,119,71,97,125,86,94,51,91,59,15,42,26,87,70,100,65
       .word 111,109,14,65,72,85,107,78,26,82,80,59,17,11,47,1,4,119,27,69,127,110,123,42,89,26,103,114,121,70,29,54
       .word 60,61,35,96,44,94,92,122,39,8,119,63,104,93,114,30,77,60,108,106,64,8,66,23,95,126,5,21,104,56,126,2,3,49,80
       .word 109,75,105,24,3,103,35,11,116,48,51,119,17,67,10,121,55,107,51,38,67,15,6,72,118,49,99,17,82,112,110,34,112,72,59,29
       .word 34,47,119,30,46,115,57,26,8,5,37,83,1,96,101,53,112,51,65,70,7,60,74,72,42,98,38,93,29,44
       .word 83,54,82,110,65,72,119,29,44,35,93,12,76,20,11,13,31,113,88,95,21,16,32,14,40,101,104,92
       .word 46,59,81,97,72,7,39,55,72,34,100,83,91,22,24,75,123,62,96,63,31,115,28,111,77,116,54,89,90,84,81,3
       .word 69,116,16,100,89,5,19,75,50,83,86,25,126,16,13,75,44,9,4,116,20,17,42,119,4,99,116,126,31,52,123,77
       .word 4,67,81,6,79,32,16,88,16,109,87,78,124,63,64,65,9,12,33,106,89,24,118,37,77,2,27,77,51,56,98,7,25
       .word 57,44,67,108,113,70,71,66,24,17,68,2,113,83,22,91,22,122,7,51,47,74,39,65,22,110,118,127,123,25,78,1,3
       ;.word 
        

msg2: .asciiz "Sum of array is:\n"

CONTROL: .word 0x10000
DATA:    .word 0x10008

;len: .word 80
fir: .word 640
sec: .word 1280
thi: .word 1920
fou: .word 2560
fif: .word 3200
six: .word 3840


.text

lwu r8,DATA(r0)    ; get data
lwu r9,CONTROL(r0) ; and control registers       

;ld r18, len($zero)
ld r25, fir($zero)
ld r6, sec($zero)
ld r7, thi($zero)
ld r2, fou($zero)
ld r24, fif($zero)
ld r30, six($zero)

adder:

########## LOOP BODY ############### 
#daddi r18, r18,-1 # dicrement counter for loop


####### THIS LOOP IS IMPLEMENTED WITH LOOP-UNROLLING TECHNIC WITH 80 INTERNAL REPEATS #############

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29


                      

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-20 # dicrement counter for loop

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

;daddi r18, r18,-40 # dicrement counter for loop

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29



#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-20 # dicrement counter for loop

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

#daddi r18, r18,-1 # dicrement counter for loop


ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29

;daddi r18, r18,-40 # dicrement counter for loop

ld r10, array(r12) # get number from address 0
daddi r12, r12, 8 



lw r15, array(r25) # get number from adress 640
daddi r25, r25, 8


lw r16, array(r6) # get number from address 1280
daddi r6, r6, 8


lw r17, array(r7) # get number from address 1920
daddi r7, r7, 8

lw r5, array(r2) # get number from address 2560
daddi r2, r2, 8

lw r29, array(r24) # get number from address 3200
daddi r24, r24, 8

dadd r13, r13, r10
dadd r13, r13, r15 
dadd r13, r13, r16
dadd r13, r13, r17
dadd r13, r13, r5
dadd r13, r13, r29
###############CONDITIONS ##############

#daddi r20, $zero, 20


####CALCULATE REMAINING PART #######
calc_remain:

#daddi r20, r20, -1
####### THIS LOOP IS IMPLEMENTED WITH LOOP-UNROLLING TECHNIC WITH 20 INTERNAL REPEATS #############
lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15

#daddi r20, r20, -1

lw r15, array(r30)
daddi r30, r30, 8

dadd r13, r13, r15



#bne r20, $zero, calc_remain
#beq r20, $zero, print_sum
#####END OF LOOP BODY#########
print_sum:
######PRINT MESSAGE#######
daddi r11,r0,4     ; set for string output  

daddi r1,r0,msg2  ; get msg1 address
sd r1,(r8)         ; print title
sd r11,(r9)

#######PRINT RESULT##########
daddi r11,r0, 1     ; set for int output  

dadd r1,r0,r13  ; get int 
sd r1,(r8)         ; print
sd r11,(r9)

halt
