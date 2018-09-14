#Julian Marin
#Lab 3
#9/13/2018

.data
	dec1:		.word 0
	dec2:		.word 0	
	promptString1:	.asciiz "Enter decimal 1:\n"
	promptString2:	.asciiz "Enter decimal 2:\n"

.text
	#PRINT PROMPT 1
	li	$v0, 4			#Load syscall print string
	la	$a0, promptString1	#Set $a0 to promptString
	syscall				#Execute syscall
	
	#INPUT1 INTO dec1
	li	$v0, 6			#Load syscall read float
	syscall				#Execute
	sw 	$t0, dec1		#Copy input into dec1
	
	#PRINT PROMPT 2
	li	$v0, 4			#Load syscall print string
	la	$a0, promptString2	#Set $a0 to promptString
	syscall				#Execute syscall
	
	#INPUT1 INTO dec2
	li	$v0, 6			#Load syscall read float
	syscall				#Execute
	sw	$t0, dec2		#Copy input into dec2
	
	
	
	
