#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 00:41:11 2020

@author: Jiantong Liu
"""

#%%
"""
Problem 1

We first create an empty list k, 
With that we split into cases and assign each slot of k with a corresponding
value with that of c. 
Finally we print our list.

"""

def largerIndex(c):
    k = []
    for i in range(len(c)):
        if c[i] > i:
            k.append(1)
        elif c[i] == i:
            k.append(0)
        elif c[i] < i:
            k.append(-1)
    print(k)
    
'''
l1 = [1,2,0,4,2,1,40,-5]
l2 = [0,3,2,1,32,3,4,0]
largerIndex(l1)
largerIndex(l2)
'''

#largerIndex(l1) should return [1, 1, -1, 1, -1, -1, 1, -1].
#largerIndex(l2) should return [0, 1, 0, -1, 1, -1, -1, -1].
#%%
"""
Problem 2

We create a for loop and an empty list. 
If a square number is smaller than the desired n, we move to the next square
number by going to the next loop. 
The process is repeated until we find a case where the square number is greater 
than n, then we stop recording and print out the list. 

"""

def squareUpTo(n):
    i = 0
    l = []
    while i**2 <= n:
        l.append(i**2)
        i += 1
    print(l)

'''
squareUpTo(10)
squareUpTo(100)
'''

#squareUpTo(10) should return [0, 1, 4, 9].
#squareUpTo(100) should return [0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100].
#%%
"""
Problem 3

We first generate two fair coins, each with 50-50 chances of getting success 
and failure. 
However, the distribution of sum of 2 coins is: 0 - 25%, 1 - 50%, 2 - 25%
Therefore we set 0 as True, 1 as False, and 2 as a rerun of the program. 

"""

def flip1in3():
    import random
    faircoinOutcome1 = random.randint(0,1)
    faircoinOutcome2 = random.randint(0,1)
    biasedOutcome = faircoinOutcome1 + faircoinOutcome2
    if biasedOutcome == 2:
        flip1in3()
    return biasedOutcome == False

#%%
"""
Problem 4

We search through the list to identify elements that occur more than once. 
In every case, we note down the first occurance of that element. 
Because we move from beginning to the end, the elements we noted down are 
automatically in the order of the list. 

"""

def duplicates(c):
    twice_list = []
    for i in range(len(c)):
        for j in range(i+1,len(c)):
            if c[i] == c[j]:
                twice_list.append(c[i])
    print(twice_list)

'''
l3 = [1,2,5,3,6,2,4,5]
l4 = [1,3,5,5,1,4,3]
duplicates(l3)
duplicates(l4)
'''

#duplicates(l3) should return [2,5].
#duplicates(l4) should return [1,3,5].