

#this program asks the user for their test grades
# and calculates the average

			.data

prompt:			.asciiz "Enter your exam scores, \n"
e1Input:		.asciiz "Exam 1: "
e2Input:		.asciiz "Exam 2: "
finInput:		.asciiz "Final Exam: "

output:			.asciiz "Average: "

			.text
			.globl main
			
main:

			li $v0, 4
			la $a0, prompt
			syscall #prompt
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
#Get input			
			li $v0, 4
			la $a0, e1Input
			syscall #prompt 1
			
			li $v0, 5
			syscall #exam 1
			move $t0, $v0
			
			li $v0, 4
			la $a0, e2Input
			syscall #prompt 2
			
			li $v0, 5
			syscall #exam 1
			move $t1, $v0
			
			li $v0, 4
			la $a0, finInput
			syscall #prompt 3
			
			li $v0, 5
			syscall #exam 1
			move $t2, $v0
#Calculate

			sll $t4, $t0, 9 #score1 = 512 * score1
			li $t5, 2558
			div $t4, $t5  #score1 = score1 / 2558 
			mflo $t0
			
			li $t5, 614
			mult $t1, $t5 #score2 = 614 * score2
			mflo $t5
			srl $t1, $t5, 11 #score2 = score2 / 2048
			
			srl $t2, $t2, 1 # score 3 - score3 / 2
			
			#add them all together
			
			add $t0, $t0, $t1
			add $t0, $t0, $t2
			
			#output
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
			li $v0, 4
			la $a0 output
			syscall
			
			li $v0, 1
			move $a0, $t0
			syscall	
			
			li $v0, 11
			li $a0, '\n'
			syscall

			#exit
			li $v0, 10
			syscall
		
