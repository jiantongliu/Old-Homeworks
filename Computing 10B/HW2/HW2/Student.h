#ifndef Student_h
#define Student_h

#include <iostream>
#include <string>
#include <vector>
using namespace std;
//#include <stdio.h>

class Student {
public:
    Student();
    Student(string studentName);
    string getName() const;
private:
    string name;
};

#endif /* Student_h */
