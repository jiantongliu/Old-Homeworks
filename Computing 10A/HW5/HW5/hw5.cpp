/*
PIC 10A 3C, Homework 5
Purpose: build up a menu with some functions
Author: Jiantong Liu
Date: 02/20/20
*/

#include <iostream>
using namespace std;


void displayMenu() {
    cout << "================== MENU ==================" << endl;
    cout << "1. Output the largest" << endl;
    cout << "2. Get the next permutation" << endl;
    cout << "3. Sort in ascending order" << endl;
    cout << "Enter your choice (1 - 3), Q to quit: ";
}

int largest(int a, int b, int c){
    cout << "The largest number among the three is: ";
    int largest = a;
    if (largest <= b)
        largest = b;
    if (largest <= c)
        largest = c;
    cout << largest << endl << endl;
    return 0;
}

void myPermutation(int& a, int& b, int& c){
    int helper = c;
    c = b;
    b = a;
    a = helper;
    cout << "After one permutation: " << a << " " << b << " " << c << endl << endl;
}

void mySort(int& a, int& b, int& c){
    cout << "After sorting: ";
    if (a <= b && a <= c && c <= b){
		int temp = c;
		c = b;
		b = temp;
    }
    
	else if (a >= b && a <= c) {
		int temp = a;
		a = b;
		b = temp;
	}
    
	else if (a >= c && a <= b) {
		int temp = a;
		a = c;
		c = b;
		b = temp;
	}
    
    else if (a >= b && a >= c){
		int temp = a;
		if (b <= c) {
			a = b;
			b = c;
			c = temp;
		}
		else if (b >= c) {
			a = c;
			c = temp;
		}
    }
	cout << a << " " << b << " " << c << endl << endl;

}

int main(){
    cout << "Enter your three integer numbers:" << endl;
    int a,b,c;
    char directions;
    cin >> a;
    cin >> b;
    cin >> c;
    displayMenu();
    cin >> directions;
    cout << endl;
    while (directions != 'Q' && directions != 'q'){
        if (directions == '1')
            largest(a,b,c);
        
        if (directions == '2')
            myPermutation(a,b,c);
        
        if (directions == '3')
            mySort(a,b,c);
        
        displayMenu();
        cin >> directions;
    }
    
    if (directions == 'Q' || directions == 'q') {
        cout << "Exit the menu" << endl << endl;
        return 0;
    }

}
