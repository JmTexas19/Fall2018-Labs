#Author: Julian Marin
#Date: 	 8/30/2018
#Lab: 	 1
#Class:  Microprocessors

.text
	li 	$t0, 1  		#Set register $t0 = 1

  	#In four separate instructions add 2, then 3, then 4, then 5 into register $t0, ($t0 = $t0 + 2 + 3 + 4 + 5)		
  	addi	$t0, $t0, 2  		#Add 2 to register $t0
   	addi	$t0, $t0, 3 		#Add 3 to register $t0
   	addi	$t0, $t0, 4 		#Add 4 to register $t0
   	addi	$t0, $t0, 5 		#Add 5 to register $t0

   	la	$t1, ($t0)		#Copy the result from register $t0 into register $t1
   	li 	$v0, 10			#System call for exit
	syscall				#Cleanly end system
