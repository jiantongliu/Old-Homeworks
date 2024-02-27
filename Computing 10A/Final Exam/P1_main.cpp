/*  PIC 10A 3C, Final Exam
    Purpose: Random Matrix Generator
    Author: Jiantong Liu
    Date: 03/19/2020
    Cite: I used code from the powerpoint of Lecture 11 (Random Number)  as the formula of random integers and random decimal numbers.
*/

#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <vector>
#include <ctime>

using namespace std;

int main()
{
    int m,n,lower,upper;
    vector<double> v;

    cout << "Please input the dimension of the random matrix: ";
    cin >> n >> m; //give rows and columns
    cout << "Please input the range of the random numbers: ";
    cin >> lower >> upper; //give the minimum and maximum
    
    if (lower >= upper) {
        cout << "Input is not valid, try again. " << endl;
        return 0; //error test
    }
    
    cout << endl << "These random numbers have been generated: " << endl;
    
    srand(time(0));
    
    vector<vector<double> > vec(n , vector<double> (m));
      
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++){
            double decimal = rand()*1.0/RAND_MAX * (upper-lower) + lower; //decimal number generator
            int integer = rand()%(upper-lower+1) + lower; //integer generator
            if (j%2 == 0)
                vec[i][j] = decimal;
            if (j%2 == 1)
                vec[i][j] = integer;
        }
    }
      
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++){
            cout << fixed << setprecision(2) << vec[i][j] << "    ";
        }
        cout<< endl;
    }
    cout << endl;
    
    double largest_row;
    cout << "The largest numbers per row are: " << endl;
    for (int i = 0; i < n; i++) {
        largest_row = vec[i][0];
        for (int j = 1; j < m; j++) {
            if (vec[i][j] > largest_row)
                largest_row = vec[i][j];
        }
        cout << largest_row << endl;
    }
    cout << endl;
    
    double largest_column;
    cout << "The largest numbers per column are: " << endl;
    for (int i = 0; i < m; i++) {
        largest_column = vec[0][i];
        for (int j = 1; j < n; j++) {
            if (vec[j][i] > largest_column)
                largest_column = vec[j][i];
        }
        cout << largest_column << "    ";
    }
    cout << endl;
    return 0;
}
