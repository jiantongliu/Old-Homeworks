/*
    PIC 10A Section 3C, Homework 1
    Purpose: miles to kilometers and feet converter
    Author: Jiantong Liu
    Date: 01/09/2020
*/

#include <iostream>
using namespace std;

int main(){
    cout << "Please input the amount of miles you want to convert:" << endl;    //output the question
    const double MILES_TO_KILOMETERS = 1.609;    //give the ratio of 1 kilometer and 1 mile
    const int MILES_TO_FEET = 5280;    //give the ratio of 1 foot and 1 mile
    double number_miles;
    cin >> number_miles;    //take input of the number of miles
    double number_kilometers;
    number_kilometers = number_miles * MILES_TO_KILOMETERS;    //calculate kilometers
    double number_feet;
    number_feet = number_miles * MILES_TO_FEET;    //calculate feet
    cout << "This converts to \"" << number_kilometers << " kilometers\" and \"" << number_feet << " feet\". ";    //output the answer
    
    return 0;
}

