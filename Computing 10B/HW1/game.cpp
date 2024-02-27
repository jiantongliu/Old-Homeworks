//  game.cpp
//  PIC 10B 1A, Homework 1
//  Purpose: Tic-tac-toe game
//  Author: Jiantong Liu
//  Date: 01/17/2021

#include "game.h"

using namespace std;

Game::Game() : rounds(0) {
    vector<string> row1;
    vector<string> row2;
    vector<string> row3;
}

Game::Game(int numOfRounds) : rounds(numOfRounds) {
}

int Game::getRounds() const {
    return rounds;
}

void Game::setUp(Person* person1, Person* person2) {
    string name1, name2;
    int rounds;
    cout << "Number of games: ";
    cin >> rounds;
    setRounds(rounds);
    cin.ignore();
    cout << "Player 1 Name = ";
    getline(cin, name1);
    person1->storeName(name1);

    cout << "Player 2 Name = ";
    getline(cin, name2);
    person2->storeName(name2);
}

void Game::setRounds(int numOfRounds) {
    rounds = numOfRounds;
}

void Game::printTitle(Person* person1, Person* person2) {
    cout << "\t   " << "Tic Tac Toe" << endl;
    cout << "     " << person1->getName() << " (X) - " << person2->getName() << " (O)" << endl;
}

void Game::printNewVec() {
    row1 = { " ", " ", " " };
    row2 = { " ", " ", " " };
    row3 = { " ", " ", " " };
}

void Game::printBoard() {
    cout << "    1    " << "    2    " << "    3    " << endl;
    cout << "         " << "|" << "       " << "|" << "        " << endl;
    cout << 1 << "    " << row1[0] << "   |   " << row1[1] << "   |   " << row1[2] << endl;
    cout << " --------" << "|" << "-------" << "|" << "--------" << endl;
    cout << "         " << "|" << "       " << "|" << "        " << endl;
    cout << 2 << "    " << row2[0] << "   |   " << row2[1] << "   |   " << row2[2] << endl;
    cout << " --------" << "|" << "-------" << "|" << "--------" << endl;
    cout << "         " << "|" << "       " << "|" << "        " << endl;
    cout << 3 << "    " << row3[0] << "   |   " << row3[1] << "   |   " << row3[2] << endl;
    cout << "         " << "|" << "       " << "|" << "        " << endl;
}

void Game::runGame(Person* person1, Person* person2) {
    string location;
    int rounds = getRounds();
    int i = 1;
    while (rounds > 0) {
        if (i % 2 == 1) {
            cout << person1->getName() << "(X) Mark Location: ";
            getline(cin, location);
            if (location == "1 1") {
                if (row1[0] == " ") {
                    row1[0] = "X";
                    printBoard();
                }
                else if (row1[0] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "1 2") {
                if (row1[1] == " ") {
                    row1[1] = "X";
                    printBoard();
                }
                else if (row1[1] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "1 3") {
                if (row1[2] == " ") {
                    row1[2] = "X";
                    printBoard();
                }
                else if (row1[2] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "2 1") {
                if (row2[0] == " ") {
                    row2[0] = "X";
                    printBoard();
                }
                else if (row2[0] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "2 2") {
                if (row2[1] == " ") {
                    row2[1] = "X";
                    printBoard();
                }
                else if (row2[1] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "2 3") {
                if (row2[2] == " ") {
                    row2[2] = "X";
                    printBoard();
                }
                else if (row2[2] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "3 1") {
                if (row3[0] == " ") {
                    row3[0] = "X";
                    printBoard();
                }
                else if (row3[0] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "3 2") {
                if (row3[1] == " ") {
                    row3[1] = "X";
                    printBoard();
                }
                else if (row3[1] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "3 3") {
                if (row3[2] == " ") {
                    row3[2] = "X";
                    printBoard();
                }
                else if (row3[2] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else {
                printBoard();
                cout << "Invalid coordinate" << endl;
                continue;
            }
        }
        if (i % 2 == 0) {
            cout << person2->getName() << "(O) Mark Location: ";
            getline(cin, location);
            if (location == "1 1") {
                if (row1[0] == " ") {
                    row1[0] = "O";
                    printBoard();
                }
                else if (row1[0] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "1 2") {
                if (row1[1] == " ") {
                    row1[1] = "O";
                    printBoard();
                }
                else if (row1[1] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "1 3") {
                if (row1[2] == " ") {
                    row1[2] = "O";
                    printBoard();
                }
                else if (row1[2] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "2 1") {
                if (row2[0] == " ") {
                    row2[0] = "O";
                    printBoard();
                }
                else if (row2[0] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "2 2") {
                if (row2[1] == " ") {
                    row2[1] = "O";
                    printBoard();
                }
                else if (row2[1] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "2 3") {
                if (row2[2] == " ") {
                    row2[2] = "O";
                    printBoard();
                }
                else if (row2[2] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "3 1") {
                if (row3[0] == " ") {
                    row3[0] = "O";
                    printBoard();
                }
                else if (row3[0] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "3 2") {
                if (row3[1] == " ") {
                    row3[1] = "O";
                    printBoard();
                }
                else if (row3[1] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else if (location == "3 3") {
                if (row3[2] == " ") {
                    row3[2] = "O";
                    printBoard();
                }
                else if (row3[2] != " ") {
                    printBoard();
                    cout << "Invalid coordinate" << endl;
                    continue;
                }
            }
            else {
                printBoard();
                cout << "Invalid coordinate" << endl;
                continue;
            }
        }
        ++i;
        if (
            ((row1[0] == row1[1] && row1[1] == row1[2]) && row1[0] != " ") ||
            ((row2[0] == row2[1] && row2[1] == row2[2]) && row2[0] != " ") ||
            ((row3[0] == row3[1] && row3[1] == row3[2]) && row3[0] != " ") ||
            ((row1[0] == row2[0] && row2[0] == row3[0]) && row1[0] != " ") ||
            ((row1[1] == row2[1] && row2[1] == row3[1]) && row1[1] != " ") ||
            ((row1[2] == row2[2] && row2[2] == row3[2]) && row1[2] != " ") ||
            ((row1[0] == row2[1] && row2[1] == row3[2]) && row1[0] != " ") ||
            ((row1[2] == row2[1] && row2[1] == row3[0]) && row1[2] != " ")) {
            if (i % 2 == 0) {
                cout << person1->getName() << " wins this round" << endl;
                person1->updateScore();
                rounds--;
                if (rounds > 0) {
                    row1[0] = " ";
                    row1[1] = " ";
                    row1[2] = " ";
                    row2[0] = " ";
                    row2[1] = " ";
                    row2[2] = " ";
                    row3[0] = " ";
                    row3[1] = " ";
                    row3[2] = " ";
                    printBoard();
                    i = 1;
                }
            }
            else if (i % 2 == 1) {
                cout << person2->getName() << " wins this round" << endl;
                person2->updateScore();
                rounds--;
                if (rounds > 0) {
                    row1[0] = " ";
                    row1[1] = " ";
                    row1[2] = " ";
                    row2[0] = " ";
                    row2[1] = " ";
                    row2[2] = " ";
                    row3[0] = " ";
                    row3[1] = " ";
                    row3[2] = " ";
                    printBoard();
                    i = 1;
                }
            }
        }

        else if (row1[0] != " " && row1[1] != " " && row1[2] != " " && row2[0] != " " && row2[1] != " " && row2[2] != " " && row3[0] != " " && row3[1] != " " && row3[2] != " ") {
            cout << "Tie" << endl;
            rounds--;
            if (rounds > 0) {
                row1[0] = " ";
                row1[1] = " ";
                row1[2] = " ";
                row2[0] = " ";
                row2[1] = " ";
                row2[2] = " ";
                row3[0] = " ";
                row3[1] = " ";
                row3[2] = " ";
                printBoard();
                i = 1;
            }
        }
    }
    if (rounds == 0) {
        cout << endl << person1->getName() << " : " << person1->getScore() << endl;
        cout << person2->getName() << " : " << person2->getScore() << endl;
        if (person1->getScore() > person2->getScore()) {
            cout << "Congratulations " << person1->getName() << ". You won!" << endl << endl;
        }
        if (person2->getScore() > person1->getScore()) {
            cout << "Congratulations " << person2->getName() << ". You won!" << endl << endl;
        }
        if (person1->getScore() == person2->getScore()) {
            cout << "This is a tie, good game! " << endl << endl;
        }
    }
}
