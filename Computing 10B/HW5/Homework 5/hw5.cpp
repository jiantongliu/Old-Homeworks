#include <iostream>
#include "Node.h"
#include "List.h"
#include "Iterator.h"


int main() {
    std::cout << "Please input a set of non-negative numbers for a List" << std::endl;
    std::cout << "(Enter -1 when you are finished): " << std::endl;
    
    List* l = new List();
    int number;
    int count = 0;
    
    std::cin >> number;
    while (number != -1) {
        l->push_back(number);
        count++;
        std::cin >> number;
    }
    
    std::cout << "Your list is " << std::endl;
    std::cout << "(";
    Iterator iter = l->begin();
    for (int i = 0; i < count; i++){
        std::cout << iter.get();
        if (i < count - 1)
            std::cout << ",";
        iter.next();
    }
    std::cout << ")" << std::endl;
    
    std::cout << "Select an index for insertion (enter -1 when finished): ";
    int index;
    std::cin >> index;
    while (index != -1) {
        while (index >= count) {
            std::cout << "Cannot find index, try again." << std::endl;
            std::cout << "Select an index for insertion (enter -1 when finished): ";
            std::cin >> index;
        }
        std::cout << "Select a value for insertion: ";
        std::cin >> number;
        iter = l->begin();
        
        for (int i = 0; i < index; i++) {
            iter.next();
        }
        l->insert(iter, number);
        count += 1;
        std::cout << "Select an index for insertion (enter -1 when finished): ";
        std::cin >> index;
    }
    
    std::cout << "The augmented List is" << std::endl;
    std::cout << "(";
    iter = l->begin();
    for (int i = 0; i < count; i++){
        std::cout << iter.get();
        if (i < count - 1)
            std::cout << ",";
        iter.next();
    }
    std::cout << ")" << std::endl;
    
    std::cout << "When we sort the previous list we obtain" << std::endl;
    l->sort();
    std::cout << "(";
    iter = l->begin();
    for (int i = 0; i < count; i++){
        std::cout << iter.get();
        if (i < count - 1)
            std::cout << ",";
        iter.next();
    }
    std::cout << ")" << std::endl;
    
    std::cout << "And this sorted list in reverse order is" << std::endl;
    l->reverse();
    std::cout << "(";
    iter = l->begin();
    for (int i = 0; i < count; i++){
        std::cout << iter.get();
        if (i < count - 1)
            std::cout << ",";
        iter.next();
    }
    std::cout << ")" << std::endl;
    
    List* otherlist = new List();
    otherlist->push_back(2);
    otherlist->push_back(3);
    otherlist->push_back(5);
    otherlist->push_back(7);
    otherlist->push_back(11);

    
    std::cout << "If we merge this list with the list ";
    std::cout << "(";
    iter = otherlist->begin();
    while (!iter.equals(otherlist->end())) {
        std::cout << iter.get();
        iter.next();
        if (!iter.equals(otherlist->end()))
            std::cout << ",";
    }
    
    std::cout << ")" << " we obtain" << std::endl;
    
    List* newlist = l->merge(otherlist);
    
    std::cout << "(";
    iter = newlist->begin();
    
    while (!iter.equals(newlist->end())) {
        std::cout << iter.get();
        iter.next();
        if (!iter.equals(newlist->end()))
            std::cout << ",";
    }
    std::cout << ")" << std::endl;
    delete otherlist;
    delete newlist;
    delete l;
    return 0;
}
