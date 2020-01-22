        


;    THIS PROGRAM MAKES MATRIX MULT,(X = X + Y * Z ) AND DETECTS POSITIVE, NEGATIVE AND ZERO ELEMENTS IN ARRAYS X,Y,Z
;    AUTHOR: SALI KADIR CHOUSEIN                                                            
;    AM    : 1115201200044                                                                  
;    e-mail: sdi1200044@di.uoa.gr                                                           
;    GITHUB: https://github.com/salihkrc/assemblymips                                       
;                                                                                           
;    TOTAL CPI: 1.118 IN EDUMIPS64          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;















.data


x: .word -11,-49,-21,6,-85,37,6,80,-96,-17,99,-36,-95,72,-4,86,72,31,-38,47,-10,-88,-60,-91,89,81,-93,-37,-12,-70,43,-89,88,-11,74,-25,-50,-87,3,-89,-29,30,34,87,-3,38,1,7,80,-64
.word 16,-21,-39,-24,31,55,89,-62,22,-42,-66,-69,-97,-99,-41,87,-30,-35,-95,-64,-97,99,5,29,-24,41,-19,22,-71,-49,86,62,39,48,27,-99,-39,-50,-62,-96,-90,-12,-30,-58,-25,-41,36,52,-79,45
.word -93,32,67,60,-14,-26,-96,95,-16,-5,-88,75,-84,-2,55,-38,-79,34,13,-88,89,-97,38,-11,7,-98,3,83,96,36,97,22,91,-79,-84,-60,-71,63,11,-37,17,12,48,0,86,97,26,64,-60,-32
.word -63,-46,3,86,60,74,3,-41,-28,-87,50,-21,-27,71,74,16,90,-92,31,-97,96,83,-13,-54,-19,92,79,9,24,8,41,98,-46,63,-2,-39,-69,81,-81,58,28,-63,81,-38,-83,37,-42,11,-26,35
.word 92,-79,56,2,-27,-18,-69,-18,-48,91,13,42,-26,-12,-93,-49,71,56,-43,16,46,-99,-55,69,-75,-74,25,25,65,-42,-7,62,35,-99,-39,-14,89,-10,40,-23,-10,-41,68,-36,-29,-34,61,-34,68,41
.word 33,96,-30,69,67,-20,95,16,96,78,-61,-84,-26,-66,76,-12,-63,-34,83,-77,91,13,-35,-78,-68,32,37,62,77,-65,-40,67,43,94,12,44,43,-2,-32,79,-95,-24,1,-90,84,-19,-93,83,-11,-50
.word 44,64,15,-71,-85,-37,96,-3,45,42,97,8,-26,75,19,-86,23,-25,-82,-81,83,-60,77,-30,77,-30,-86,40,1,-49,86,2,-42,51,-50,51,-6,87,-53,-74,-11,35,-1,10,83,39,-79,96,94,97
.word -94,11,61,-40,-68,51,-1,-33,-11,68,-21,-3,74,-10,14,-12,83,-18,64,39,-44,-52,-93,53,-38,24,-89,-9,13,-73,65,-93,71,55,-31,76,60,35,40,37,-8,39,-59,-15,81,-6,62,63,-29,-16
.word -15,96,-42,28,8,-4,-52,-31,-76,83,9,44,66,-71,-29,-58,7,4,-87,28,74,-7,-63,-15,71,76,-36,77,-98,53,96,35,27,-63,-14,-48,32,-88,-8,24,85,30,-37,-2,-69,6,44,90,-86,-79
.word -43,-44,-86,-35,77,-10,82,0,-70,-47,-50,-39,-32,15,60,-63,68,-88,53,-43,-22,97,-81,-76,-22,89,82,58,93,-39,60,-75,12,-41,46,93,63,-59,35,-68,-18,-71,-74,11,-90,26,77,-31,77,-36
.word 57,-36,-20,-60,-57,-87,-42,56,-8,11,85,31,12,86,-95,-2,-21,0,91,-51,-87,98,-8,-88,82,-94,-23,-17,-51,-41,-84,-6,66,-13,-50,67,-38,-3,57,-91,58,42,-18,61,22,25,-85,-15,-51,-79
.word 89,-84,60,-70,-29,-99,54,95,67,-7,-34,-92,22,20,-44,-58,83,-53,-61,68,75,90,-5,-57,66,55,-46,-65,15,83,37,83,-87,-5,-70,-60,58,-6,-60,33,-2,-93,-78,-62,84,69,-7,-18,-95,-20
.word -94,-4,-54,93,88,-99,-77,84,-2,33,-10,-34,-48,-26,71,-33,-98,56,-5,-56,-77,75,28,35,-97,-4,13,-70,-35,-20,-47,-39,14,22,-57,63,-90,39,22,-68,-25,30,68,24,-57,-35,-64,93,10,8
.word -58,21,-28,4,-44,-79,75,-43,-36,97,-95,-23,-92,47,64,69,-99,-34,-5,36,0,-44,-12,71,76,1,54,78,-10,49,-10,-67,-81,-45,18,-73,68,-86,-51,-12,-17,-7,-22,-65,59,-63,-35,62,-40,20
.word -41,-38,-4,27,85,0,42,48,9,-71,-91,28,-21,-77,34,-18,10,82,-76,31,-94,22,98,-47,88,-89,-61,-87,96,0,-42,46,61,-40,90,75,-15,-93,9,-72,89,-93,-56,87,-64,95,15,-3,71,-32
.word 99,-11,-6,-5,35,-80,81,-46,5,30,30,-88,28,-35,28,-50,-13,-23,-39,1,29,-23,-35,-87,83,-21,-45,-15,31,-32,-75,71,6,-15,-77,87,26,-98,7,-11,61,77,-14,86,44,55,-54,61,-57,-46
.word -1,-45,-98,41,77,-25,-1,16,-61,71,-51,-64,-31,-96,-36,60,-3,-6,-35,15,10,-94,-55,-14,39,-83,64,-42,38,-57,31,-66,75,-21,-94,-25,-93,-94,94,-53,-3,-82,-89,60,21,-38,9,-71,77,-93
.word 21,22,5,53,-54,-5,17,-71,52,-5,68,-1,-17,-80,64,28,72,98,5,-81,-72,-13,-75,87,24,32,-18,32,-64,16,-55,-85,47,85,81,30,-51,21,74,40,-89,-58,14,-14,31,11,28,80,-67,97
.word -71,-85,56,-73,51,-1,60,-20,-5,-91,-64,58,59,59,-32,43,85,-68,81,-87,74,-92,75,35,62,54,-21,37,27,78,93,32,32,99,36,73,-25,-76,-75,14,10,-86,20,-24,-88,74,-70,17,-37,9
.word 17,68,-46,-14,-63,-2,-25,-59,65,-96,15,-37,81,24,-90,6,72,0,76,23,-19,-85,66,-99,-24,44,10,-59,61,65,-26,41,60,25,56,47,56,17,-92,-87,54,57,1,-25,-52,-87,-12,-48,24,80
.word 53,97,9,54,13,-34,-75,-62,81,7,-96,-73,-6,16,29,66,-95,51,52,-39,80,28,-82,-9,64,-38,-45,-90,57,-98,-82,-18,79,-47,14,-75,2,-96,-28,70,-83,-37,56,-90,-64,-81,-98,1,-7,-7
.word -95,-74,68,-29,-79,-87,15,-70,12,-25,64,68,-23,38,19,-74,98,-22,-35,10,-24,-80,-95,-77,87,36,9,-93,-66,-51,52,-44,-67,-35,-23,-80,-30,-89,-59,72,-8,-56,73,-70,96,79,71,51,94,-24
.word 42,92,-27,-95,30,-45,-6,-71,-50,-38,-48,93,-3,76,95,-13,-88,-39,-53,2,78,-37,74,-18,-75,-22,98,78,83,-41,81,-39,-17,-36,42,-28,-85,-82,-78,88,38,58,87,-8,75,79,-29,-1,-80,40
.word 74,-4,-14,-79,73,69,-86,66,-99,46,39,-48,78,34,-28,-87,-3,-3,-70,61,-48,-74,10,89,59,-66,74,-90,-66,-59,60,-15,-38,65,61,-9,62,-6,-55,73,-97,63,-83,84,90,-59,19,88,-47,23
.word -47,97,-79,-21,12,-5,-43,-12,-29,39,3,93,56,43,-15,94,-53,-52,-75,-74,-17,-45,-35,-10,-95,55,-35,61,76,-26,-86,-47,-99,68,-39,81,-84,4,-70,-58,-61,-57,-51,86,13,-54,-75,-96,-26,-61
.word -21,-27,-86,34,-87,-10,7,61,41,-27,77,47,-5,98,-82,-90,-21,-43,-57,-95,97,93,1,-16,-73,-43,-48,12,-50,91,-46,3,28,12,-11,-34,-73,-83,-1,75,15,-83,-58,-38,75,-17,-92,14,47,-80
.word -57,-52,-25,0,-30,5,-82,-18,39,25,-10,-55,64,-81,0,34,-82,-95,43,61,-61,-64,28,18,-6,45,99,93,-70,-35,-67,62,14,-47,-67,45,-27,78,85,-18,71,11,21,-66,68,52,-20,15,-30,98
.word 63,-80,57,14,-90,3,-79,-27,99,21,82,-48,-72,-39,-1,96,66,-20,30,-24,-50,-98,15,27,67,-25,13,-34,3,-61,-91,-54,-89,17,68,94,95,-51,-51,-31,-31,-40,63,-89,-59,37,39,-99,-68,-32
.word 57,-7,-92,-37,-32,-52,-62,-58,57,46,27,-27,-55,-95,-37,18,-39,-40,-53,-87,-90,-23,-25,-59,-39,-16,63,31,92,41,-84,70,-70,-33,-51,-24,-1,-76,-87,-86,-35,-76,-38,17,34,46,17,72,-49,-76
.word -64,8,2,-55,-89,16,-14,99,-22,-6,18,84,1,-16,-30,-17,18,-77,-81,86,-16,20,-76,-77,6,-66,12,97,33,-98,74,-11,5,-99,77,-52,-79,-38,28,-79,76,-8,-66,39,-28,38,-47,-83,-94,-33
.word -67,64,-73,9,-51,-49,82,-88,4,46,-97,57,22,46,7,-38,70,-21,68,-94,-43,28,-7,-96,70,28,8,41,-37,35,27,-33,-21,-66,82,-82,-72,-76,86,-90,46,43,48,-16,32,2,-52,-63,-69,-80
.word -52,-64,-89,76,-53,39,-74,44,94,-13,-45,39,-23,3,-2,7,-42,-61,45,-55,96,-11,83,33,65,-24,99,-57,-32,1,35,79,7,28,93,84,84,55,-73,-31,-10,-73,-76,-38,90,15,58,-22,-72,71
.word 62,9,83,20,-59,6,29,64,-4,-97,36,-52,55,-85,-79,51,5,-86,-48,76,44,-78,-31,33,39,24,-84,89,-92,-45,90,-38,-27,-35,-92,74,77,5,66,-73,15,65,76,14,-4,68,-19,17,-66,-43
.word -62,91,67,-4,-2,-5,-50,-92,-24,48,24,-59,-55,-4,-10,-8,-97,98,-24,-30,-69,76,-50,-82,-37,-60,15,65,31,68,77,-17,-92,-30,-36,-14,53,-61,18,-42,-99,55,-53,-97,70,-29,45,95,94,-16
.word -54,15,27,62,-19,-40,-93,-23,-85,-51,-33,-95,25,-80,76,-14,65,-35,58,-47,92,19,20,64,-41,97,61,-45,93,-4,-96,92,-17,-28,48,53,73,17,-25,-96,84,-66,65,15,61,-11,43,88,61,58
.word -54,74,21,-97,-92,24,-66,62,-72,54,-63,40,-20,-34,66,41,65,-69,84,-7,-11,76,-2,-75,-31,-29,-38,-87,57,21,-99,61,27,-78,-84,96,12,-53,86,-86,-39,87,3,39,-44,-12,-54,-40,-4,44
.word 73,-6,18,-66,-94,1,56,-3,86,70,60,73,-99,1,52,93,-7,54,-52,-82,-14,96,45,-36,-13,42,-62,-5,-56,34,84,43,-35,-22,-6,-16,20,-17,17,17,42,-21,13,-63,48,-14,37,-23,94,-33
.word -12,-78,-64,-21,-68,-85,12,-3,68,93,-17,-11,-93,-54,-22,-81,-9,33,59,-77,48,12,51,-10,68,-53,-41,-97,95,23,26,60,6,-85,-17,-71,-24,21,-10,67,4,76,-23,93,27,-12,-20,31,-71,-35
.word 81,29,21,-64,-35,-65,95,-10,-60,-10,-63,-99,49,45,-88,53,51,-39,23,63,-37,12,-99,-23,97,23,-27,-59,75,-76,-47,-77,20,-19,34,68,90,-63,0,22,11,70,52,9,13,-19,47,-89,7,65
.word -74,40,60,-41,-69,49,-5,33,-29,-91,78,-60,56,70,-37,-50,-93,-92,-51,-96,-51,36,-68,54,97,97,97,-48,55,48,49,-79,-42,73,90,77,-74,52,-73,44,-10,31,26,32,88,-96,-15,51,59,70
.word 95,14,-88,-21,-11,-36,-41,76,10,-38,25,10,1,-20,73,-52,67,79,81,38,69,77,26,-47,-75,87,-16,95,58,-66,93,-56,-19,-34,60,15,9,71,18,-96,-27,-64,-52,68,-70,78,71,-71,70,-14
.word -62,50,-84,-78,-11,14,9,92,-10,-30,-86,-37,80,-18,34,-14,-36,-97,-32,26,-72,-52,-36,41,33,-9,-49,-99,-98,-60,17,41,7,-45,-20,-1,-52,69,95,26,37,-20,94,-68,2,45,54,-31,54,-23
.word 74,-19,88,90,72,39,-33,-61,91,-8,0,71,-34,98,89,-23,73,50,54,-92,-43,16,96,26,15,87,-43,-95,7,-44,1,34,-46,-21,77,17,-7,-20,82,-64,-41,-32,-61,73,-46,-28,-76,-14,89,8
.word 94,-96,-26,49,-62,-79,-44,-2,64,-26,86,78,90,-90,11,-5,-46,21,73,-56,93,-46,-87,28,2,32,58,44,13,11,-86,-40,86,-41,68,83,85,-73,-27,37,31,-11,-23,-5,-68,-89,-94,-37,-78,5
.word 36,-44,-12,-62,-87,75,-27,-15,77,36,54,-55,-21,50,18,61,70,74,42,19,-61,35,49,-42,78,-99,60,-83,28,-52,-91,-74,36,4,41,-60,97,-16,83,37,-46,36,-4,89,-20,45,-18,1,74,2
.word -32,-41,-63,-28,73,-73,3,89,12,-21,22,-66,90,44,63,-2,47,-75,-18,-62,-73,13,54,-82,-17,-93,-67,1,-35,22,12,-86,19,24,38,-3,-94,18,62,-85,-79,99,38,-36,13,50,25,48,-17,-53
.word -71,50,-5,-66,-56,-14,26,31,-83,26,-22,70,32,58,-42,11,-6,-82,94,74,48,13,33,89,46,84,-43,-45,19,-40,20,-92,-4,-22,25,-31,-50,54,-67,-92,25,-19,-57,81,51,23,66,61,-55,-37
.word -87,21,44,76,-67,-43,32,43,-48,45,-98,97,-48,-79,-83,-31,-8,-29,69,-38,2,-49,63,-76,-42,98,27,-38,-87,38,-86,-39,41,-27,28,30,66,39,61,47,-45,23,-44,9,3,-66,-49,-85,59,-88
.word 39,88,-99,-44,-97,29,-50,-64,-30,-77,45,-80,-97,-15,-30,-8,38,31,61,-95,65,94,-94,74,75,-83,48,-23,-88,77,81,-16,52,11,-69,6,-96,89,92,-20,-54,-56,-94,-17,-74,53,-52,83,-83,97
.word -64,89,99,35,97,-49,-64,-30,8,-77,-90,95,0,46,81,-10,55,22,36,73,-50,-3,44,72,-15,-13,-61,-49,-89,-95,80,-14,32,-73,93,-50,-24,20,15,26,-23,52,61,-73,66,-82,88,24,61,-6









y: .word 92,-75,-89,-29,12,-18,-34,-28,15,4,-89,65,19,-36,30,-61,-46,16,-54,29,92,-76,-89,51,-30,18,-89,-41,28,-62,-33,63,49,-99,44,-84,-68,33,31,-18,93,-38,56,57,19,59,84,-10,40,-71
.word -81,-13,32,-25,-50,-87,-45,95,8,28,-18,-42,-28,-50,92,-42,40,-15,-7,31,-41,6,99,-83,89,81,15,87,26,-25,87,91,-92,76,-10,68,28,99,-19,64,-44,-37,83,-43,-82,38,16,22,-16,33
.word 62,-74,-22,-61,31,89,-94,-50,-60,52,55,-43,13,-71,5,-92,13,94,-96,21,72,-98,-2,7,39,52,33,-25,-8,-64,39,30,-70,52,4,68,50,96,-25,-19,78,2,3,13,63,33,81,76,-49,-58
.word 60,25,-53,-19,89,28,-68,-27,35,21,-76,33,-80,36,-61,-89,23,13,59,69,49,48,-14,-42,-99,17,8,-8,-82,73,-38,-74,-15,60,14,-84,-52,15,-7,-24,18,-10,9,-70,-61,31,35,-79,83,-54
.word 12,46,-55,-93,22,60,-22,-51,86,21,45,38,87,-87,54,34,-9,-91,31,-90,45,-41,23,-15,-60,54,-94,7,1,-7,-14,41,-52,85,-81,70,-16,-22,1,-25,-60,-53,-64,53,99,94,95,94,83,-48
.word 67,-19,-37,59,-5,-56,66,-68,-78,-33,64,-35,-67,44,-30,-62,-95,86,-57,6,-61,44,-46,18,-36,-15,-22,-74,87,24,18,-30,-30,30,49,89,3,-85,-71,-3,18,-97,-63,-94,-58,5,44,-55,80,-70
.word -17,7,-15,-82,-51,3,-12,86,67,-73,3,78,87,41,72,55,50,-90,-59,-22,-83,12,-35,-84,87,-43,85,9,-59,-5,-38,-8,-47,71,69,94,-86,57,-82,-29,-35,-73,-77,24,-59,-93,68,65,1,34
.word 44,88,-32,67,-23,-48,-65,-94,94,33,-82,-62,-80,-53,-47,-15,-12,-90,70,-63,-98,77,-97,38,98,73,35,-39,14,57,-91,81,38,-91,-45,60,65,97,-82,-38,21,-60,-73,86,74,-77,-21,5,-78,-23
.word 13,-87,-63,11,-3,17,-20,-48,-10,31,-10,51,-5,-97,-69,-13,56,8,7,-57,88,17,-38,77,31,-22,-2,-25,43,-72,80,-91,-87,-62,75,52,-8,-32,84,-70,83,83,51,-81,-32,50,39,34,-33,-62
.word 27,26,37,-39,-34,-25,20,44,8,-38,71,-42,-21,-55,66,57,-10,-47,-95,30,17,-45,69,-12,2,87,-82,-90,24,54,6,11,58,51,11,97,-55,50,-8,31,17,-69,-26,-52,-98,-17,2,69,-39,-55
.word -37,-34,-6,36,51,-62,32,45,-33,42,-33,68,-54,85,-62,-61,26,68,26,-27,74,2,-96,-62,-88,-99,-30,-90,-41,82,55,9,33,-15,-1,17,-55,-76,54,-96,-45,-39,-32,-79,77,-20,-3,58,1,55
.word -77,-54,30,-79,-93,-55,11,7,95,3,-38,-83,-80,-32,-69,73,-89,-83,-91,12,-96,15,-32,-99,-6,53,-76,10,-63,7,-59,62,-27,-77,88,-73,-74,80,80,35,-71,74,18,-66,-62,-22,-26,92,-53,72
.word 32,-81,-25,-5,-57,28,37,-22,79,-17,54,-76,-27,-94,16,-19,35,-80,-78,-79,-47,33,-96,27,54,-78,-29,-92,72,-62,-2,73,-23,15,-97,-11,95,98,90,-36,11,20,43,-7,25,-19,-61,54,50,59
.word -55,53,-81,-53,-53,46,-2,-49,82,58,-34,-18,-54,46,-99,-65,29,46,-35,0,48,-48,44,98,98,-4,9,87,-6,34,83,60,87,70,-68,38,58,-8,-58,45,-26,-36,-78,-60,-74,-18,12,-41,84,-74
.word 9,45,-32,20,40,-16,-86,47,-23,-53,-4,-38,-16,-73,-30,66,64,17,93,42,-33,-42,56,0,67,51,19,32,-47,-84,80,60,45,-16,28,63,-70,30,-50,90,-63,-16,58,-15,-77,-12,79,-67,-76,63
.word 82,-51,-71,48,44,-42,-12,95,39,29,-53,79,93,35,39,35,-39,-95,-33,-88,-35,-35,-15,0,-31,74,-77,12,99,-97,-94,74,53,16,-82,13,93,29,24,-52,-35,-74,80,48,-54,-9,18,35,-15,71
.word 8,-95,-88,-16,58,-55,-20,4,-69,-23,61,15,80,-33,-62,-57,-46,-93,47,-23,56,47,50,46,32,-51,94,-75,-8,21,31,90,-66,24,-82,71,-82,-17,33,-22,93,-67,13,65,62,-48,21,-75,30,-8
.word 24,-57,43,-31,82,-7,44,37,-1,-65,-14,-16,58,-33,-60,-15,29,78,84,32,-98,-47,-76,67,-24,-1,-43,51,-75,-3,-3,51,-70,35,20,-56,59,-47,91,-85,-20,39,-92,-23,-55,56,-80,-51,80,-71
.word -92,-22,-82,-12,-35,67,-20,-29,-19,-91,-58,28,-92,-62,80,71,-32,-68,-70,41,-53,-44,34,29,22,-97,35,66,-47,-81,38,-43,-7,-7,58,3,85,50,-50,-93,6,-86,-91,-19,54,-79,-29,-91,42,-23
.word -31,62,26,-96,92,96,36,-33,94,-19,-17,-43,-28,25,33,4,-71,62,43,-90,-34,93,66,28,69,-68,-39,-14,19,48,-37,-79,19,31,-38,-99,39,-1,82,9,79,-63,86,-95,19,-76,19,-47,-1,-95
.word 35,19,-44,-62,96,-29,63,76,7,30,-74,29,-43,-95,-63,-76,-28,82,40,-48,47,-21,46,-28,96,-5,-47,83,55,92,3,47,64,-28,77,29,-56,-72,92,-57,4,56,-26,-50,-76,29,-61,93,-99,-89
.word -60,-43,71,-77,65,-7,-88,-62,35,-34,-57,-17,-59,-73,-29,43,19,-96,-24,-52,96,-44,26,34,23,-55,66,96,-92,-72,-60,-70,6,40,51,-56,-72,-50,-22,-70,-41,-68,48,80,99,18,17,64,92,-12
.word 23,20,-25,-32,80,54,21,-11,94,-71,-53,-62,9,12,44,-79,-33,-46,-64,92,-29,27,-11,75,-34,12,8,33,97,14,39,-52,62,-74,41,98,-35,-56,-92,-82,30,-70,-14,-42,47,-22,-76,73,-1,-27
.word 17,56,42,-33,6,-80,14,93,65,-29,-50,86,-70,-49,86,-58,-49,73,60,86,24,-96,-3,99,86,37,-45,61,-5,-97,4,53,95,-66,5,53,-21,-15,54,73,78,10,33,30,-7,77,-73,-39,1,73
.word 99,86,67,12,-79,-11,16,50,-43,-27,7,-6,-44,36,40,59,65,20,85,19,-97,-82,70,0,5,96,-42,-56,-26,46,-48,-82,-72,-61,80,91,9,16,72,53,-18,31,35,-84,-22,73,-18,-64,-31,49
.word 10,-80,-59,81,78,-90,81,61,-23,-1,-32,78,4,26,-50,-89,-61,25,-74,38,48,22,27,62,-10,-98,-41,58,50,-62,-75,-63,23,-4,-13,87,96,-73,-20,84,35,97,-22,81,-88,-27,96,41,-5,58
.word 9,-45,51,-2,-3,-47,60,-66,-79,-27,-84,-46,-45,-54,38,-45,54,73,26,-13,12,30,36,-51,-75,55,40,-20,-21,88,-97,-88,-53,-38,98,-88,28,-56,41,-23,64,-67,-43,91,84,-99,-86,-25,-91,72
.word -93,75,27,87,-45,-6,13,-99,93,-66,-84,-11,77,-38,-73,-38,28,33,79,-51,64,-97,-14,-69,-24,-81,-83,33,-96,-1,24,34,-33,-18,-59,-69,-91,4,-85,-2,90,-37,21,4,53,-70,-21,-57,-3,-25
.word -74,35,30,-10,38,28,-39,60,56,32,21,-57,-62,33,-46,-39,-25,64,75,-16,-13,-98,-61,39,-70,17,78,-26,-14,-66,90,2,-51,-70,82,92,-70,41,-41,-5,-65,-22,72,90,-94,-12,-5,96,38,-43
.word 3,31,-35,-17,-65,41,48,-28,-66,48,-54,72,-42,9,-10,60,-3,46,-28,11,-64,27,85,-59,37,-53,-14,7,53,35,-79,-76,-92,30,-45,38,-75,12,31,64,25,94,-90,-99,-83,-65,-30,55,32,-72
.word 90,92,86,-41,89,93,14,3,-69,-19,21,59,-85,16,-21,-65,-63,10,-22,-43,-88,-17,4,56,26,-28,33,44,-74,-2,-60,-61,-83,-85,55,-54,-8,74,-90,-65,-59,-16,16,-34,-42,-28,56,65,-22,45
.word 91,-48,-57,47,-17,19,-53,18,8,-69,64,-49,21,-70,30,-95,53,57,8,52,11,94,-23,65,-70,37,55,52,56,-96,-12,-8,-6,-99,-36,47,28,32,-57,82,-20,-88,-23,-57,-9,37,84,-53,15,-62
.word -7,-17,-29,88,66,56,-27,-45,-77,41,-34,28,-12,80,-6,18,-65,95,53,21,83,96,-55,30,90,34,-91,-84,78,34,-13,61,-82,14,-39,-4,82,6,-93,79,23,-62,40,-7,52,22,79,-82,-89,-72
.word -41,9,-77,4,-7,-82,43,35,-4,65,-64,9,13,79,68,36,-27,40,47,-95,52,1,-84,84,70,-84,-25,-70,-8,-75,-67,10,-92,-91,-82,-16,14,-58,54,-53,33,-35,-20,4,-17,66,-91,-31,97,-68
.word 37,35,72,50,38,43,-2,-12,-83,41,29,-82,20,-26,-5,90,-69,23,-22,96,24,41,20,-18,-32,99,49,7,81,-99,-86,73,11,-39,81,4,81,54,-44,-58,-32,-90,-96,-17,-46,-92,83,-62,89,-72
.word -79,0,-68,-63,81,7,53,69,-23,-8,48,-11,-8,63,-44,22,28,-63,-11,45,48,-92,2,-83,30,-32,64,-49,59,-98,-35,52,52,-88,-89,32,50,-75,-75,-52,-54,15,69,-73,-88,21,-19,20,-48,7
.word 11,-37,-7,17,3,53,40,65,-6,67,-82,-89,-13,87,64,-95,93,-37,14,35,-1,94,95,-73,-82,-67,-78,-70,0,41,-11,-56,17,-42,2,-83,-11,38,58,51,92,-6,80,19,-96,12,-51,-20,77,90
.word -85,-16,-31,72,15,-26,87,-81,35,-68,33,-50,-2,61,-57,-48,29,-32,-20,80,-15,43,8,-68,-91,-56,-87,-73,-11,-81,-41,60,13,45,-89,-19,26,-1,-21,58,-67,11,3,-87,14,11,7,-98,-69,-61
.word 92,-11,64,-41,-45,-74,-4,68,54,4,-64,-39,-23,-82,59,-53,-17,91,-23,71,-94,-41,83,-49,4,76,53,-37,-23,55,-71,-31,-91,26,90,30,-44,-13,59,81,-60,-36,4,-22,52,45,-90,-14,98,-57
.word -77,83,-48,-57,-81,58,34,93,2,73,-47,-76,-25,29,-96,-28,-37,-13,-62,-65,73,-45,93,-89,24,-32,48,-90,93,11,91,10,-33,47,41,74,83,26,-52,76,56,-94,-27,6,-13,36,-39,26,89,-59
.word -12,-11,-47,-27,-77,-27,-25,-81,73,95,-59,-70,-3,72,-4,81,-68,-97,5,73,62,90,-44,22,10,-25,-18,79,64,-31,-6,24,-64,-57,-20,-77,-78,-43,-72,-78,-94,-68,30,81,-71,61,-9,-44,-56,-87
.word -14,22,35,79,-62,88,-21,-10,-32,-7,-47,-98,-40,76,91,36,-22,-99,89,35,-16,-31,-8,72,93,-4,-43,91,-82,-88,25,43,-21,95,-60,25,74,-18,-17,93,74,76,-74,49,29,-45,-36,-98,-70,6
.word -63,94,91,10,-44,-88,55,93,-85,-88,17,-35,76,45,-34,84,74,-35,-58,37,-46,-79,-28,-12,34,11,-81,13,59,-31,-32,3,67,-87,-35,10,94,32,42,-64,-75,1,14,83,25,9,2,-32,-21,19
.word 43,79,8,-83,-31,-41,-92,-80,-5,-32,-53,-96,-87,83,-10,45,98,-28,-78,71,22,-45,-47,78,24,54,-24,-63,-97,84,-5,32,-51,8,-34,33,-99,-97,-47,98,-29,31,46,11,10,-11,-65,-13,54,-40
.word 54,77,58,-23,-25,71,-52,72,-46,78,-11,20,-65,49,-26,-39,-98,27,86,94,-65,1,-58,25,-50,44,89,-93,51,71,89,86,56,40,-15,-95,67,-35,-38,-46,-54,19,25,31,-59,-98,-67,-57,-42,90
.word 89,-17,-64,21,88,97,90,-56,-57,71,86,7,95,27,78,75,31,62,-9,-75,-54,61,42,-27,-25,96,-5,37,73,-36,-73,-23,84,29,95,-96,-38,-40,55,-45,-15,87,10,80,-66,66,-59,45,33,12
.word -55,-83,-88,-93,-65,33,-77,-52,27,3,-10,81,-77,-16,-34,91,-80,40,-43,14,-72,-89,-51,-30,66,69,-10,50,-91,-22,81,-79,59,-21,-20,-2,60,-69,49,-32,-79,-83,72,-12,-60,-21,-36,88,69,-63
.word 44,-18,33,-82,64,-5,-26,21,56,79,-24,38,13,-75,-75,-92,54,27,66,79,68,-62,11,-74,15,-98,-32,93,-54,77,19,8,67,55,2,-18,-36,-89,31,92,-46,-44,-64,38,31,-13,-76,-65,-82,-78
.word 58,-49,59,81,42,71,91,-28,21,52,89,64,52,86,-63,57,9,-93,-66,22,88,79,-42,-53,-93,28,38,99,35,-20,-15,-57,28,-10,-71,69,-30,-36,-70,20,56,38,-94,85,27,-2,42,75,16,95
.word 41,-65,-88,-4,33,-52,38,-61,24,96,76,12,-16,27,-67,89,-82,5,-22,78,11,81,-66,-75,12,-34,80,-5,-67,-94,49,-25,78,2,98,-85,80,85,30,49,72,66,-92,31,-99,-9,-87,1,-91,-45


z: .word -61,-66,-54,-59,-75,-23,-41,-30,-98,-23,82,72,98,12,-20,47,81,27,13,-32,-99,-95,56,3,74,90,96,-69,79,-60,79,59,24,18,56,-10,57,68,-64,-33,53,11,-13,80,11,-25,64,78,5,-61
.word 72,-4,-89,96,44,33,-11,17,54,-92,17,-72,-86,77,-49,-42,21,-68,-78,47,42,91,97,-89,-71,-51,-78,92,56,55,-9,-70,-47,-50,-38,-85,28,-79,-56,-92,57,42,84,95,-36,8,-48,-16,35,-58
.word -32,27,83,8,-57,20,59,-43,-26,51,-61,-47,-22,-82,83,72,-92,-55,-89,-70,55,-15,51,65,62,-99,-44,56,-82,-29,-94,-36,-88,-37,-78,68,47,-81,-29,23,3,78,-79,-19,3,-55,-72,50,-13,-86
.word -58,-39,0,15,6,-7,46,80,7,70,31,-4,30,-59,-21,65,-93,57,56,94,34,51,-91,62,78,-67,-2,-6,13,64,-45,17,-26,-32,-90,-23,-47,71,33,-14,-1,-93,31,73,13,-8,-78,-50,74,3
.word -64,16,-81,-14,58,91,3,9,-81,22,-10,-88,44,25,77,40,83,-50,84,-18,53,12,-41,21,92,-86,-94,-19,-47,6,24,-99,96,-78,62,39,-62,9,-13,-55,-66,36,23,-22,10,-68,21,43,18,79
.word 96,-3,-75,34,56,-29,-96,91,-3,42,31,19,65,95,87,66,-55,7,51,36,-60,20,-65,66,32,-34,73,-64,-63,-89,86,65,-10,-35,-63,-49,10,35,-62,-19,83,-1,-20,66,-41,-27,76,65,90,-89
.word 61,-39,-44,-31,24,-34,-98,36,94,-67,62,68,-24,-87,-7,-23,-44,42,81,-24,-97,-80,-7,39,-74,-33,-44,0,-47,-16,8,2,-95,74,-23,92,62,75,87,7,6,-32,10,74,-65,51,-87,9,-94,89
.word 52,34,-97,46,-65,-40,92,-27,4,-22,-93,19,-18,-73,24,-85,5,67,98,78,63,47,18,80,-18,95,90,-49,-8,-8,-51,-15,52,-9,2,-28,-78,-95,-98,-33,-49,42,-32,-47,-27,80,29,2,6,7
.word 8,-59,-52,33,-98,-88,70,47,-52,-42,76,-94,-84,10,-33,90,-27,41,43,38,-94,-30,71,-70,38,-62,-95,-90,26,33,39,15,-55,-54,-50,84,-93,8,47,-24,-45,10,-15,71,30,-5,-26,6,-31,32
.word 42,13,91,98,56,-30,-62,88,68,-39,-10,98,49,2,-41,-90,-78,-81,10,6,-42,-92,91,-84,76,-12,-17,36,-31,-60,28,38,-58,-94,98,-28,-90,-30,-64,-74,27,55,-12,-21,29,-35,-72,45,-50,39
.word -67,51,71,-57,-9,-1,-20,-16,-4,-75,-63,76,-60,9,-99,-31,-43,41,-88,-73,-62,-90,-93,-86,-61,-38,-69,68,-61,-1,-4,92,3,49,-6,20,52,98,-27,-20,-82,-65,-51,-47,2,-18,23,32,-9,74
.word 30,86,58,5,22,30,85,61,46,-91,-4,6,-87,-1,-76,-84,77,32,-93,0,97,-18,72,35,-81,-85,14,-79,92,-51,16,-73,8,-9,27,-53,79,-4,-64,-93,7,-84,-12,46,-39,10,-57,65,-5,25
.word 46,25,8,21,-79,38,-76,77,-72,14,42,-21,2,-62,-42,25,-22,-46,96,41,20,11,-24,95,27,-15,32,-64,-19,87,77,-4,-90,58,-62,-56,2,16,15,-67,-72,92,-52,-74,21,66,13,-2,-15,-75
.word 74,-12,-87,47,-46,88,-15,52,-39,-93,89,-22,-54,92,-3,-30,29,0,-24,-24,96,-99,6,-21,41,-16,-3,82,-69,-98,56,-13,-35,58,97,94,27,3,58,-25,94,84,-15,-38,51,95,25,-99,38,-20
.word 12,-55,-53,-73,-6,41,-59,17,60,18,22,-68,56,15,-55,-4,68,60,70,-47,16,-64,56,64,13,-18,10,76,-70,77,-31,18,20,-85,50,-34,-69,-48,92,50,11,55,56,1,47,39,-19,29,25,-55
.word 3,84,33,-18,-44,75,-11,6,-1,-15,-77,-29,-58,-12,96,-89,-64,-2,-52,37,65,-89,-1,-18,-80,-73,2,16,-13,74,64,-21,-94,69,14,21,47,-24,58,19,-45,-34,34,88,79,60,4,-97,-78,-21
.word 87,89,51,-55,-3,-25,-21,67,-86,-31,12,-68,13,-69,-73,63,-34,26,67,52,59,-3,63,-73,19,31,43,-6,-12,-62,32,-12,-38,59,57,14,32,-86,-93,-22,-48,34,-33,-77,-20,-60,-95,-46,-53,28
.word 80,-62,60,37,36,-70,-36,-67,-1,-25,52,0,68,71,66,68,51,-17,-5,-13,-53,-17,79,94,46,49,20,38,-69,96,13,-56,-57,-99,-19,-15,79,-37,28,-13,-80,-10,69,11,-60,-16,-50,-56,98,53
.word -39,-36,5,-47,-89,-50,90,81,-38,-78,-58,73,-33,45,46,78,-24,23,-88,-98,-11,53,-98,-55,-87,30,10,88,9,-87,-4,79,-22,-94,-38,-16,-1,37,-23,-33,-91,47,76,-72,10,65,2,60,61,55
.word -20,-81,43,75,48,-36,-43,21,47,-69,-14,-66,58,29,-67,76,9,-20,49,-91,92,17,-33,-74,36,-67,-55,-52,3,77,6,-20,26,-3,-1,-31,-81,59,-59,-64,-1,-86,40,-41,-13,7,84,48,-50,95
.word 7,73,60,91,19,-70,56,-40,-5,-18,95,-81,-50,-6,74,8,-61,-84,-97,74,98,68,-92,54,-54,-10,-8,-92,-23,21,-52,33,54,27,26,-88,14,18,92,94,23,-11,41,-15,19,-92,29,-4,48,62
.word 26,-19,3,47,-71,79,85,-16,22,-85,-13,26,89,-38,-44,97,54,0,-74,-82,73,-59,62,47,-26,-15,48,-44,33,-44,45,-36,-27,-81,48,18,-75,90,-66,29,-47,60,42,4,-81,-32,-8,14,-83,80
.word -81,73,29,49,72,-96,49,-92,-99,-1,36,-63,-11,-10,-59,18,-95,51,59,-53,-10,-77,-54,-15,65,35,30,-4,-88,-92,93,-56,-88,63,-73,-25,16,51,-47,2,-45,-81,3,-35,-56,-69,43,75,36,60
.word 41,13,84,-59,-75,-4,11,-82,-66,-31,-7,-13,19,66,-90,-23,79,-95,97,79,-53,3,-4,-46,-32,-43,78,42,49,88,-86,43,67,96,-35,38,-2,94,-25,-5,-54,-77,14,12,-35,-84,-42,-64,94,-53
.word 35,-9,-69,57,0,56,83,-34,-87,78,39,-8,-91,51,-18,87,83,26,63,-62,7,63,-42,91,41,-46,-55,-9,-34,-66,-33,-9,62,54,-77,-84,-55,-12,52,-25,-98,78,92,22,68,-97,-34,18,-88,19
.word 2,-72,-11,67,74,73,68,99,-41,74,68,36,-21,-70,-47,-65,91,-59,-63,-61,6,24,-23,-40,-29,-21,-21,-31,28,52,45,-15,-95,-79,-63,-58,91,-7,41,-72,-17,-64,18,-69,23,-97,-92,97,43,-88
.word 15,-51,-10,-54,-15,-9,-70,28,-53,51,44,75,-1,-30,-66,48,73,-73,-1,27,-97,41,97,-13,-20,42,-79,42,63,81,19,7,59,86,15,-78,93,76,-74,80,16,-68,5,-19,-41,-1,60,36,65,-77
.word 53,-54,-24,79,-57,-92,62,33,-67,28,-41,-77,77,11,-51,8,-30,-93,5,-76,-64,76,60,0,98,-48,-44,-99,42,7,-45,5,25,-80,-44,57,61,-30,21,3,-69,11,67,18,-50,-67,-42,-21,10,54
.word 6,75,-41,-54,46,-99,-65,-61,46,-55,-16,64,-7,4,40,-29,-94,-26,-48,86,-16,-3,73,56,72,-82,-82,-33,-71,7,-43,-60,-99,-37,-88,-99,-16,-25,-41,-63,-89,-41,90,69,-65,10,52,-40,-40,19
.word -90,46,-97,-38,-83,5,7,67,89,95,20,-23,-49,-90,-92,92,59,18,35,55,-37,-32,83,84,89,6,28,-24,64,-18,66,45,31,90,-4,-41,-66,0,-47,-32,87,-79,59,-17,90,16,-70,68,-22,-54
.word -20,-65,-90,-77,-10,31,-91,75,-86,40,38,73,-16,80,9,40,35,-7,1,-69,95,-82,-32,-88,-65,48,51,-56,10,28,-44,-86,-66,32,-15,61,-51,21,-43,23,-51,-1,85,-52,18,98,-83,99,-62,41
.word -44,-50,14,-88,-8,45,58,-13,-10,-54,-65,1,60,-46,-26,-12,-71,9,60,33,10,99,60,-43,-17,92,-14,-90,-75,-44,-77,-85,-18,19,60,10,-11,76,-48,3,-80,8,-79,83,6,83,64,-13,-18,-51
.word -62,-21,50,36,-36,47,-94,31,-24,19,-30,-94,-8,14,-83,-57,72,73,19,3,28,21,68,16,92,-58,99,-69,9,35,-45,99,-45,-85,23,57,-23,-32,82,-59,52,-85,-76,15,-24,94,99,56,27,-92
.word 89,-56,73,-52,-48,36,29,4,3,53,45,-47,86,61,72,13,-90,-46,17,70,39,0,-98,69,-1,62,-42,-30,-55,3,75,-81,33,-97,-90,-20,55,0,90,28,-15,62,-79,96,49,57,45,34,-37,37
.word -9,42,-7,-99,78,83,-41,-62,-1,-55,70,-4,23,49,4,-98,62,63,40,29,-36,45,31,-19,68,65,-72,31,-87,-2,-57,21,21,-78,9,97,80,-83,47,-45,-77,-45,-94,56,-54,-76,89,-10,-76,78
.word -42,-98,-11,84,-94,-48,67,81,72,91,-6,18,-17,29,-1,32,36,99,83,-42,-75,46,-86,51,-76,86,-62,-13,62,-52,-43,-45,95,59,-4,-43,-55,16,55,25,-46,4,-87,-77,-42,-68,-51,-96,-88,68
.word 30,-33,-31,26,81,-10,68,-3,-5,20,84,62,-79,71,-78,-1,-25,-12,90,-70,-11,-29,-38,33,-54,17,-46,64,-50,74,84,34,68,81,-54,93,71,-14,-87,69,78,-36,83,-85,69,-37,-47,-69,-6,66
.word 3,-73,32,71,-34,70,-48,-26,-9,-39,88,-51,84,5,0,19,-69,-75,-62,73,95,-91,92,-5,57,59,-42,80,89,-21,-90,8,-49,87,99,99,-69,1,26,53,-68,46,36,-62,29,-48,-55,33,-28,65
.word 70,-42,0,-8,27,95,88,-55,-41,19,79,-22,91,97,62,85,59,-15,-2,-21,-30,14,18,57,80,-49,31,40,90,-93,-32,59,-13,61,-76,-82,-39,72,77,-53,-58,60,-18,20,-1,-25,65,71,3,99
.word -83,64,38,-27,77,15,-10,94,-91,-64,-59,-15,49,-65,25,-50,25,54,64,1,51,-37,0,-24,52,20,-81,48,-52,-16,-76,-31,31,-7,-11,45,44,51,62,-48,39,18,-16,59,58,28,55,-77,58,49
.word -22,8,5,-50,-85,-70,37,61,18,-78,5,-69,-55,-64,-57,9,34,76,0,-41,-21,74,60,30,50,-11,59,74,34,73,75,-74,76,-66,13,-22,-46,27,-57,-71,14,23,27,-9,63,9,-48,-8,30,-88
.word -31,87,79,-9,-1,-77,98,-58,-64,-20,81,-60,-3,-39,54,75,42,-63,-81,-65,56,-83,-14,-44,7,-3,-72,11,-75,45,-92,-36,5,-81,-17,-95,-69,47,2,-67,-75,99,-8,-96,77,14,69,47,-95,-26
.word 6,54,41,31,47,49,-33,-62,70,58,80,42,32,5,99,-74,45,-86,-10,-65,31,-42,54,54,78,80,-55,-34,-31,34,87,65,40,-43,13,-97,93,62,93,27,56,61,-90,-86,-77,-89,13,-10,-56,-24
.word -54,-27,-52,-51,66,-17,82,41,-90,-34,48,29,-43,18,53,-72,13,-16,57,-79,88,17,97,-56,-97,92,-60,-15,61,-99,63,-24,59,-96,-20,-86,48,-54,3,-77,74,25,-36,-13,-36,-67,-18,18,-20,43
.word -98,-45,-53,-82,-82,57,71,67,63,82,48,29,-40,-75,59,40,21,-34,-39,79,-74,70,-37,51,-86,-52,11,-51,-90,-4,-57,91,-86,-12,30,-6,-77,55,-3,-86,-7,-21,-73,83,-80,54,-86,14,21,-35
.word -45,-88,47,-31,-14,-50,3,-42,56,-71,27,-38,-19,-84,81,-48,61,66,27,46,56,-20,72,78,60,-84,64,-8,16,-46,46,-36,-60,73,-51,68,-79,87,61,30,26,-92,-42,-82,-4,84,-51,-90,-63,52
.word -58,7,69,-72,67,31,-4,-44,78,78,25,8,63,28,-98,70,-91,90,-87,10,75,71,-36,-76,-64,-70,42,-8,-90,99,44,80,95,33,75,47,76,49,-15,-31,-31,-92,30,-92,69,76,-47,-41,-3,36
.word -64,-25,23,88,-70,40,-63,5,94,43,2,28,-76,-63,39,74,-17,11,-68,88,-38,30,-93,-54,-66,86,-94,-50,40,-79,9,28,-67,82,-71,-40,-67,-40,29,-5,-71,56,70,39,30,-66,-61,44,79,-4
.word 72,71,-2,-97,13,-61,-88,-34,67,-66,65,-58,7,-91,50,86,42,41,-24,94,86,-21,56,-72,99,-54,74,-23,-17,-85,-58,-11,62,-11,-1,97,-77,-19,-88,-79,75,82,55,56,-91,-25,36,43,-19,-27
.word 17,-4,-11,16,-43,98,84,-82,-89,-61,-71,26,-2,-51,3,52,-40,-52,-69,70,94,84,-30,30,2,-39,46,62,-49,-74,27,9,-96,-37,85,-76,-65,-93,-85,-30,-41,-61,-43,61,-79,98,11,38,95,22


something: .asciiz "SOMETHING\n"

pnz: .asciiz "p= %d. n= %d. z= %d.\n"

start_address: 	        .space 4
syscallArg1:			.space 4
syscallArg2:			.space 4
syscallArg3:			.space 4


.text


; LINEAR SEARCH OF ARRAYS X,Y,Z FOR NEGATIVE, POSITIVE AND ZERO NUMBERS,(n,p,z)

daddi R25, R0, 0  ; counter for pos
daddi R26, R0, 0  ; counter for neg
daddi R27, R0, 0  ; counter for zer
daddi R28, R0, 2500 ; NUM_OF loops 

daddi R10, R0, 0
daddi R11, R0, 0 ; counter for loop

Check:

ld R12, x(R10) ;x
ld R13, y(R10) ;y
ld R14, z(R10) ;z

c_x:
beq  R12, R0, zer_x ; if r12 = 0 go to zer_x
bgez R12, pos_x ; if r12 > 0 go to pos_x

daddi R26, R26, 1 ; if nothing above is negative

c_y:
beq  R13, R0, zer_y ; if r13 = 0 go to zer_y
bgez R13, pos_y ; if r13 > 0 go to pos_y

daddi R26, R26, 1 ; if nothing above is negative

c_z:
beq  R14, R0, zer_z ; if r14 = 0 go to zer_z
bgez R14, pos_z ; if r14 > 0 go to pos_z

daddi R26, R26, 1 ; if nothing above is negative

daddi R10, R10, 8
daddi R11, R11, 1

bne R11, R28, Check
beq R11, R28, wash_your_hands

pos_x:

daddi R25, R25, 1 

j c_y

pos_y:

daddi R25, R25, 1 

j c_z

pos_z:

daddi R25, R25, 1

daddi R10, R10, 8
daddi R11, R11, 1

bne R11, R28, Check
beq R11, R28, wash_your_hands

zer_x:

daddi R27, R27, 1

j c_y

zer_y:

daddi R27, R27, 1

j c_z

zer_z:

daddi R27, R27, 1

daddi R10, R10, 8
daddi R11, R11, 1

bne R11, R28, Check
beq R11, R28, wash_your_hands

wash_your_hands:

daddi R28, R0, 0
daddi R11, R0, 0
daddi R10, R0, 0
daddi R12, R0, 0
daddi R13, R0, 0
daddi R14, R0, 0


daddi R9, R0, 50
daddi R12, R0, 2
daddi R5, R0, 20000
mult R5, R12
mflo R6  ; Loaded 40000

daddi R16, R0, 0  ; i = 0
L1:
daddi R17, R0, 0  ; j = 0
L2:
daddi R18, R0, 0  ; k = 0

mult R16, R9
mflo R10

daddu R10, R10, R17

dsll R10, R10, 3


daddu R10, R4, R10

ld R21, 0(R10)
L3:

mult R18, R9
mflo R8

daddu R8, R8, R17

dsll R8, R8, 3

daddu R8, R8, R6
ld R22, 0(R8)

mult R16, R9
mflo R11


daddu R11, R11, R18

dsll R11, R11, 3

daddu R11, R11, R5
ld R23, 0(R11)

dmult R22, R23
mflo R24
dadd R21, R21, R24

daddi R18, R18, 1
bne R18, R9, L3
sd R21, 0(R10)

daddi R17, R17, 1
bne R17, R9, L2
daddi R16, R16, 1
bne R16, R9, L1

Print:
daddi $a3, $zero, pnz
sw $a3, start_address(r0)


dadd r5, r0, R25 
sw r5, syscallArg1(r0)

dadd r6, r0, R26 
sw r6, syscallArg2(r0)

dadd r7, r0, R27  
sw r7, syscallArg3(r0)


daddi r14, r0, start_address
syscall 5

Exit:
halt 

