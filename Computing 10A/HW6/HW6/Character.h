//Character.h
#ifndef Character_h
#define Character_h

#include <iostream>
#include <string>
#include <cstdlib>
#include <ctime>

using namespace std;

class Character
{
public:
	Character(string newName);
	Character(string newName, int newHealth, int newDamage, int newArrows);

	void attack(Character& target);
	void rangedAttack(Character& target);
	void set_health(int newHealth);

	int get_health() const;
	string get_name() const;
	void display() const;

private:
	string name;
	int health;
	int damage;
	int arrows;
};
#endif
