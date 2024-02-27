//  game.hpp
//  PIC 10B 1A, Homework 1
//  Purpose: Tic-tac-toe game
//  Author: Jiantong Liu
//  Date: 01/17/2021

#ifndef game_h
#define game_h

#include <iostream>
#include <string>
#include <vector>
#include "person.h"

using namespace std;

class Person;
class Game {
public:
    Game();
    Game(int numOfRounds);
    int getRounds() const;

    void setUp(Person* person1, Person* person2);
    void setRounds(int numOfRounds);
    void printTitle(Person* person1, Person* person2);
    void printBoard();
    void printNewVec();
    void runGame(Person* person1, Person* person2);
    void refreshGrid(vector<string>& vec1, vector<string>& vec2, vector<string>& vec3);
    void newBoard(vector<string>& vec1, vector<string>& vec2, vector<string>& vec3);

private:
    Person* person1;
    Person* person2;
    int rounds;
    vector<string> row1 = vector<string>(3);
    vector<string> row2 = vector<string>(3);
    vector<string> row3 = vector<string>(3);
};

#endif /* game_h */
