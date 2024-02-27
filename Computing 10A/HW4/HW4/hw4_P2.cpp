/*  PIC 10A 3C, Homework 4
    Purpose: build a random walk robot
    Author: Jiantong Liu
    Date: 02/08/20
*/

#include <iostream>
#include <cmath>
#include <cstdlib>
#include <string>
#include <iomanip>
using namespace std;

int main() {
	srand(time(0));
	int x_position = 0;
	int y_position = 0;
	while (x_position != 5 && x_position != -5 && y_position != 5 && y_position != -5) {
		int direction = rand() % 4;
		string status;
		if (direction == 0) {
			y_position += 1;
			status = "Up";
		}
		else if (direction == 1) {
			y_position -= 1;
			status = "Down";
		}
		else if (direction == 2) {
			x_position += 1;
			x_position = int(x_position);
			status = "Right";
		}
		else if (direction == 3) {
			x_position -= 1;
			x_position = int(x_position);
			status = "Left";
		}
		cout << status << setw(10 - status.length()) << "(" << x_position << ", " << y_position << ")" << endl;

		if (x_position == 0 && y_position == 0) {
			cout << "Back to the origin!" << endl;
			break;
        }

		if (fabs(x_position) == 5 || fabs(y_position) == 5) {
			cout << "Hit the boundary!" << endl;
			break;
		}
		
	}
	return 0;
}
