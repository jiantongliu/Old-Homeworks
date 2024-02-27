#include "Complex.h"
#include <iostream>
#include <string>
#include <cmath>

Complex::Complex() : realpart(0.0), imaginarypart(0.0) {
}

Complex::Complex(double a, double b) : realpart(a), imaginarypart(b) {
}

double Complex::setreal() const {
    return realpart;
}

double Complex::setimaginary() const {
    return imaginarypart;
}

Complex Complex::operator+(Complex* z) {
    Complex* newnumber = new Complex(realpart + z->setreal(), imaginarypart + z->setimaginary());
    return *newnumber;
}

Complex Complex::operator-(Complex* z) {
    Complex* newnumber = new Complex(realpart - z->setreal(), imaginarypart - z->setimaginary());
    return *newnumber;
}

Complex Complex::operator*(Complex* z) {
    Complex* newnumber = new Complex(realpart*z->setreal() - imaginarypart*z->setimaginary(), imaginarypart*z->setreal() + realpart*z->setimaginary());
    return *newnumber;
}

Complex Complex::operator/(Complex* z) {
    Complex* newnumber = new Complex((realpart*z->setreal() + imaginarypart*z->setimaginary())/(z->setreal()*z->setreal()+z->setimaginary()*z->setimaginary()), (imaginarypart*z->setreal() - realpart*z->setimaginary())/(z->setreal()*z->setreal()+z->setimaginary()*z->setimaginary()));
    return *newnumber;
}
