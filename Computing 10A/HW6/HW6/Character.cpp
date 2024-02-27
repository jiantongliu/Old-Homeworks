/*  PIC 10A 3C, Homework 6
    Purpose: write a game
    Author: Jiantong Liu
    Date: 03/04/2020
*/

#include "Character.h"

Character::Character(string newName)
{
	name = newName;
	health = 20;
	damage = 2;
	arrows = 2;
}

/* Put your code below */

Character::Character(string newName, int newHealth, int newDamage, int newArrows)
{
    name = newName;
    health = newHealth;
    damage = newDamage;
    arrows = newArrows;
}

void Character::attack(Character& target)
{
    target.health -= Character::damage;
    cout << Character::name << " attacks " << target.name << " doing " << Character::damage << " damage!" << endl;
    cout << target.name << " health: " << target.health << endl;
}

void Character::rangedAttack(Character& target)
{
    int temp = rand()*1.0/RAND_MAX * 4 + 1;
    if (arrows == 0) {
        cout << "Hero is out of arrows!" << endl;
        temp = 0;
    }
    else
        arrows -= 1;
    
    target.health -= temp;
    cout << Character::name << " shoots " << target.name << " doing " << temp << " damage!" << endl;
    cout << target.name << " health: " << target.health << endl;
}

void Character::set_health(int newHealth)
{
    health = newHealth;
}

int Character::get_health() const
{
    return Character::health;
}

string Character::get_name() const
{
    return Character::name;
}

void Character::display() const
{
    cout << "Hero  health: " << Character::health << "  arrows: " << Character::arrows << endl;
}
