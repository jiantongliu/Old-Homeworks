#ifndef List_h
#define List_h

#include <string>
#include "Node.h"
#include "Iterator.h"

class List{
public:
    List();
    void push_back(int data);
    void insert(Iterator iter, int s);
    Iterator erase(Iterator iter);
    Iterator begin();
    Iterator end();
    
    void reverse();
    void push_front(int data);
    void sort();
    List* merge(List* anotherlist);
    
private:
    Node* first;
    Node* last;
friend class Iterator;
};

#endif /* List_h */
