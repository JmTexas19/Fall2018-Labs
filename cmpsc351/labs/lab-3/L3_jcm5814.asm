#Julian Marin
#Lab 3
#9/13/2018

.data
	dec1:		.word 0
	dec2:		.word 0	
	result:		.word 0				
	promptString1:	.asciiz "Enter decimal 1:\n"
	promptString2:	.asciiz "Enter decimal 2:\n"
	newline:	.asciiz "\n"
	fout:		.asciiz "Lab3.txt"
	hex:		.asciiz	"0123456789ABCDEFGHIJKLMNOPQRSTUV"
	write:		.space 32

.text
main:
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
	j	base32_main

#CHECK BIT
loop:
	andi	$t2, $t1, 1		#Check if bit is set; #t2 bit_check
	beqz	$t2, clearBit		#Branch if bit is set
	addu	$t3, $t3, $t0		#Add dec2 to result if bit is clear; #t3 result

#MULTIPLY AND SHIFT
clearBit:
	sll	$t0, $t0, 1		#Shift dec1 left one bit to multiply by power of 2
	srl	$t1, $t1, 1		#Shift dec2 right one bit to check next bit
	bnez	$t1, loop		#If dec2 is not equal to zero, loop again, otherwise done
	sw 	$t3, result		#Store result into label
	jr	$ra			#Return to link

#PRINT RESULT
print:
	li 	$v0, 1			#Load print integer
	lw 	$a0, result		#Load word of integer to print
	syscall				#Execute
	jr 	$ra			#Return to link
	
#BASE32
base32_main:
	lw	$t0, result		#Load result into $t0
	li	$t1, 0			#Set 0 andi result
	li	$t2, 0			#Set 0 hex value
	li	$t3, 16			#Set $t3 to 2 for later branching
	
	jal	base32_loop		#Jump to base32_loop
	
	#NEW LINE PRINT
	li 	$v0, 4			#Load print character
	la	$a0, newline		#Load address of character new line
	syscall				#Execute
	
	#FIRST LETTER
	la	$t1, hex		#Load hex value into t1
	add	$t1, $t1, $t0		#Iterate through string to find hex letter
	lb	$t4, ($t1)		#load single byte into t4
	
	la	$t5, write
	addu	$t5, $t5, $t4
	
	
	#PRINT FIRST BIT
	li 	$v0, 11			#Load print character
	la	$a0, ($t4)		#Load address of character new line
	syscall				#Execute
	
	#SECOND LETTER
	la	$t1, hex		#Load hex value into t1
	add	$t1, $t1, $t2		#Iterate through string to find hex letter
	lb	$t4, ($t1)		#load single byte into t4
	
	addu	$t5, $t5, $t4
	sb	$t4, write

	#PRINT SECOND BIT
	li 	$v0, 11			#Load print character
	la	$a0, ($t4)		#Load address of hex character
	syscall				#Execute
	
	jal	openFile		#Jump and link to openFile function
	jal	writeToFile		#Jump and link to WriteToFile function
	
	#CLOSE FILE
	li	$v0, 16			#Load syscall for close file
	move	$a0, $t0		#File descriptor
	syscall				#Execute
	
	#LOOP
	j	main				

base32_loop:
	andi	$t1, $t0, 1		#Check bit
	beqz	$t1, base32_shift	#If clear, branch
	add	$t2, $t2, $t3		#Else, add bit to hexvalue
	
base32_shift:
	srl	$t0, $t0, 1		#Shift result right 1 bit
	srl	$t3, $t3, 1		#Shift bit significence right 1 bit
	bnez 	$t3, base32_loop	#If $t3 is not 0 loop
	jr	$ra			#Else return
	
#OPEN FILE
openFile:
	li	$v0, 13			#Load syscall 13 open file
	la	$a0, fout		#Name of text file
	li	$a1, 9			#Open for writing
	li	$a2, 0			#Mode Ignore
	syscall				#Execute
	move	$t0, $v0		#Copy file descriptor
	jr 	$ra			#Return to link

#WRITE TO FILE
writeToFile:
	li	$v0, 15			#Load write to file syscall
	move	$a0, $t0		#File Descriptor
	la	$a1, write		#Write result to file
	li	$a2, 1024		#Characters to write
	syscall				#Execute
	jr 	$ra			#Return to link
	
