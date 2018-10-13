

			.data
intArr:			.word 111, 222, 333, 444
seperator:		.asciiz ", "
arrOutput:		.asciiz "Here are is the array contents: "

			.text
			.globl main
			
main:

			li $v0, 4
			la $a0, arrOutput
			syscall #initial label
			
			li $v0, 1
			la $a0, intArr
			lw $t0, 0($a0)
			move $a0, $t0
			syscall # arr[0]
			li $v0, 4
			la $a0, seperator
			syscall
			
			li $v0, 1
			la $a0, intArr
			lw $t0, 4($a0)
			move $a0, $t0
			syscall # arr[1]
			li $v0, 4
			la $a0, seperator
			syscall
			
			li $v0, 1
			la $a0, intArr
			lw $t0, 8($a0)
			move $a0, $t0
			syscall # arr[2]
			li $v0, 4
			la $a0, seperator
			syscall
			
			li $v0, 1
			la $a0, intArr
			lw $t0, 12($a0)
			move $a0, $t0
			syscall # arr[3]
			li $v0, 4
			la $a0, seperator
			syscall
			
			
			li $v0, 10
			syscall






