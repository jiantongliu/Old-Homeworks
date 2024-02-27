#include <iostream>
#include "Iterator.h"
#include "List.h"
#include <string>
#include <cassert>

Iterator::Iterator() : position(NULL), container(NULL) {
}

int Iterator::get() const {
    assert(position != NULL);
    return position->data;
}

void Iterator::next() {
    assert(position != NULL);
    position = position->next;
}

void Iterator::previous() {
    assert(position != container->first);
    if (position == NULL)
        position = container->last;
    else
        position = position->previous;
}

bool Iterator::equals(Iterator b) const {
    return position == b.position;
}

void Iterator::operator++() {
    if (position == NULL) {
        std::cout << "End of the iteration." << std::endl;
    }
    else
        position = position->next;
}

void Iterator::operator--() {
    if (position == NULL) {
        std::cout << "End of the iteration." << std::endl;
    }
    else
        position = position->previous;
}

int& Iterator::operator*(Iterator a) {
    return a.position->data;
}

bool Iterator::operator==(Iterator b) {
    return position == b.position;
}

bool Iterator::operator!=(Iterator b) {
    return position != b.position;
}

