//matrix.h
#ifndef MATRIX_H
#define MATRIX_H
#include <iostream>
#include <vector>
#include <fstream>
#include <cstdlib>
#include <ctime>

using namespace std;

class Matrix
{
public:
	Matrix();
	Matrix(int new_num_rows, int new_num_cols);
	
	Matrix operator+ (const Matrix& M2) const;
	
	void print(ofstream& fout) const;

private:
	int num_rows;
	int num_cols;
	vector<vector<int> > values;
};
#endif
