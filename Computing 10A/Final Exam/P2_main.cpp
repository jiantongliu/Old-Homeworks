/*  PIC 10A 3C, Final Exam
    Purpose: Find the Longest Common Phrase
    Author: Jiantong Liu
    Date: 03/19/2020
Cite: I used the following webpages to help me.
https://stackoverflow.com/questions/2340281/check-if-a-string-contains-a-string-in-c
https://en.cppreference.com/w/cpp/string/basic_string/find
https://en.wikipedia.org/wiki/Longest_common_substring_problem
https://www.geeksforgeeks.org/print-longest-common-substring/
*/
 
#include <iostream>
#include <string>
#include <vector>
#include <cmath>
using namespace std;

vector<string> read_inputs();
string find_common_phrase(vector<string> v);

vector<string> read_inputs()
{
    vector<string> string_list;
    string word;
    cout << "Please input a word, enter STOP (case sensitive) to stop: " << endl;
    while (cin >> word) {
        int string_size = word.size(); // for convenience
        if (word == "STOP") //check if the entered word is the indicator of finishing entering
            break;
        for (int j = 0; j < string_size; j++)
            word[j] = ::tolower(word[j]); //change each word to lower case
        string_list.push_back(word); //send the string into the vector
    }
    return string_list;
}

string find_common_phrase(vector<string> v)
{
    int vector_size = v.size(); //for convenience
    int LCP_tempsize = v[0].length();
    int LCP_length = 0; //initialization
    string LCP = "";
    for (int i = 0; i < LCP_tempsize; i++) {
        for (int j = 1; j <= LCP_tempsize - i; j++) { //double loop to limit a substring
            string substr = v[0].substr(i,j);
            int true_or_false = 1; //give the flag to check true or false: is the substring from v[0] in other strings?
            for (int k = 1; k < vector_size; k++)
                true_or_false &= (v[k].find(substr) != v[k].npos); //check for each string, whether the substring from v[0] is in these strings; the value will decide how the following function runs;
            if (true_or_false) {
                if (j >= LCP_length) { //if the new LCP length is greater, we change it to the new one. Note that we need to update the current length and current substring. 
                    LCP_length = j;
                    LCP = substr;
                }
            }
        }
    }
    return LCP;
}
  
int main()
{
    vector<string> v;
    string LCP;  //longest common phrase
    v = read_inputs();
    LCP = find_common_phrase(v);
    cout << LCP;
    return 0;
}
