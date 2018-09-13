#Author: Julian Marin
#Date: 	 9/8/2018
#Lab: 	 2
#Class:  Microprocessors

.data
	enterNumStr: .asciiz "Please enter a number: \n"	#Ask user for input string
	num: .word 0						#Value to be read

.text
	#PRINT STRING
	li $v0, 4				#Load syscall 4 print string
	la $a0, enterNumStr			#Load string into $a0 to print
	syscall					#Execute syscall
	
	#USER INPUT
	li $v0, 5				#Load syscall 5 read integer
	syscall					#Execute syscall
	sw $v0, num				#Store word into num
	
	#DISPLAY USER INPUT
	li $v0, 35				#Load syscall 35 to print integer as binary
	lw $a0, num				#Load integer into $a0 to print
	syscall					#Execute syscall