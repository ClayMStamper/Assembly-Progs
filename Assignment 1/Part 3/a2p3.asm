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
			################################################
# Register usage:
#################
# $a1: endPtr1
# $a2: endPtr2
# $a3: endPtr3
# $t0: store-to address or temp-holder 2 (non-overlappingly)
# $t1: used1
# $t2: used2
# $t3: used3
# $t4: target
# $t5: hopPtr1
# $t6: hopPtr2
# $t7: hopPtr3
# $t8: hopPtr21 or mean (overlap with no harm)
# $t9: total
# $v1: reply or temp-holder 1 (non-overlappingly)
################################################

#int main()
#{
#               char reply;
#               int used1,
#                   used2,
#                   used3,
#                   target,
#                  total,
#                   mean,
#                   *hopPtr1,
#                   *hopPtr2,
#                   *hopPtr21,
#                   *hopPtr3,
#                   *endPtr1,
#                   *endPtr2,
#                   *endPtr3;

			

#               cout << endl;
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
			li $t1, 0
			li $t2, 0
			li $t3, 0

#                  hopPtr1 = a1;
			la $t5, a1
			
#                  //while (reply != 'n' && reply != 'N')		
#                  goto WTest2;
			j WTest2	
begW2:#//          {
      #               cout << einStr;
      			li $v0, 4
      			la $a0, einStr	
#                     cout << (used1 + 1);
			addi $a0, $t1, 1
			li $v0, 1
			syscall
                     #cout << ':' << ' ';
                     	li $v0, 11
                     	li $a0, ':'
              		syscall
              		li $a0, ' '
              		syscall
#                     cin >> *hopPtr1;
			li $v0, 12
			syscall
			sw $v0, 0($t5)
 #                    ++used1;
 			addi $t1, $t1, 1
#                     ++hopPtr1;
			addi $t5, $t5, 4			
#                     //if (used1 < 12)
#                     if (used1 >= 12) goto elseI1;
			li $t0, 12
			bge $t1, $t0, elseI1
begI1:#//             {
#                        cout << emiStr;
			li $v0, 4
			la $a0, emiStr
			syscall
 #                       cin >> reply;
 			li $v0, 12
 			syscall
 			move $v1, $v0
#                     goto endI1;
			j endI1
#//                   }
elseI1:#//             else
#//                   {
#                        cout << moStr << 12 << ieStr << endl;
			li $v0, 4
			la $a0, moStr
			syscall
			li $v0, 1
			li $a0, 12
			syscall
			li $v0, 4
			la $a0, ieStr
			syscall
			li $v0, 11
			li $a0, '\n'
#                        reply = 'n';
			li $v1, 'n'
endI1:#//             }
WTest2:#//         }
 #                 ////if (reply != 'n' && reply != 'N') goto begW2;
#                  if (reply == 'n') goto xitW2;
			li $t0, 'n'
			beq $v1, $t0, xitW2
#                  if (reply != 'N') goto begW2;
			li $t0, 'N'
			bne, $v1, $t0, begW1
xitW2:
#                  cout << endl;
                 	 li $v0, 11
                 	 li $a0, '\n'
                  	syscall

#                  //if (used1 > 0)
#                  if (used1 <= 0) goto endI2;
			ble $t1, $zero, endI2
begI2:#//          {
#                     total = 0;
			li $t9, 0
			
 #                   //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
 #                    hopPtr1 = a1;
 			la $t5, a1
 #                    endPtr1 = a1 + us	ed1;
                     	la $a1, a1
			add $a1, $a1, $t1
#                     goto FTest1;
			j FTest1
begF1:#//             {
#                        target = *hopPtr1;
                        move $t4, $t5
#                        total += target;
			add $t9, $t9, $t4
 #                       //if (target % 2 == 1)
 #                       ////if (target % 2 != 1) goto elseI3;
#                        if ( (target & 1) != 1) goto elseI3;
			andi $v1, $t4, 1
			beqz $v1, elseI3
begI3:#//                {
#                           hopPtr3 = a3 + used3 - 1;
			la $v1, a3
			sll $t7, $t3, 2 #// hopPtr3 = used3^2
			addi $t7, $t7, -4 #// hopPtr3 = hopPtr3 - 4
			add $t7, $t7, $v1 #// hopPtr3 = hopPtr3 + a3
			
#                           endPtr3 = a3;
			move $a3, $v1
#                           //while (hopPtr3 >= endPtr3)
 #                          goto WTest3;
 			j WTest3
begW3:#//                   {
#                              //if (*hopPtr3 > target)
#                              if (*hopPtr3 <= target) goto elseI4;
			lw $v1, 0($t5)
			ble $v1, $t4, elseI4
begI4:#//                      {
 #                                *(hopPtr3 + 1) = *hopPtr3;
 			lw $v1, 0($t7)
 			sw $v1, 4($t7)
 			
#                                 --hopPtr3;
			addi $t7, $t7, -4
			
#                              goto endI4;
			j endI4
#//                            }
elseI4:#//                      else
#//                            {
#                                 //break;
#                                 goto brk1;
			j brk1
endI4:#//                      }
WTest3:#//                  }
#                           if (hopPtr3 >= endPtr3) goto begW3;
			bge $t7, $a3, begW3
brk1#:
#                           *(hopPtr3 + 1) = target;
			sw $t4, 4($t7)
#                           ++used3;
			addi $t3, $t3, 1
#                        goto endI3;
			j endI3
#//                      }
elseI3:#//                else
#//                      {
#                           hopPtr2 = a2;
			la $t6, a2
#                           endPtr2 = a2 + used2;
			add $a2, $t6, $t2
#                           //while (hopPtr2 < endPtr2)
#                           goto WTest4;
			j WTest4
begW4:#//                   {
#                              //if (*hopPtr2 >= target)
#                              if (*hopPtr2 < target) goto elseI5;
			lw $v1, 0($t6)
			blt $v1, $t4, elseI5
begI5:#//                      {
#                                 hopPtr21 = endPtr2;
			move $t8, $t6
 #                                ///while (hopPtr21 > hopPtr2)
#                                 goto WTest5;
			j WTest5
begW5:#//                         {
#                                    *hopPtr21 = *(hopPtr21 - 1);
			lw $v1, -4($t8)
			sw $v1 0($t8)
#                                    --hopPtr21;
			addi $t8, -4
WTest5:#//                        }
#                                 if (hopPtr21 > hopPtr2) goto begW5;
			bgt $t8, $t6, begW5

#                                 ///break;
#                                 goto brk2;
			j brk2
#                           ///goto endI5; // unreacheable
#//                            }
#elseI5://                      else
#//                            {
#                                 ++hopPtr2;
			addi $6, $t6 4
endI5:#//                      }
WTest4:#//                  }
#                           if (hopPtr2 < endPtr2) goto begW4;
			blt $t6, $a2, begW4
brk2:
#                           *hopPtr2 = target;
			sw $t4, 0($t6)
#                           ++used2;
			addi $t2, $t2, 1
endI3:#//                }
#                        mean = total/used1;
			div $t9, $t1
			mflo $t7
 #                    ++hopPtr1;
 			addi $t5, $t5, 4
FTest1:#//            }
#                     if (hopPtr1 < endPtr1) goto begF1;
			blt $t5, $a1, begF1

#                     cout << begA1Str;
			li $v0, 4
			la $a0, begA1Str
			syscall
#                     //if (used1 > 0)
#                     if (used1 <= 0) goto endI6;
                     	ble $t1, $zero, endI6
begI6:#//             {
#                        hopPtr1 = a1;
			la $t5, a1
#                        endPtr1 = a1 + used1;
			add $a1, $t5, $t1
#//                      do
begDW1:#//               {
#                           cout << *hopPtr1 << ' ' << ' ';
			lw $v1, 0($t5)
			li $v0, 1
			move $a0, $v1
			syscall
			li $v0, 11
			li $a0 ' '
			syscall
			syscall			####
			
#                           ++hopPtr1;
			addi $t5, $t5, 4
DWTest1:#//              }
#                        //while (hopPtr1 < endPtr1);
 #                       if (hopPtr1 < endPtr1) goto begDW1;
 			blt $t5, $a1, begDW1
endI6:#//             }
#                     cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall

#                     cout << commA2Str;
                     	li $v0, 4
                     	li $a0, commAStr
                     	syscall
#                     //if (used2 > 0)
#                     if (used2 <= 0) goto endI7;
			ble $t2, $zero, endI7
begI7:#//             {
#                        hopPtr2 = a2;
			la $t6, a2
#                        endPtr2 = a2 + used2;
			add $a2, $t6, $t2
#//                      do
begDW2:#//               {
#                           cout << *hopPtr2 << ' ' << ' ';
			li $v0, 1
			lw $a0, 0($t6)
			syscall
			li $v0, 11
			li $a0 ' '
			syscall
			syscall			####
#                           ++hopPtr2;
			add $t6, $t6, 4
DWTest2:#//              }
#                        //while (hopPtr2 < endPtr2);
 #                       if (hopPtr2 < endPtr2) goto begDW2;
 			blt $t6, $a2, begDW2
endI7:#//             }
#                     cout << endl;
			li $v0, 11
			li $a0, '\n'
			syscall

#                     cout << commA3Str;
			li $v0, 4
			la $a0, commA3Str
			syscall
			
#                     //if (used3 > 0)
#                     if (used3 <= 0) goto endI8;
			ble $ $t3, $zero, endI8
begI8:#//             {
#                        hopPtr3 = a3;
			la $t7, a3
#                        endPtr3 = a3 + used3;
			add $a3, $t7, $t3
#//                      do
begDW3:#//               {
#                           cout << *hopPtr3 << ' ' << ' ';
			li $v0, 4
			lw $a0, 0($t7)
			li $v0, 11
			li $a0 ' '
			syscall
			syscall			####
			
#                           ++hopPtr3;
			addi $t7, $t7, 4
DWTest3:#//              }
                        //while (hopPtr3 < endPtr3);
                        if (hopPtr3 < endPtr3) goto begDW3;
endI8://             }
                     cout << endl;

                     hopPtr1 = a1;
                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     endPtr2 = a2 + used2;
                     endPtr3 = a3 + used3;
                     //while (hopPtr2 < endPtr2 && hopPtr3 < endPtr3)
                     goto WTest6;
begW6://             {
                        //if (*hopPtr2 < *hopPtr3)
                        if (*hopPtr2 >= *hopPtr3) goto elseI9;
begI9://                {
                           *hopPtr1 = *hopPtr2;
                           ++hopPtr2;
                        goto endI9;
//                      }
elseI9://                else
//                      {
                           *hopPtr1 = *hopPtr3;
                           ++hopPtr3;
endI9://                }
                        ++hopPtr1;
WTest6://            }
                     ////if (hopPtr2 < endPtr2 && hopPtr3 < endPtr3) goto begW6;
                     if (hopPtr2 >= endPtr2) goto xitW6;
                     if (hopPtr3 < endPtr3) goto begW6;
xitW6:
                     //while (hopPtr2 < endPtr2)
                     goto WTest7;
begW7://             {
                        *hopPtr1 = *hopPtr2;
                        ++hopPtr2;
                        ++hopPtr1;
WTest7://            }
                     if (hopPtr2 < endPtr2) goto begW7;

                     //while (hopPtr3 < endPtr3)
                     goto WTest8;
begW8://             {
                        *hopPtr1 = *hopPtr3;
                        ++hopPtr3;
                        ++hopPtr1;
WTest8://            }
                     if (hopPtr3 < endPtr3) goto begW8;

                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     used2 = 0;
                     used3 = 0;
                     //for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                     hopPtr1 = a1;
                     endPtr1 = a1 + used1;
                     goto FTest2;
begF2://             {
                        target = *hopPtr1;
                        //if (target < mean)
                        if (target >= mean) goto elseI10;
begI10://               {
                           *hopPtr2 = target;
                           ++used2;
                           ++hopPtr2;
                        goto endI10;
//                      }
elseI10://               else
//                      {
                           //if (target > mean)
                           if (target <= mean) goto endI11;
begI11://                  {
                              *hopPtr3 = target;
                              ++used3;
                              ++hopPtr3;
endI11://                  }
endI10://               }
                     ++hopPtr1;
FTest2://            }
                     if (hopPtr1 < endPtr1) goto begF2;

                     cout << procA1Str;
                     //if (used1 > 0)
                     if (used1 <= 0) goto endI12;
begI12://            {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        //do
begDW4://               {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
DWTest4://               }
                        //while (hopPtr1 < endPtr1);
                        if (hopPtr1 < endPtr1) goto begDW4;
endI12://            }
                     cout << endl;

                     cout << commA2Str;
                     //if (used2 > 0)
                     if (used2 <= 0) goto endI13;
begI13://            {
                        hopPtr2 = a2;
                        endPtr2 = a2 + used2;
                        //do
begDW5://               {
                           cout << *hopPtr2 << ' ' << ' ';
                           ++hopPtr2;
DWTest5://               }
                        //while (hopPtr2 < endPtr2);
                        if (hopPtr2 < endPtr2) goto begDW5;
endI13://            }
                     cout << endl;

                     cout << commA3Str;
                     //if (used3 > 0)
                     if (used3 <= 0) goto endI14;
begI14://            {
                        hopPtr3 = a3;
                        endPtr3 = a3 + used3;
                        //do
begDW6://               {
                           cout << *hopPtr3 << ' ' << ' ';
                           ++hopPtr3;
DWTest6://               }
                        //while (hopPtr3 < endPtr3);
                        if (hopPtr3 < endPtr3) goto begDW6;
endI14://            }
                     cout << endl;
endI2://          }

                  cout << endl;
                  cout << dacStr;
                  cin >> reply;
                  cout << endl;
WTest1:#//      }
#               ////if (reply != 'n' && reply != 'N') goto begW1;
#               if (reply == 'n') goto xitW1;
			li $t0, 'n'
			beq $v1, $t5, xitW1
#               if (reply != 'N') goto begW1;
			li $t0, 'N'
			bne, $v1, $t0, begW1
xitW1:
               cout << dlStr << '\n';
               cout << byeStr << '\n';
               cout << dlStr << '\n';

               return 0;
}

