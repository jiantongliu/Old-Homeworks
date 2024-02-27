//  person.cpp
//  PIC 10B 1A, Homework 1
//  Purpose: Tic-tac-toe game
//  Author: Jiantong Liu
//  Date: 01/17/2021

#include "person.h"
using namespace std;

Person::Person() : name(""), score(0) {
}

Person::Person(string playerName, int totalScore) : name(playerName), score(totalScore) {
}

string Person::getName() const {
    return name;
}

int Person::getScore() const {
    return score;
}

void Person::storeName(string playerName) {
    name = playerName;
}

void Person::updateScore() {
    ++score;
}
