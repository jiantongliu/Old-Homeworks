#include "List.h"

List::List() : first(NULL), last(NULL) {
}

void List::push_back(int data) {
    Node* new_node = new Node(data);
    if (last == NULL) {
        first = new_node;
        last = new_node;
    }
    else {
        new_node->previous = last;
        last->next = new_node;
        last = new_node;
    }
}

void List::insert(Iterator iter, int s) {
    if (iter.position == NULL) {
        push_back(s);
        return;
    }
    Node* after = iter.position;
    Node* before = after->previous;
    Node* new_node = new Node(s);
    new_node->previous = before;
    new_node->next = after;
    after->previous = new_node;
    if (before == NULL)
        first = new_node;
    else
        before->next = new_node;
}

Iterator List::erase(Iterator iter) {
    assert(iter.position != NULL);
    Node* remove = iter.position;
    Node* before = remove->previous;
    Node* after = remove->next;
    if (remove == first)
        first = after;
    else
        before->next = after;
    if (remove == last)
        last = before;
    else
        after->previous = before;
    delete remove;
    Iterator r;
    r.position = after;
    r.container = this;
    return r;
}

Iterator List::begin() {
    Iterator iter;
    iter.position = first;
    iter.container = this;
    return iter;
}

Iterator List::end() {
    Iterator iter;
    iter.position = NULL;
    iter.container = this;
    return iter;
}

void List::reverse() {

    Iterator iter;
    iter.position = first;
    iter.container = this;
    
    while (iter.position != NULL) {
        Node* temp = iter.position->previous;
        iter.position->previous = iter.position->next;
        iter.position->next = temp;
        iter.position = iter.position->previous;
    }
    
    Node* temp = first;
    first = last;
    last = temp;
}

void List::push_front(int data) {
    Node* new_node = new Node(data);
    if (last == NULL) {
        first = new_node;
        last = new_node;
    }
    else {
        new_node->next = first;
        first->previous = new_node;
        first = new_node;
    }
}

void List::sort() {
    Iterator iter;
    iter.position = first;
    iter.container = this;
    
    while (iter.position != last) {
        if (iter.get() > iter.position->next->data) {
            int temp = iter.get();
            iter.position->data = iter.position->next->data;
            iter.position->next->data = temp;
            iter.position = first;
            iter.container = this;
        }
        else {
            iter.position = iter.position->next;
            iter.container = this;
        }
    }
    
}

List* List::merge(List* anotherlist) {
    Iterator iter1, iter2;
    iter1.position = first;
    iter1.container = this;
    iter2.position = anotherlist->first;
    
    List* newlist = new List();
    while (iter1.position != NULL && iter2.position != NULL) {
        newlist->push_back(iter1.position->data);
        newlist->push_back(iter2.position->data);
        iter1.next();
        iter2.next();
    }
    while (iter2.position != NULL) {
        newlist->push_back(iter2.position->data);
        iter2.next();
    }
    while (iter1.position != NULL) {
        newlist->push_back(iter1.position->data);
        iter1.next();
    }
    return newlist;
}

