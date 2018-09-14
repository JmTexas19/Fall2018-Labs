#Julian Marin
#Lab 3
#9/13/2018

.data
	dec1:		.word 0
	dec2:		.word 0	
	result:		.word 0
	promptString1:	.asciiz "Enter decimal 1:\n"
	promptString2:	.asciiz "Enter decimal 2:\n"

.text
	#PRINT PROMPT 1
	li	$v0, 4			#Load syscall print string
	la	$a0, promptString1	#Set $a0 to promptString
	syscall				#Execute syscall
	
	#INPUT1 INTO dec1
	li	$v0, 5			#Load syscall read decimal
	syscall				#Execute
	sw 	$v0, dec1		#Copy input into dec1
	
	#PRINT PROMPT 2
	li	$v0, 4			#Load syscall print string
	la	$a0, promptString2	#Set $a0 to promptString
	syscall				#Execute syscall
	
	#INPUT1 INTO dec2
	li	$v0, 5			#Load syscall read decimal
	syscall				#Execute
	sw	$v0, dec2		#Copy input into dec2
	
	#PUT INTO REGISTERS
	lw	$t0, dec1
	lw	$t1, dec2
	
	#JUMPS
	jal	loop			#Jump and link to loop function
	jal	print			#Jump and link to print function
	jal	writeToFile		#Jump and link to WriteToFile function
	
	#EXIT
	li	$v0, 10			#Load exit syscall
	syscall				#Execute

#CHECK BIT
loop:
	andi	$t2, $t1, 1		#Check if bit is clear; #t2 bit_check
	beqz	$t2, clearBit		#Branch if bit is clear
	addu	$t3, $t3, $t0		#Add dec2 to result if bit is not clear; #t3 result

#MULTIPLY AND SHIFT
clearBit:
	sll	$t0, $t0, 1		#Shift dec1 left one bit to multiply by power of 2
	srl	$t1, $t1, 1		#Shift dec2 right one bit to check next bit
	bnez	$t1, loop		#If dec2 is not equal to zero, loop again, otherwise done
	sw	$t3, result		#Store result into label
	jr	$ra			#Return to link

#PRINT RESULT
print:
	li 	$v0, 35			#Load print integer to 32bit binary syscall
	lw 	$a0, result		#Load word of integer to print
	syscall				#Execute
	jr 	$ra			#Return to link

#WRITE TO FILE
writeToFile:
	li	$v0, 15			#Load write to file syscall
	la	$a1, result
	
