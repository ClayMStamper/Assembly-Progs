

#this program asks the user for their test grades
# and calculates the average

			.data

prompt:			.asciiz "Enter your exam scores, \n"
e1Input:		.asciiz "Exam 1: "
e2Input:		.asciiz "Exam 2: "
finInput:		.asciiz "Final Exam: "

output:			.asciiz "Here is your avg: "

e1Score:		.word 
e2Score:		.word
finScore:		.word
avgScore:		.word


			.text
			.globl main
			
main:

			li $v0, 4
			la $a0, prompt
			syscall #prompt
#Get input			
			li $v0, 4
			la $a0, e1Input
			syscall #prompt 1
			
			li $v0, 5
			syscall #exam 1
			la $t0, e1Score
			sw $v0, ($t0)
			
			li $v0, 4
			la $a0, e2Input
			syscall #prompt 2
			
			li $v0, 5
			syscall #exam 2
			la $t0, e2Score
			sw $v0, ($t0)
			
			li $v0, 4
			la $a0, finInput
			syscall #prompt 3
			
			li $v0, 5
			syscall #final
			la $t0, finScore
			sw $v0, ($t0)
#Calculate

			li $v0, 1
			la $t0, e1Score
			la $t1, e2Score
			lw $a0, ($t0)

			syscall	

			
			li $v0, 10
			syscall
		
