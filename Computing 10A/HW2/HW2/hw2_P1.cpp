 /*
  PIC 10A Section 3C, Homework 2
  Purpose: verify a trigonometry identity
  Author: Jiantong Liu
  Date: 01/22/2020
*/


#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;

int main() {
    const double PI = 3.14159265;	//give the constant pi
    cout << "What is the degree of angle A?" << endl;
    double degree_alpha, degree_beta;
    double Left_Hand_Side, Right_Hand_Side;
    cin >> degree_alpha;
    degree_alpha = degree_alpha / 180 * PI;	//convert the angle into radians
    cout << "What is the degree of angle B?" << endl;
    cin >> degree_beta;
    degree_beta = degree_beta / 180 * PI;	//convert the angle into radians
    Left_Hand_Side = sin(degree_alpha) * cos(degree_beta);	//calculate the answer from the left-hand-side
    Right_Hand_Side = 0.5 * (sin(degree_alpha + degree_beta) + sin(degree_alpha - degree_beta));	//calculate the answer from the right-hand-side
    if (fabs(Left_Hand_Side) < 0.00001)
        Left_Hand_Side = 0;
    if (fabs(Right_Hand_Side) < 0.00001)
        Right_Hand_Side = 0;
    cout << "The left-hand-side of the trig identity evaluates to " << Left_Hand_Side << "." << endl;	//output the result of left-hand-side
    cout << "The right-hand-side of the trig identity evaluates to " << Right_Hand_Side << "." << endl;	//output the result of right-hand-side
    return 0;
}
