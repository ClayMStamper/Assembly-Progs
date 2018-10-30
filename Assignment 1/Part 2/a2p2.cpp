//Clayton Stamper, CS 2318-004, Assignment 02 (Part 2)
//The purpose of this assignment is to conver conditions
//and loops to goto statetments

#include <iostream>
using namespace std;

int a1[12],
    a2[12],
    a3[12];
char einStr[]    = "Enter integer #";
char moStr[]     = "Max of ";
char ieStr[]     = " ints entered...";
char emiStr[]    = "Enter more ints? (n or N = no, others = yes) ";
char begA1Str[]  = "beginning a1: ";
char procA1Str[] = "processed a1: ";
char commA2Str[] = "          a2: ";
char commA3Str[] = "          a3: ";
char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
char dlStr[]     = "================================";
char byeStr[]    = "bye...";

int main()
{
               char reply;
               int used1,
                   used2,
                   used3,
                   target,
                   total,
                   mean,
                   *hopPtr1,
                   *hopPtr2,
                   *hopPtr21,
                   *hopPtr3,
                   *endPtr1,
                   *endPtr2,
                   *endPtr3;

               cout << endl;
               reply = 'y';
//               while (reply != 'n' && reply != 'N')
goto WTest1;
begW1: //              {
                  used1 = 0;
                  used2 = 0;
                  used3 = 0;
                  hopPtr1 = a1;
//                while (reply != 'n' && reply != 'N')
goto WTest2;
begW2: //                  {
                     cout << einStr;
                     cout << (used1 + 1);
                     cout << ':' << ' ';
                     cin >> *hopPtr1;
                     ++used1;
                     ++hopPtr1;
//                     if (used1 < 12)
                     if (used1 >= 12) goto else1;
begI1: //                     {
                        cout << emiStr;
                        cin >> reply;
                        goto endI1;
       //              }
else1: //                     else
//                     {
                        cout << moStr << 12 << ieStr << endl;
                        reply = 'n';
endI1://                     }

WTest2: if (reply != 'n' && reply != 'N') goto begW2;
endW2: //                  }
                  cout << endl;

//                  if (used1 > 0)
                  if (used1 <= 0) goto endI2;
begI2: //                 {
                     total = 0;
                     for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                     {
                        target = *hopPtr1;
                        total += target;
//                        if (target % 2 == 1)
                        if (target % 2 != 1) goto else3;
begI3: //                        {
                           hopPtr3 = a3 + used3 - 1;
                           endPtr3 = a3;
                           while (hopPtr3 >= endPtr3)
                           {
//                              if (*hopPtr3 > target)
                              if (*hopPtr3 <= target) goto else4;
begI4: //                              {
                                 *(hopPtr3 + 1) = *hopPtr3;
                                 --hopPtr3;
                                 goto endI4;
       //                       }
else4: //                              else
      //                        {
                                 break;
endI4: //                              }
                           ;}
                           *(hopPtr3 + 1) = target;
                           ++used3;
                           goto endI3;
 //                       }
 else3: //                       else
        //                {

                           hopPtr2 = a2;
                           endPtr2 = a2 + used2;
                           while (hopPtr2 < endPtr2)
                           {
 //                             if (*hopPtr2 >= target)
                              if (*hopPtr2 < target) goto else5;
begI5: //                              {
                                 hopPtr21 = endPtr2;
                                 while (hopPtr21 > hopPtr2)
                                 {
                                    *hopPtr21 = *(hopPtr21 - 1);
                                    --hopPtr21;
                                 }
                                 break;
       //                       }
else5: //                              else
       //                       {
                                 ++hopPtr2;
 endI5: //                             }
                           ;}
                           *hopPtr2 = target;
                           ++used2;
 endI3: //                       }
                        mean = total/used1;
                     }

                     cout << begA1Str;
//                     if (used1 > 0)
                     if (used1 <= 0) goto endI6;
begI6: //                     {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        do
                        {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
                        }
                        while (hopPtr1 < endPtr1);
endI6: //                     }
                     cout << endl;

                     cout << commA2Str;
//                     if (used2 > 0)
                     if (used2 <= 0) goto endI7;
begI7: //                     {
                        hopPtr2 = a2;
                        endPtr2 = a2 + used2;
                        do
                        {
                           cout << *hopPtr2 << ' ' << ' ';
                           ++hopPtr2;
                        }
                        while (hopPtr2 < endPtr2);
endI7: //                     }
                     cout << endl;

                     cout << commA3Str;
//                     if (used3 > 0)
                     if (used3 <= 0) goto endI8;
begI8: //                     {
                        hopPtr3 = a3;
                        endPtr3 = a3 + used3;
                        do
                        {
                           cout << *hopPtr3 << ' ' << ' ';
                           ++hopPtr3;
                        }
                        while (hopPtr3 < endPtr3);
endI8: //                     }
                     cout << endl;

                     hopPtr1 = a1;
                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     endPtr2 = a2 + used2;
                     endPtr3 = a3 + used3;
                     while (hopPtr2 < endPtr2 && hopPtr3 < endPtr3)
                     {
//                        if (*hopPtr2 < *hopPtr3)
                        if (*hopPtr2 >= *hopPtr3) goto else9;
begI9: //                        {
                           *hopPtr1 = *hopPtr2;
                           ++hopPtr2;
                           goto endI9;
       //                 }
else9: //                        else
       //                 {
                           *hopPtr1 = *hopPtr3;
                           ++hopPtr3;
endI9: //                        }
                        ++hopPtr1;
                     ;}
                     while (hopPtr2 < endPtr2)
                     {
                        *hopPtr1 = *hopPtr2;
                        ++hopPtr2;
                        ++hopPtr1;
                     }
                     while (hopPtr3 < endPtr3)
                     {
                        *hopPtr1 = *hopPtr3;
                        ++hopPtr3;
                        ++hopPtr1;
                     }

                     hopPtr2 = a2;
                     hopPtr3 = a3;
                     used2 = 0;
                     used3 = 0;
                     for (hopPtr1 = a1, endPtr1 = a1 + used1; hopPtr1 < endPtr1; ++hopPtr1)
                     {
                        target = *hopPtr1;
 //                       if (target < mean)
                        if (target >= mean) goto else10;
begI10: //                        {
                           *hopPtr2 = target;
                           ++used2;
                           ++hopPtr2;
                           goto endI10;
        //                }
else10: //                        else
        //                {
                           if (target > mean)
                           {
                              *hopPtr3 = target;
                              ++used3;
                              ++hopPtr3;
                           }
endI10: //                        }
                     ;}

                     cout << procA1Str;
//                     if (used1 > 0)
                     if (used1 <= 0) goto endI11;
begI11: //                     {
                        hopPtr1 = a1;
                        endPtr1 = a1 + used1;
                        do
                        {
                           cout << *hopPtr1 << ' ' << ' ';
                           ++hopPtr1;
                        }
                        while (hopPtr1 < endPtr1);
endI11: //                     }
                     cout << endl;

                     cout << commA2Str;
 //                    if (used2 > 0) g
                     if (used2 <= 0) goto endI12;
begI12: //                     {
                        hopPtr2 = a2;
                        endPtr2 = a2 + used2;
                        do
                        {
                           cout << *hopPtr2 << ' ' << ' ';
                           ++hopPtr2;
                        }
                        while (hopPtr2 < endPtr2);
endI12: //                     }
                     cout << endl;

                     cout << commA3Str;
//                     if (used3 > 0)
                     if (used3 <= 0) goto endI13;
begI13: //                     {
                        hopPtr3 = a3;
                        endPtr3 = a3 + used3;
                        do
                        {
                           cout << *hopPtr3 << ' ' << ' ';
                           ++hopPtr3;
                        }
                        while (hopPtr3 < endPtr3);
endI13: //                     }
                     cout << endl;
endI2: //                  }

                  cout << endl;
                  cout << dacStr;
                  cin >> reply;
                  cout << endl;
 WTest1: if (reply != 'n' && reply != 'N') goto begW1;
 endW1: //              }

               cout << dlStr << '\n';
               cout << byeStr << '\n';
               cout << dlStr << '\n';

               return 0;
}

