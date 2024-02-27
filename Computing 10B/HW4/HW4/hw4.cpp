#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <iomanip>
#include "Complex.h"
#include "ComplexVector.h"

std::ostream& operator<<(std::ostream& stream, ComplexVector v) {
    stream << "{";
    for (int i = 0; i < v.getSize(); i++) {
        if (i < v.getSize() - 1) {
            if (v.vec[i].setimaginary() >= 0)
                stream << v.vec[i].setreal() << "+" << v.vec[i].setimaginary() << "i, ";
            else
                stream << v.vec[i].setreal() << v.vec[i].setimaginary() << "i, ";
        }
        else {
            if (v.vec[i].setimaginary() >= 0)
                stream << v.vec[i].setreal() << "+" << v.vec[i].setimaginary() << "i}";
            else
                stream << v.vec[i].setreal() << v.vec[i].setimaginary() << "i}";
        }
    }
    return stream;
}
    
void recursivecomplex(int n, Complex* fstart, std::vector<Complex> recursivevector) {
    ComplexVector* recursivevec = new ComplexVector(recursivevector);
    Complex* multiplier1 = new Complex(2*recursivevector.size(), 3*recursivevector.size());
    Complex* multiplier2 = new Complex(7, 5*recursivevector.size()*recursivevector.size());
    
    if (recursivevector.size() == n) {
        std::ofstream output;
        output.open("ComplexSequence.txt");
        output << *recursivevec << std::endl;
        output.close();
        delete recursivevec;
        delete multiplier1;
        delete multiplier2;
    }
    if (recursivevector.size() < n) {
        *fstart = fstart->operator*(multiplier1);
        *fstart = fstart->operator/(multiplier2);
        recursivevector.push_back(*fstart);
        recursivecomplex(n, fstart, recursivevector);
    }
}

int main() {
    std::vector<Complex> v1 = {Complex(2, 4), Complex(3, 5), Complex(-1, -3), Complex(8, 10)};
    std::vector<Complex> v2 = {Complex(-10, 3.5), Complex(4, 7.3), Complex(2, -8), Complex(10, -142)};
    ComplexVector* vec1 = new ComplexVector(v1);
    ComplexVector* vec2 = new ComplexVector(v2);
    
    ComplexVector sum = vec1->operator+(vec2);
    ComplexVector difference = vec1->operator-(vec2);
    ComplexVector product = vec1->operator*(vec2);
    ComplexVector quotient = vec1->operator/(vec2);

    std::cout << std::setw(8) << "v1 = " << std::setprecision(1) << std::fixed << *vec1 << std::endl;
    std::cout << std::setw(8) << "v2 = " << std::setprecision(1) << std::fixed << *vec2 << std::endl;
    std::cout << "v1+v2 = " << std::setprecision(1) << std::fixed << sum << std::endl;
    std::cout << "v1-v2 = " << std::setprecision(1) << std::fixed << difference << std::endl;
    std::cout << "v1*v2 = " << std::setprecision(1) << std::fixed << product << std::endl;
    std::cout << "v1/v2 = " << std::setprecision(1) << std::fixed << quotient << std::endl;

    Complex* fstart = new Complex(1, 1);
    std::vector<Complex> recursivevector = {Complex(1,1)};

    recursivecomplex(6, fstart, recursivevector);
    
    std::cout << std::endl << "Writing Complex Sequence to File ... Done." << std::endl;
    
    delete vec1;
    delete vec2;
    delete fstart;
    
    return 0;
}
