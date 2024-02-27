#include "Character.h"

Character::Character()
{
	name = " ";
	health = 0;
	damage = 0;
	arrows = 0;
}

Character::Character(string newName, int newHealth, int newDamage, int newArrows)
{
	name = newName;
	health = newHealth;
	damage = newDamage;
	arrows = newArrows;
}

void Character::set_health(int newHealth)
{
	health = newHealth;
}

void Character::attack(Character& target)
{	
	target.health -= damage;
	cout << name << " attacks " << target.name << " doing " << damage << " damage!" << endl;
	cout << target.name << " health: " << target.health << endl;
}

void Character::rangedAttack(Character& target)
{
	if (arrows == 0)
		cout << name << " is out of arrows!" << endl;
	else
	{
		int rangedDamage = rand() % 5 + 1;
		target.health -= rangedDamage;
		arrows--;
		cout << name << " shoots " << target.name << " doing " << rangedDamage << " damage!" << endl;
		cout << target.name << " health: " << target.health << endl;
	}
}

void Character::display() const
{
	cout << name << "  health: " << health << "  arrows: " << arrows << endl;
}

string Character::get_name() const
{
	return name;
}

int Character::get_health() const
{
	return health;
}