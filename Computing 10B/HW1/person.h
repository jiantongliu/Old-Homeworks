//  person.hpp
//  PIC 10B 1A, Homework 1
//  Purpose: Tic-tac-toe game
//  Author: Jiantong Liu
//  Date: 01/17/2021

#ifndef person_h
#define person_h

#include <iostream>
#include <string>
#include "game.h"

using namespace std;

class Game;
class Person {
public:
    Person();
    Person(string playerName, int totalScore);

    string getName() const;
    int getScore()const;

    void storeName(string playerName);
    void updateScore();



private:
    string name;
    int score;
};

#endif /* person_hpp */
