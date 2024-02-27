/*  PIC 10A 3C, Final Exam
    Purpose: Create the Student Class to calculate the student's final grades
    Author: Jiantong Liu
    Date: 03/19/2020
 */
#include "Student.h"

Student::Student():name(""), ID(""), numOfHomework(0), finalExamGrade(0), midtermGrade(0), finalGrade(0) {
    homeworkGrades.resize(0);
}

Student::Student(string newname, string newID, int newnumOfHomework) {
    name = newname;
    ID = newID;
    numOfHomework = newnumOfHomework;
}

void Student::setMidtermGrade(double newMidtermGrade) {
    midtermGrade = newMidtermGrade;
}

void Student::setFinalExamGrade(double newFinalExamGrade) {
    finalExamGrade = newFinalExamGrade;
}

void Student::setHomeworkGrades(const vector<double>& newHomeworkGrades) {
    homeworkGrades = newHomeworkGrades;
}

void Student::setFinalGrade(double newFinalGrade) {
    finalGrade = newFinalGrade;
}

string Student::getName() const {
    return name;
}

string Student::getID() const {
    return ID;
}

int Student::getNumOfHomework() const {
    return homeworkGrades.size();
}

double Student::getMidtermGrade() const {
    return midtermGrade;
}

double Student::getFinalExamGrade() const {
    return finalExamGrade;
}

vector<double> Student::getHomeworkGrades() const {
    return homeworkGrades;
}

double Student::getFinalGrade() const {
    return finalGrade;
}

