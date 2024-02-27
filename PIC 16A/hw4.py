#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov  4 03:56:40 2020

@author: liujiantong
"""
#%%
"""
Problem 1
For each part we examine the chracteristics of the type and include them in the regex. 

"""
import re

def mytype(v):
    v = str(v)
    if re.findall(re.compile(r'^[-0-9]+[0-9]$'), v):
        return "int"
    if re.findall(re.compile(r'^\[*[-a-zA-Z0-9., ]*\]$'), v):
        return "list"
    if re.findall(re.compile(r'^[\{a-zA-Z0-9]*[a-zA-Z0-9, ]*[\}a-zA-Z0-9]$'), v):
        return "string"
    if re.findall(re.compile(r'^[-0-9]+[0-9\.]+[0-9]$'), v):
        return "float"


"""
mytype(10)
mytype(-10)
mytype(-1.25)
mytype(10.0)
mytype([1,2,3])
mytype([])
mytype("abc")
mytype({1,2})
"""
#%%
"""
Problem 2
examine all file names that ends with pdf, and then delete the suffix. 

"""
import re

def findpdfs(L):
    for i in range(len(L)):
        L[i] = re.findall(re.compile(r'^[A-Za-z0-9]+\.pdf$'), L[i])
    L0 = []
    for j in range(len(L)):
        if L[j] != []:
            L0.append(L[j][0][0:-4])
    return L0

"""
L = ["IMG2309.jpg", "lecture1.pdf", "homework.py", "homework2.pdf"]
#return result: ["lecture1", "homework2"]
"""
#%%
"""
Problem 3
First decode the page so we won't include codes
then change the words and symbols into dot and at. 

"""
import re, urllib

def findemail(url):
    page = urllib.request.urlopen(url).read().decode()
    page = page.replace('[DOT]','.')
    page = page.replace(' DOT ','.')
    page = page.replace(' dot ','.')
    page = page.replace('[AT]','@')
    page = page.replace('[at]','@')
    page = page.replace('[dot]','.')
    page = page.replace(' AT ','@')
    page = page.replace(' at ','@')
    target = re.findall(r'([A-Za-z0-9]+)@(([A-Za-z0-9]*\.)+[A-Za-z0-9]*)', page)
    targetlist = []
    for i in range(len(target)):
        temp = target[i][0]+'@'+target[i][1]
        if temp not in targetlist:
            targetlist.append(temp)
    return sorted(targetlist)

"""
url1 = "https://www.math.ucla.edu/~hangjie/contact/"
url2 = "https://www.math.ucla.edu/~hangjie/teaching/Winter2019PIC16/regexTest"
"""

#%%
"""
Problem 4
Split each sentence into individual words, then calculate the values of each word
individually. 

"""

import re
import happiness_dictionary as h

def happiness(text):
    l = []
    text = text.split(' ')
    for i in range(len(text)):
        splittext = re.findall(re.compile(r'\w+'), text[i])
        l.append(splittext)
    newlist = []
    for j in range(len(l)):
        newlist.append(l[j][0].lower())
    sum = 0
    count = 0
    for k in range(len(newlist)):
        if newlist[k] in h.happiness_dictionary.keys():
            sum += h.happiness_dictionary[newlist[k]]
            count += 1
    return sum/count
"""
s1 = "Mary had a little lamb."
s2 = "Mary had a little lamb. Mary had a little lamb!"
s3 = "A quick brown fox jumps over a lazy dog."
"""