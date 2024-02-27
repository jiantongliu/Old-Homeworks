#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 16 00:37:15 2020

@author: liujiantong
"""

'''
find the center and then find the four corner points, then implement
'''
import matplotlib.pyplot as plt
import matplotlib.image as mpimg 

img1 = mpimg.imread("a.jpg")
img2 = mpimg.imread("b.jpg")
img3 = img1.copy()

x = img1.shape[0]
y = img1.shape[1]
a = img2.shape[0]
b = img2.shape[1]
img3[int(x/2-a/2):int(x/2+a/2), int(y/2-b/2):int(y/2+b/2)] = img2

plt.imshow(img3)
plt.show()

plt.imsave("c.jpg", img3)
