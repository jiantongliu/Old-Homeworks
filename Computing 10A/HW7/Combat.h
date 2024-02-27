//Combat.h
#ifndef COMBAT_h
#define COMBAT_h

#include <iostream>
#include <vector>
#include "Character.h"
using namespace std;

class Combat
{
public:
	Combat();
	Combat(int newNumberOfMonsters);
	
	void attackAll();
	void start();
	void checkAliveMonster();
	
	void printMonsterList() const;


private:
	int NumberOfMonsters;
	vector<Character> monsterList;
	Character hero;
	int tokens;
};
#endif
