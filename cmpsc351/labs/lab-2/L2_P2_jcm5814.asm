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
	
	#MULTIPLY BY 5
	lw $t0, num				#Load num into $t0
	sll $t1, $t0, 2				#Shift value left 2 bits to multiply by 4
	add $t1, $t1, $t0			#Add value to itself to complete multiplication by 5
	sw $t1, num				#Store multiplied value into num
	
	#DISPLAY USER INPUT MULTIPLIED BY 5
	li $v0, 1				#Load syscall 1 to print integer
	lw $a0, num				#Load integer into $a0 to print
	syscall					#Execute syscall
	
	
