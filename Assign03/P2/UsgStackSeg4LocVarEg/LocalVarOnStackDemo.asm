         .data       
#label:   .asciiz "\niArr[0] x iArr[1] = "
         .text
         .globl main
main:
         li $t1, 321
         li $t2, 1234
#         addiu $sp, $sp, -8
         addiu $sp, $sp, -30
         li $t0, '\n'
         sb $t0,     0($sp)
         li $t0, 'i'
         sb $t0,     1($sp)
         li $t0, 'A'
         sb $t0,     2($sp)
         li $t0, 'r'
         sb $t0,     3($sp)
         sb $t0,     4($sp)
         li $t0, '['
         sb $t0,     5($sp)
         li $t0, '0'
         sb $t0,     6($sp)
         li $t0, ']'
         sb $t0,     7($sp)
         li $t0, ' '
         sb $t0,     8($sp)
         li $t0, 'x'
         sb $t0,     9($sp)
         li $t0, ' '
         sb $t0,     10($sp)
         li $t0, 'i'
         sb $t0,     11($sp)
         li $t0, 'A'
         sb $t0,     12($sp)
         li $t0, 'r'
         sb $t0,     13($sp)
         sb $t0,     14($sp)
         li $t0, '['
         sb $t0,     15($sp)
         li $t0, '1'
         sb $t0,     16($sp)
         li $t0, ']'
         sb $t0,     17($sp)
         li $t0, ' '
         sb $t0,     18($sp)
         li $t0, '='
         sb $t0,     19($sp)
         li $t0, ' '
         sb $t0,     20($sp)
         li $t0, '\0'
         sb $t0,     21($sp)

#         sw $t2, 4($sp)
#         sw $t1, 0($sp)
         sw $t2, 26($sp)
         sw $t1, 22($sp)
#         la $a0, label
         move $a0, $sp
         li $v0, 4
         syscall
#         lw $t3, 4($sp)
#         lw $t4, 0($sp)
         lw $t3, 26($sp)
         lw $t4, 22($sp)
         mul $a0, $t3, $t4
         li $v0, 1
         syscall
#         addiu $sp, $sp, 8
         addiu $sp, $sp, 30
         li $v0, 10
         syscall
