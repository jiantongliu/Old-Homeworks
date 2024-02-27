#ifndef PIC10A_H
#define PIC10A_H

#include<iostream>
#include<vector>
#include<iomanip>
#include "Student.h"
class PIC10A
{
public:
	PIC10A();
	void addNewStudent(const Student& newStudent);
	void setFinalGrades();
	void printAllStudents() const;
	void printSummary() const;
private:
	vector<Student> studentsList;
};

#endif