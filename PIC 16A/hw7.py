#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Dec  3 01:15:05 2020

@author: liujiantong
"""

#%%
"""
Create a program that plays the knight's tour game. For each valid step, a coordinate 
will be returned in the console. For each invalid step, the console will print message
saying that "this is not working".
If every square is colored, then a "congratulations" button will occur. 
Clicking that button will make the whole board red and no more moves can be made.
The console will print message (please restart the program)


"""

import tkinter as Tk

class Board:
    def __init__(self, master,n):
        self.master = master
        self.canvas = Tk.Canvas(master, width=500, height=500)
        self.canvas.pack()
        self.n = n
        self.canvas.bind("<Button-1>", self.click)
        self.init_x = 50
        self.init_y = 50
        self.stepsize = (500 - self.init_x*2)/self.n
        for i in range(self.n):
            for j in range(self.n):
                self.canvas.create_rectangle(self.init_x+self.stepsize*i,self.init_y+self.stepsize*j,self.init_x+self.stepsize*(i+1),self.init_y+self.stepsize*(j+1))
        self.current_x = 1
        self.current_y = 1
        print("Coordinate:",(self.current_y,self.current_x))
        self.record = [(self.current_y,self.current_x)]
        self.initbutton = self.canvas.create_rectangle(self.init_x,self.init_y,self.init_x+self.stepsize,self.init_y+self.stepsize,fill = "blue")
        self.occur = 0


    def click(self,ev):
        self.row = int((ev.x-self.init_x)//self.stepsize+1)
        self.col = int((ev.y-self.init_y)//self.stepsize+1)
        if (abs(self.row-self.current_x) == 2 and abs(self.col-self.current_y) == 1) or (abs(self.row-self.current_x) == 1 and abs(self.col-self.current_y) == 2):
            self.canvas.create_rectangle(self.init_x+(self.current_x-1)*self.stepsize,self.init_y+(self.current_y-1)*self.stepsize,self.init_x+self.current_x*self.stepsize,self.init_y+self.current_y*self.stepsize,fill = "blue")
            self.current_x = self.row
            self.current_y = self.col
            self.canvas.create_rectangle(self.init_x+(self.row-1)*self.stepsize,self.init_y+(self.col-1)*self.stepsize,self.init_x+self.row*self.stepsize,self.init_y+self.col*self.stepsize,fill = "orange")
            print("Coordinate:",(self.current_y,self.current_x))
            if (self.current_y,self.current_x) not in self.record:
                self.record.append((self.current_y,self.current_x))

        else:
            print("this is not working")
    
        if len(self.record) == self.n*self.n and self.occur == 0:
            def button_press():
                self.canvas.create_rectangle(0, 0, 1000, 1000, fill="red")
                print(Tk.IntVar().get())
            button = Tk.Button(self.master, text="Congratulations! You won!", command=button_press)
            button.pack()
            self.occur = 1
            self.row = 0
            self.col = 0
            print("please restart the program")

def knights_tour(n):
    root = Tk.Tk()
    b = Board(root,n)
    root.mainloop()
    