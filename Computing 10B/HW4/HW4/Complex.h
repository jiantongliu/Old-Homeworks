#ifndef Complex_h
#define Complex_h

class Complex {
public:
    Complex();
    Complex(double a, double b);
    double setreal() const;
    double setimaginary() const;
    Complex operator+(Complex* z);
    Complex operator-(Complex* z);
    Complex operator*(Complex* z);
    Complex operator/(Complex* z);
private:
    double realpart;
    double imaginarypart;
};

#endif /* Complex_h */
