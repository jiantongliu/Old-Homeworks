#include "Character.h"
using namespace std;

int main() {

	int monster_health = 10;
	int monster_damage = 3;

	srand(time(0));

	//This is the character you play
	Character C("Hero");

	// This is the monster you try to defeat, the monster has 0 arrow
	Character M("Monster", monster_health, monster_damage, 0);

	while (M.get_health()>0 && C.get_health()>0)
	{
		M.attack(C);
		cout << "----------------------\n";
		if (C.get_health() <= 0)
			break;
		C.display();
		cout << "What do you do? 1 attack, 2 fire arrow, Q exit: ";
		int choice;
		cin >> choice;
		if (cin.fail())
			break;
		switch (choice)
		{
		case 1:
			C.attack(M);
			break;

		case 2:
			C.rangedAttack(M);
			break;
		}

	}
	if (M.get_health() <= 0)
		cout << "Congratulations! You killed the monster!" << endl;
	if (C.get_health() <= 0)
		cout << "You have died! GAME OVER! " << endl;

	cout << "Thanks for playing!" << endl;

	return 0;
}

