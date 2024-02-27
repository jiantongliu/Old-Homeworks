#ifndef Iterator_h
#define Iterator_h

#include <string>
#include "Node.h"
#include <cassert>


class List;

class Iterator {
public:
    Iterator();
    int get() const;
    void next();
    void previous();
    bool equals(Iterator b) const;
    
    void operator++();
    void operator--();
    int& operator*(Iterator a);
    
    bool operator==(Iterator b);
    bool operator!=(Iterator b);
    
    
private:
    Node* position;
    List* container;
friend class List;
};


#endif /* Iterator_h */
