#ifndef textfile_h
#define textfile_h

#include <fstream>
#include <string>
using namespace std;

class Textfile {
public:
    Textfile();
    Textfile(string filename);
    string getName() const;
    friend bool operator==(Textfile f1, Textfile f2);
    friend bool operator<(Textfile f1, Textfile f2);
private:
    string name;
};

#endif /* textfile_h */
