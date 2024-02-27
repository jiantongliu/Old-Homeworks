#ifndef ComplexVector_h
#define ComplexVector_h

#include "Complex.h"
#include <vector>
#include <iostream>

class ComplexVector {
public:
    ComplexVector();
    ComplexVector(std::vector<Complex> takevector);
    int getSize() const;
    ComplexVector operator+(ComplexVector* v);
    ComplexVector operator-(ComplexVector* v);
    ComplexVector operator*(ComplexVector* v);
    ComplexVector operator/(ComplexVector* v);
    friend std::ostream& operator<<(std::ostream& stream, ComplexVector v);
private:
    std::vector<Complex> vec;
};

#endif /* ComplexVector_h */
