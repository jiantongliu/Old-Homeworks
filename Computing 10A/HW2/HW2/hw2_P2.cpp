 /*
  PIC 10A Section 3C, Homework 2
  Purpose: calculate the product of a given integer's digits
  Author: Jiantong Liu
  Date: 01/22/2020
*/


#include <iostream>

using namespace std;

int main() {
    cout << "Input an integer between 100 and 999:" << endl;
    int integer, product;
    cin >> integer; //user input the integer
	int digit_first, digit_second, digit_third;
    digit_first = integer/100;    //find out the first digit of the integer
    digit_second = integer/10 - integer/100*10;    //find out the second digit of the integer
    digit_third = integer - integer/10*10;    //find out the third digit of the integer
    product = digit_first * digit_second * digit_third; //calculate the product
    cout << "The product of digits is " << product << "." << endl; //return the output
    return 0;
}
