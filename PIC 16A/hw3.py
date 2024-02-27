#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 01:48:25 2020

@author: liujiantong
"""

class Node:
    
    def __init__(self,data):
        self.data = data
        self.next = None
        
    def __str__(self):
        return str(self.data)
    
    def __repr__(self):
        self.repr = repr(self.data)
        return self.repr
    
class LinkedList:
    
    def __init__(self,firstdata):
        self.first = Node(firstdata)
        self.last = self.first
        self.n = 1
        self.list = [self.first] #we manipulate the list for better access
    
    def append(self,newdata):
        Newdata = Node(newdata)
        self.last.next = Newdata
        self.last = Newdata
        self.n += 1
        self.list.append(self.last)
    
    def __iter__(self):
        self.current = self.first
        return self

    def __next__(self):
        self.value = self.current
        if self.value == None:
            #self.current = self.first
            raise StopIteration
        self.current = self.current.next
        return self.value.data

    def __len__(self):
        return self.n
    
    def __str__(self):
        self.newlist = self.list.copy()
        for i in range(len(self.newlist)):
            self.newlist[i-1] = str(self.newlist[i-1])+"->"
        self.str = "["+"".join(self.newlist)+"]"
        return self.str
    
    def __repr__(self):
        return repr(self.str)
    
    def __getitem__(self,key):
        if key >= self.n:
            raise IndexError("list index out of range")
        self.counter = 0
        self.desired = self.first
        while self.counter <= key-1:
            self.desired = self.desired.next
            self.counter += 1
        return self.desired.data
    
    def __setitem__(self,key,value):
        if key >= self.n:
            raise IndexError("list index out of range")
        self.counter = 0
        self.desired = self.first
        while self.counter <= key-1:
            self.desired = self.desired.next
            self.counter += 1
        self.desired.data = value
    
    def __add__(self,other):
        newlinkedlist = LinkedList(self.first) #creating a separate linked list
        for i in range(self.n-1):
            newlinkedlist.append(Node(self.list[i+1]))
        newlinkedlist.append(other)
        
        return newlinkedlist

