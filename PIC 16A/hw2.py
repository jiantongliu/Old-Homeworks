#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct 17 02:19:48 2020

@author: liujiantong
"""
#%%
"""
Problem 1

We count 1 at the start of the loop because the initial state already contains
an original key. In this logic, everytime we verify that the new key is valid, 
we add 1 on the counter. On the other hand, if we confirm the key is invalid or 
used, the counter will not be changed.

In general, we divide the original dictionary into two lists, a key-list and a 
value-list. By using a for-loop, we try all keys as possible ways of starting a
path, and keep updating for the longest path.  
"""

def longestpath(d):
    longestcount = 0
    indexkey = list(d.keys())
    indexvalue = list(d.values())
    for i in range(len(indexkey)):
        usedkey = []
        count = 1
        currentvalue = indexvalue[i]
        usedkey.append(indexkey[i])
        while currentvalue in indexkey and currentvalue not in usedkey:
            count += 1
            usedkey.append(currentvalue)
            newkey = currentvalue
            currentvalue = d[newkey]
        longestcount = max(longestcount, count)
    return longestcount

'''
d1 = {"a":"b","b":"c"}
d2 = {"a":"b","b":"c","c":"d","e":"a","f":"a","d":"b"}
longestpath(d1)
longestpath(d2)
'''

#longestpath(d1) should return 2.
#longestpath(d2) should return 5.
#%%
"""
Problem 2

We run a while loop (the condition is whether the guess is under tolerance), 
each time generating a potential new guess with the given formula. 

The results in this algorithm is the same with performing the algorithm on a 
calculator.
The four results are approximately:
1.0000305180437934
-1
1.5641107898984284e-06
3.311802132639069e-05

"""
import math

def solve(function, initialguess, tolerance):
    error = abs(function(initialguess)[0])
    newguess = initialguess
    while abs(function(newguess)[0]) > tolerance:
        newguess -= function(newguess)[0]/function(newguess)[1]
    return newguess

'''
solve(lambda x: [x**2-1, 2*x], 3, 0.0001)
solve(lambda x: [x**2-1, 2*x], -1, 0.0001)
solve(lambda x: [math.exp(x)-1, math.exp(x)], 1, 0.0001)
solve(lambda x: [math.sin(x), math.cos(x)], 0.5, 0.0001)
'''
