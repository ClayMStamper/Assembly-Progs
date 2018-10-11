

			.data
intro:			.asciiz "welcome"
			
			.text
			
			li $v0, 4
			la $a0, intro
			syscall
			
			li $v0, 11
			li $a0, '\n'
			syscall
			
	#======================================	
	
			li $v1, 4
			
			li $v0, 1
			li $a0, 0
			
			
			ori $t0, $v1, 1
			sll $t1, $t0, 1
			move $a0, $t1 
			
			
			
			syscall			
			
			li $v0, 10
			syscall