#ifndef StudentClub_h
#define StudentClub_h

#include <iostream>
#include <string>
#include <vector>
using namespace std;
//#include <stdio.h>

class Student;
class StudentClub {
public:
    StudentClub(Student* p, Student* v, Student* s, Student* t, vector<Student*> m);
    Student* get_president() const;
    Student* get_vice_president() const;
    Student* get_secretary() const;
    Student* get_treasurer() const;
    vector<Student*> get_members() const;
    void add_member(Student* s);
    size_t number_members() const;
private:
    Student* president;
    Student* vicepresident;
    Student* secretary;
    Student* treasurer;
    vector<Student*> memberlist;
};

#endif /* StudentClub_h */
