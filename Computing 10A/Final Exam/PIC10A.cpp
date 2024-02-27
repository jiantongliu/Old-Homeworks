/*  PIC 10A 3C, Final Exam
    Purpose: Create the PIC10A Class to calculate the student's final grade
    Author: Jiantong Liu
    Date: 03/19/2020 */
#include "PIC10A.h"
#include "Student.h"
#include <iomanip>


PIC10A::PIC10A() {
    studentsList.resize(0);
}

void PIC10A::addNewStudent(const Student& newStudent) {
    studentsList.push_back(newStudent);
}

void PIC10A::setFinalGrades() {
    for (int i = 0; i < studentsList.size(); i++)
    {
        double midterm_score = studentsList[i].getMidtermGrade();
        double number_of_homework = studentsList[i].getNumOfHomework();
        vector <double> homework_score = studentsList[i].getHomeworkGrades();
        double sum_homework_score = 0;
        for (int j = 0; j < number_of_homework; j++)
        {
            sum_homework_score = sum_homework_score + homework_score[j];
        }
        double final_score = studentsList[i].getFinalExamGrade();
        double option_1 = 0.3 * (sum_homework_score / (1.0*number_of_homework)) + 0.3 * midterm_score + 0.4 * final_score;
        double option_2 = 0.3 * (sum_homework_score / (1.0*number_of_homework)) + 0.7 * final_score;
        if (option_1 <= option_2)
            studentsList[i].setFinalGrade(option_2);
        else
            studentsList[i].setFinalGrade(option_1);
        
    }
}

void PIC10A::printAllStudents() const {
    for (int i = 0; i < studentsList.size(); i++)
        cout << "Name: " << studentsList[i].getName() << " ID: " << studentsList[i].getID() << " Final Grade: " << studentsList[i].getFinalGrade() << endl;
}

void PIC10A::printSummary() const {
    double sum_finalgrades = 0.0;
    for (int i = 0; i < studentsList.size(); i++)
    {
        sum_finalgrades += studentsList[i].getFinalGrade();
    }
    double average_finalgrades = sum_finalgrades /(studentsList.size()*1.0);
    cout << "Total Number of Students: " << studentsList.size() << " Average grade: " << average_finalgrades;
}
