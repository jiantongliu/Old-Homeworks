#include "StudentClub.h"
#include <vector>
#include "Student.h"
using namespace std;

StudentClub::StudentClub(Student* p, Student* v, Student* s, Student* t, vector<Student*> m) : president(p), vicepresident(v), secretary(s), treasurer(t), memberlist(m) {
}

Student* StudentClub::get_president() const {
    return president;
}

Student* StudentClub::get_vice_president() const {
    return vicepresident;
}

Student* StudentClub::get_secretary() const {
    return secretary;
}

Student* StudentClub::get_treasurer() const {
    return treasurer;
}

vector<Student*> StudentClub::get_members() const {
    return memberlist;
}

void StudentClub::add_member(Student* s) {
    bool flag = 0;
    for (int i = 0; i < memberlist.size(); i++) {
        if (memberlist[i]->getName() == s->getName())
            flag = 1;
    }
    if (flag == 0) {
        memberlist.push_back(s);
    }
}

size_t StudentClub::number_members() const {
    return memberlist.size();
}
