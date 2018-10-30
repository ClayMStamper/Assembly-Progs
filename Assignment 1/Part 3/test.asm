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
			
			
			
			
			
			
			
			li $v0, 10
			syscall