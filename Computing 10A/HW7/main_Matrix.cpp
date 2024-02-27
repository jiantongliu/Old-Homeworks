#include "Matrix.h"
int main() 
{

	srand(time(0));
	Matrix A(3,5);
	Matrix B(3,5);
	Matrix C(3,5);

	C = A+B;
	ofstream fout;
	
	fout.open("out.txt");
	A.print(fout);
	B.print(fout);
	C.print(fout);
	fout.close();
	return 0;
}

