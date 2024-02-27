#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
#include "Student.h"
#include "StudentClub.h"

using namespace std;

int main() {
    vector<Student*> memberlist;
    string presidentName, vpName, secretaryName, treasurerName;
    cout << "President: ";
    //cin >> presidentName;
    getline(cin, presidentName);
    Student* president = new Student(presidentName);
    cout << "Vice-President: ";
    //cin >> vpName;
    getline(cin, vpName);
    Student* vp = new Student(vpName);
    cout << "Secretary: ";
    //cin >> secretaryName;
    getline(cin, secretaryName);
    Student* secretary = new Student(secretaryName);
    cout << "Treasurer: ";
    //cin >> treasurerName;
    getline(cin,treasurerName);
    Student* treasurer = new Student(treasurerName);
    
    StudentClub club(president, vp, secretary, treasurer, memberlist);
    
    club.add_member(president);
    club.add_member(vp);
    club.add_member(secretary);
    club.add_member(treasurer);

    string membername;
    do {
        cout << "New member (Q to quit): ";
        getline(cin, membername);
        if (membername != "Q") {
            Student* member = new Student(membername);
            club.add_member(member);
        }
    }
    while (membername != "Q");
    
    //output
    cout << "MATHELETES( " << club.number_members() << " total members)" << endl;
    cout << setw(16) << "President: " << club.get_president()->getName() << endl;
    cout << "Vice President: " << club.get_vice_president()->getName() << endl;
    cout << setw(16) << "Secretary: " << club.get_secretary()->getName() << endl;
    cout << setw(16) << "Treasurer: " << club.get_treasurer()->getName() << endl;
    
    delete president;
    delete vp;
    delete secretary;
    delete treasurer;
    for (size_t i = 0; i < memberlist.size(); i++) {
        delete memberlist.at(i);
        memberlist.at(i) = nullptr;
    }
    return 0;
}
