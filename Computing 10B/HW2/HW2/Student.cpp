#include "Student.h"
#include <string>
#include <vector>
using namespace std;

Student::Student() : name("") {
}

Student::Student(string studentName) : name(studentName) {
}

string Student::getName() const {
    return name;
}
