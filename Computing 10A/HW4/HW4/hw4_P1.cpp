/*  PIC 10A 3C, Homework 4
    Purpose: estimate the area of a region
    Author: Jiantong Liu
    Date: 02/08/20
*/

#include <iostream>
#include <iomanip>
#include <cmath>
#include <cstdlib>

using namespace std;

int main(){
    srand(time(0));
    int i,j;
    int N=10;
    int dart_within, dart_outside;
    double x_coordinate, y_coordinate;
    double area_estimated, error;
    const double EXACT_AREA = 2.22144146907918;
    
    for (i=1; i<=6; i++){
        dart_within = 0;
        dart_outside = 0;
        for (j = 1; j<=pow(10,i); j++){
            x_coordinate = rand()*2.0/double(RAND_MAX) - 1.0;
            y_coordinate = rand()*2.0/double(RAND_MAX) - 1.0;
            if (pow(x_coordinate, 2) + 2 * pow(y_coordinate, 2) <= 1){
                dart_within += 1;
            }
            else if (pow(x_coordinate, 2) + 2 * pow(y_coordinate, 2) > 1){
                dart_outside += 1;
            }
        }
        area_estimated = dart_within / pow(10, i) * 4;
        error = fabs(area_estimated - EXACT_AREA);
        cout << "# darts: " << fixed << int(pow(N,i)) << setw(25 - i) << "estimated area = " << setprecision(5) << area_estimated << setw(11) << "error = " << setprecision(5) << error << endl;
    }
    return 0;
}
