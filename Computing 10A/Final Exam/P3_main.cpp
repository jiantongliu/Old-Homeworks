
#include<iostream>
#include<vector>
#include<iomanip>
#include "PIC10A.h"
#include "Student.h"

using namespace std;

int main()
{
	int numOfHomework = 1;

	Student student("James", "123323", numOfHomework);

	vector<double> homeworkList;
	homeworkList.push_back(89);
	homeworkList.push_back(97);
	homeworkList.push_back(89);

	student.setHomeworkGrades(homeworkList);
	student.setMidtermGrade(79);
	student.setFinalExamGrade(89);

	PIC10A classroom;

	classroom.addNewStudent(student);
	classroom.setFinalGrades();

	classroom.printAllStudents();
	classroom.printSummary();
}
