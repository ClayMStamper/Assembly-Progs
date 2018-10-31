###############################################################################
# Title: Assign02P3                   Author: Clayton Stamper
# Class: CS 2318-004, Fall 2018       Submitted: 11/1/2018
###############################################################################
# Program: MIPS tranlation of a given C++ program
###############################################################################
# Pseudocode description: supplied a2p2_SampSoln.cpp
###############################################################################

#include <iostream>
#using namespace std;




#int a1[12],
#    a2[12],
#    a3[12];
#char einStr[]    = "Enter integer #";
#char moStr[]     = "Max of ";
#char ieStr[]     = " ints entered...";
#char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
#char begA1Str[]  = "beginning a1: ";
#char procA1Str[] = "processed a1: ";
#char commA2Str[] = "          a2: ";
#char commA3Str[] = "          a3: ";
#char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
#char dlStr[]     = "================================";
#char byeStr[]    = "bye...";

			.data
a1:			.space, 48
a2:			.space, 48
a3: 			.space, 48
einStr:			.asciiz, "\nEnter integer #"
moStr:			.asciiz, "Max of "
ieStr:			.asciiz, " ints entered..."
emiStr:    		.asciiz, "Enter more ints? (n or N = no, others = yes) "
begA1Str:  		.asciiz, "beginning a1: "
procA1Str:  		.asciiz, "processed a1: "
commA2Str: 		.asciiz, "          a2: "
commA3Str:  		.asciiz, "          a3: "
dacStr:     		.asciiz,  "Do another case? (n or N = no, others = yes) "
dlStr:     		.asciiz,  "================================"
byeStr:    		.asciiz,  "bye..."

			.text
			.globl main
			
main:
			
			li $v0, 11
			li $a0, '\n'
			syscall
#               reply = 'y';
			li $v1, 'y'
#               //while (reply != 'n' && reply != 'N')
#               goto WTest1;
			j WTest1
begW1:#//       {
#                  used1 = 0;
#                  used2 = 0;
#                  used3 = 0;
			li $t0, 0
			li $t1, 0
			li $t2, 0

#                  hopPtr1 = a1;
			la $t5, a1
			
#                  //while (reply != 'n' && reply != 'N')		
#                  goto WTest2;
#			j WTest2	
begW2:#//          {
      #               cout << einStr;
      			li $v0, 4
      			la $a0, einStr	
#                     cout << (used1 + 1);
			addi $a0, $t0, 1
			li $v0, 1
			syscall
                     #cout << ':' << ' ';
                     	li $v0, 11
                     	li $a0, ':'
              		syscall
              		li $a0, ' '
              		syscall
			

			
WTest1:#//      }
#               ////if (reply != 'n' && reply != 'N') goto begW1;
#               if (reply == 'n') goto xitW1;
			li $t5, 'n'
			beq $v1, $t5, xitW1
#               if (reply != 'N') goto begW1;
			li $t5, 'N'
			bne, $v1, $t5, begW1
xitW1:
			
			
##########################################################			
			
			li $v0, 10
			syscall
