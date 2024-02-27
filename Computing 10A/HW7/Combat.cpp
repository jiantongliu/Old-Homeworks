//Combat.cpp
#include "Combat.h"

Combat::Combat()
:hero("Hero", 30, 3, 5), NumberOfMonsters(1), tokens(2)
{
	Character M("Monster", 5, 2, 0);
	monsterList.push_back(M);
}

void Combat::start()
{
	int choice, iMonster;
	srand(time(0));

	while (NumberOfMonsters>0 && hero.get_health()>0)
	{
		for (int i = 0; i<NumberOfMonsters; i++)
			monsterList[i].attack(hero);
		cout << "----------------------\n";
		if (hero.get_health() <= 0)
			break;
		hero.display();
		cout << hero.get_name() << " has " << tokens << " tokens left.\n";
		cout << "----------------------\n";
		printMonsterList();
		cout << "What do you do? 1 attack, 2 fire arrow, 3 attack all,  Q exit: ";
		cin >> choice;
		if (cin.fail())
		    break;
		if (choice == 1 || choice == 2)
		{
			cout << "Which monster do you want to attack? (0-" << NumberOfMonsters - 1 << "): " << endl;
			cin >> iMonster;
			if (cin.fail() || iMonster >= NumberOfMonsters)
			{
				cout << "Input Error!\n";
				break;
			}
		}
		cout << "----------------------\n";
		switch (choice)
		{
		case 1:
			hero.attack(monsterList[iMonster]);
			break;

		case 2:
			hero.rangedAttack(monsterList[iMonster]);
			break;

		case 3:
			attackAll();
			break;

		default:
			cout << "Input error!\n";
			break;
		}
		checkAliveMonster();
		cout << "----------------------\n";
	}
	if (NumberOfMonsters == 0)
		cout << "Congratulations! You have killed all the monster!" << endl;
	if (hero.get_health() <= 0)
		cout << "You have died! GAME OVER! " << endl;

	cout << "Thanks for playing!" << endl;

}
// Put your code below:

Combat::Combat(int newNumberofMonsters) {
    
}

void Combat::attackAll() {
    if (tokens > 0) {
        tokens -= 1;
        i = 0;
        while
    }
    else {
        cout << "Hero is out of tokens!" << endl;
    }
    
}

void Combat::checkAliveMonster() {
    
}

void Combat::printMonsterList() {
    
}
