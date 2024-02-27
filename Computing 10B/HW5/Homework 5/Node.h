#ifndef Node_h
#define Node_h

#include <string>

class Node {
public:
    Node(int s);
private:
    int data;
    Node* previous;
    Node* next;
friend class List;
friend class Iterator;
};

#endif /* Node_h */
