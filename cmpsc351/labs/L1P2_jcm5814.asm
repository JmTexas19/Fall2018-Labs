#Author: Julian Marin
#Date: 	 8/30/2018
#Lab: 	 1
#Class:  Microprocessors

.text
	li	$t0, 0		#Set register $t0 = 0
	li 	$t1, 10		#Set register $t1 = 10
	jal	loop
	
   	li 	$v0, 10		#System call for exit
	syscall			#Cleanly end system
	
#Loop 5 times when jump to loop
loop:
	addu	$t0, $t0, $t1	#Add $t1 to $t0
	addu	$t1, $t1, 10
	addu	$t2, $t2, 1
	blt	$t2, 5, loop	#If $t2 is less than $t1, Loop 
	jr	$ra