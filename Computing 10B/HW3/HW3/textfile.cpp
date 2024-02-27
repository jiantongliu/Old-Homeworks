#include <fstream>
#include "textfile.h"
using namespace std;

Textfile::Textfile() : name("") {
};

Textfile::Textfile(string filename) : name(filename) {
};

string Textfile::getName() const {
    return name;
};

