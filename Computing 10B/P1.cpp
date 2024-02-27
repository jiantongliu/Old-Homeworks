#include <set>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

int Factorial(int n) {
    while (n <= 1)
        return 1;
    return n*Factorial(n-1);
}

void formatoutput(const vector<int>& set, string filename) {
    ofstream writing;
    writing.open(filename, ios::app);
    writing << "(";
    writing.close();
    for (int i = 0; i < set.size(); i++) {
        writing.open(filename, ios::app);
        if (i < set.size()-1)
            writing << set[i] << ", ";
        else if (i == set.size()-1)
            writing << set[i];
        writing.close();
    }
    writing.open(filename, ios::app);
    writing << ")" << endl;
    writing.close();
}

void findComb(int offset, int k, vector<int> combset, set<int> intset, string filename) {
    if (k == 0) {
        formatoutput(combset, filename);
        return;
    }
    for (int i = offset; i <= intset.size() - k; i++) {
        set<int>::iterator pos = intset.begin();
        for (int j = 0; j < i; j++)
            pos++;
    combset.push_back(*pos);
    findComb(i+1, k-1, combset, intset, filename);
    combset.pop_back();
    }
}


int main() {
    ifstream input;
    char inchar;
    set<int> intset;
    
    input.open("numbers.txt");
    bool status = false;
    string str;

    while (!input.fail()) {
        input.get(inchar);
        if (inchar == '\n' || input.eof())
            continue;
        if (isdigit(inchar)) {
            if (status)
                str += inchar;
            else if (!status) {
                status = true;
                str = inchar;
            }
        }
        else if (!isdigit(inchar)) {
            if (status) {
                status = false;
                if (str != "")
                    intset.insert(stoi(str));
                str = "";
            }
        }
    }
    if (input.fail() && str != "") {
        intset.insert(stoi(str));
        str = "";
    }
    
    input.close();
    
    int number;

    
    cout << "Please type in an non-negative integer that is no more than " << intset.size() << ": ";
    cin >> number;
    
    while (cin.fail() || number < 0 || number > intset.size()) {
        cin.ignore();
        cout << "Please type in an non-negative integer that is no more than " << intset.size() << ": ";
        cin >> number;
    }
    
    ofstream output;
    string filename = to_string(number) + "_combinations.txt";
    
    output.open(filename);
    int numComb = Factorial(intset.size())/(Factorial(number)*Factorial(intset.size()-number));
    output << "There are " << numComb << " " << number << "-combinations from this input: "<< endl;
    vector<int> combset;
    findComb(0, number, combset, intset, filename);
    output.close();
    
    return 0;
}
