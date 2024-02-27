//  PIC 10B 1A, Homework 1
//  Purpose: Tic-tac-toe game
//  Author: Jiantong Liu
//  Date: 01/17/2021

#include <iostream>
#include <string>
#include <cassert>
#include "person.h"
#include "game.h"

using namespace std;

int main() {

    Person* player1 = new Person("", 0);
    Person* player2 = new Person("", 0);
    Game startGame;

    startGame.setUp(player1, player2);
    startGame.printTitle(player1, player2);
    startGame.printNewVec();
    startGame.printBoard();
    startGame.runGame(player1, player2);

    delete player1;
    delete player2;
    return 0;
}
