#include <iostream>
#include "ComplexVector.h"
#include "Complex.h"
#include <vector>
#include <string>

ComplexVector::ComplexVector() : vec({}) {
}

ComplexVector::ComplexVector(std::vector<Complex> takevector) : vec(takevector) {
}

int ComplexVector::getSize() const {
    return vec.size();
}


ComplexVector ComplexVector::operator+(ComplexVector* v) {
    if (v->vec.size() != vec.size()) {
        std::cout << "Incompatible, please retry. " << std::endl;
        ComplexVector newv = {};
        return newv;
    }
        
    else {
        ComplexVector newv = {};
        for (int i = 0; i < vec.size(); i++) {
            Complex* ptr = &v->vec[i];
            Complex temp = vec[i].operator+(ptr);
            newv.vec.push_back(temp);
        }
        return newv;
    }
}

ComplexVector ComplexVector::operator-(ComplexVector* v) {
    if (v->vec.size() != vec.size()) {
        std::cout << "Incompatible, please retry. " << std::endl;
        ComplexVector newv = {};
        return newv;
    }
        
    else {
        ComplexVector newv = {};
        for (int i = 0; i < vec.size(); i++) {
            Complex* ptr = &v->vec[i];
            Complex temp = vec[i].operator-(ptr);
            newv.vec.push_back(temp);
        }
        return newv;
    }
}

ComplexVector ComplexVector::operator*(ComplexVector* v) {
    if (v->vec.size() != vec.size()) {
        std::cout << "Incompatible, please retry. " << std::endl;
        ComplexVector newv = {};
        return newv;
    }
        
    else {
        ComplexVector newv = {};
        for (int i = 0; i < vec.size(); i++) {
            Complex* ptr = &v->vec[i];
            Complex temp = vec[i].operator*(ptr);
            newv.vec.push_back(temp);
        }
        return newv;
    }
}

ComplexVector ComplexVector::operator/(ComplexVector* v) {
    if (v->vec.size() != vec.size()) {
        std::cout << "Incompatible, please retry. " << std::endl;
        ComplexVector newv = {};
        return newv;
    }
        
    else {
        ComplexVector newv = {};
        for (int i = 0; i < vec.size(); i++) {
            Complex* ptr = &v->vec[i];
            Complex temp = vec[i].operator/(ptr);
            newv.vec.push_back(temp);
        }
        return newv;
    }
}
