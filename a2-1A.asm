#Clayton Stamper, CS 2318-004, Assignment 2 part 1 Program A
	
	#this program will ask for an int and print an int,
	#ask for a string and print a string,
	#and ask for a char and print a char
			
	
			
			.data
			
askInt:			.asciiz "enter integer: "
askString:		.asciiz "enter string: "
askChar:		.asciiz "enter character: "

replyInt:		.asciiz "here is your integer: "
replyString:		.asciiz "here is your string: "
replyChar:		.asciiz "here is your character : "

			.text

			li $v0, 4 
			la $a0, askInt
			syscall #enter your integer
			li $v0, 5 
			syscall # >> a0
			move $a1, $v0
			li $v0, 4
			la $a0, replyInt 
			syscall # here is your int
			move $a0, $a1
			li $v0, 1 
			syscall # << a0
			li $v0, 11
			li $a0, '\n'
			syscall # *white space*
			li $v0, 11
			li $a0, '\n'
			syscall # *white space*
			
			
			li $v0, 4 
			la $a0, askString
			syscall #enter string
			li $v0, 8 
			la $a0, askString
			li $a1, 31
			syscall # >> a0
			move $a1, $a0
			li $v0, 4
			la $a0, replyString 
			syscall #here is your string
			move $a0, $a1
			li $v0, 4
			syscall # << a0
			li $v0, 11
			li $a0, '\n'
			syscall  # *white space*
			
			li $v0, 4
			la $a0, askChar 
			syscall #enter character
			li $v0, 12  			
			syscall # >> a0
			move $a1, $v0
			li $v0, 11
			li $a0, '\n'
			syscall  # *white space*
			li $v0, 4
			la $a0, replyChar
			syscall #here is your character :
			move $a0, $a1
			li $v0, 11
			syscall # << a0
			li $v0, 11
			li $a0, '\n'
			syscall			
			
			
			li $v0, 10
			syscall
