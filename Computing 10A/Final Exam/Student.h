#ifndef STUDENT_H
#define STUDENT_H

#include<iostream>
#include<vector>

using namespace std;

class Student
{
public:
	Student();
	Student(string newname, string newID, int newnumOfHomework);
	void setMidtermGrade(double newMidtermGrade);
	void setFinalExamGrade(double newFinalExamGrade);
	void setHomeworkGrades(const vector<double>& newHomeworkGrades);
	void setFinalGrade(double newFinalGrade);

	string getName() const;
	string getID() const;
	int getNumOfHomework() const;
	double getMidtermGrade() const;
	double getFinalExamGrade() const;
	vector<double> getHomeworkGrades() const;
	double getFinalGrade() const;

private:
	string name;
	string ID;
	int numOfHomework;
	double finalExamGrade;
	double midtermGrade;
	vector<double> homeworkGrades;
	double finalGrade;
};

#endif
