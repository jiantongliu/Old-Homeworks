 /*
  PIC 10A Section 3C, Homework 3
  Purpose: calculate the student's final score
  Author: Jiantong Liu
  Date: 02/01/2020
*/

#include <iostream>
#include <string>
using namespace std;

double midterm, final_exam, hw_sum, hw_score, hw_average, scheme_a, scheme_b, lowest_hw, final_score;
int N, i;
string course_grade;

int main(){
    hw_sum = 0;
    lowest_hw = 100;
    cout << "Please enter the midterm exam score (0 - 100): ";
    cin >> midterm;
    cout << "Please enter the final exam score (0 - 100): ";
    cin >> final_exam;
    cout << "Please enter the number of homework assignments (3 - 7): ";
    cin >> N;
    
    for (i=1; i<=N; i++) {
        cout << "Please enter the homework " << i << " score (0 - 100): ";
        cin >> hw_score;
        hw_sum += hw_score;
        if (lowest_hw > hw_score)
            lowest_hw = hw_score;
    }
    
    hw_average = (hw_sum - lowest_hw) / (N-1);
    scheme_a = 0.35 * midterm + 0.4 * final_exam + 0.25 * hw_average;
    cout << "Your final score based on Scheme A is " << scheme_a << endl;
    scheme_b = 0.7 * final_exam + 0.3 * hw_average;
    cout << "Your final score based on Scheme B is " << scheme_b << endl;
    final_score = fmax(scheme_a, scheme_b);
    cout << "Your final score is " << final_score << endl;
    if (final_score <= 100 && final_score >= 90)
        course_grade = "A";
    else if (final_score < 90 && final_score >= 80)
        course_grade = "B";
    else if (final_score < 80 && final_score >= 70)
        course_grade = "C";
    else if (final_score <70 && final_score >= 60)
        course_grade = "D";
    else if (final_score <60 && final_score >= 0)
        course_grade = "F";
    cout << "Your course grade is " << course_grade << endl;
    return 0;
}
