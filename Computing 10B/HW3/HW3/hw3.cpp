#include <iostream>
#include <fstream>
#include <string>
#include "textfile.h"
using namespace std;

bool operator==(Textfile f1, Textfile f2) {
    int linecount1 = 0, linecount2 = 0;
    ifstream inputfile;
    char line;
    inputfile.open(f1.getName(), ios_base::binary);
    while (inputfile) {
        inputfile.get(line);
        if (line == '\n' || inputfile.eof())
            linecount1 += 1;
    }
    inputfile.close();

    inputfile.open(f2.getName(), ios_base::binary);
    while (inputfile) {
        inputfile.get(line);
        if (line == '\n' || inputfile.eof())
            linecount2 += 1;
    }
    inputfile.close();
    return (linecount1 == linecount2);
};

bool operator<(Textfile f1, Textfile f2) {
    int linecount1 = 0, linecount2 = 0;
    ifstream inputfile;
    char line;
    inputfile.open(f1.getName(), ios_base::binary);
    while (inputfile) {
        inputfile.get(line);
        if (line == '\n' || inputfile.eof())
            linecount1 += 1;
    }
    inputfile.close();

    inputfile.open(f2.getName(), ios_base::binary);
    while (inputfile) {
        inputfile.get(line);
        if (line == '\n' || inputfile.eof())
            linecount2 += 1;
    }
    inputfile.close();
    return (linecount1 < linecount2);
};


int main(){
    string filename1, filename2;
    cout << "Enter the name of file 1: ";
    cin >> filename1;
    cout << "Enter the name of file 2: ";
    cin >> filename2;

    ifstream inputfile;
    
    string wordstring;
    int wordcount1 = 0, wordcount2 = 0;
    
    //count words
    Textfile* file1 = new Textfile(filename1);
    inputfile.open(file1->getName().c_str());
    while (inputfile) {
        if (inputfile >> wordstring)
            wordcount1++;
    }
    inputfile.close();
    
    Textfile* file2 = new Textfile(filename2);
    inputfile.open(file2->getName().c_str());
    while (inputfile) {
        if (inputfile >> wordstring)
            wordcount2++;
    }
    inputfile.close();

    char ch;
    int chcount1 = 0, chcount2 = 0;
    
    //count characters, omitting newline and eof
    inputfile.open(file1->getName(), ios_base::binary);
    while (inputfile) {
        inputfile.get(ch);
        if (ch != '\n' && ch != '\r' && !inputfile.eof())
            ++chcount1;
    }
    inputfile.close();
    
    inputfile.open(file2->getName());
    while (inputfile) {
        inputfile.get(ch);
        if (ch != '\n' && ch != '\r' && !inputfile.eof())
            ++chcount2;
    }
    inputfile.close();
    
    bool equal = (*file1 == *file2);
    bool less = (*file1 < *file2);
    

    ofstream myfile;
    myfile.open("Properties.txt");
    myfile << "File Name: " << file1->getName() << endl;
    myfile << "Number of characters: " << chcount1 << endl;
    myfile << "Number of words: " << wordcount1 << endl << endl;
    myfile << "File Name: " << file2->getName() << endl;
    myfile << "Number of characters: " << chcount2 << endl;
    myfile << "Number of words: " << wordcount2 << endl << endl;
    if (equal == true)
        myfile << "The file named \"" << file1->getName() << "\" has the same number of lines as \"" << file2->getName() << "\". " << endl;
    if (equal != true) {
        if (less == true)
            myfile << "The file named \"" << file1->getName() << "\" has less lines than \"" << file2->getName() << "\". " << endl;
        else
            myfile << "The file named \"" << file1->getName() << "\" has more lines than \"" << file2->getName() << "\". " << endl;
    }
    myfile.close();
    
    delete file1;
    delete file2;

    return 0;
}
