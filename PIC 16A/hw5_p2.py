#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 16 02:23:25 2020

@author: liujiantong
"""

'''
find the difference from both images with a standardized formula on "difference
of color"
'''
import numpy as np
import matplotlib.image as mpimg 
import matplotlib.pyplot as plt

img1 = mpimg.imread("g.jpg")
img2 = mpimg.imread("h.jpg")
img3 = img1.copy()
img3.fill(0)


diflist = []
for i in range(img1.shape[0]):
    for j in range(img1.shape[1]):
        if np.sqrt((int(img1[i,j][0])-int(img2[i,j][0]))**2+(int(img1[i,j][1])-int(img2[i,j][1]))**2+(int(img1[i,j][2])-int(img2[i,j][2]))**2) >= 25:
            img3[i,j] = img1[i,j]
            diflist.append((i,j))


for k in range(len(diflist)):
    img3[diflist[k]] = (np.sqrt(int(img1[diflist[k]][0])**2+int(img2[diflist[k]][0])**2),np.sqrt(int(img1[diflist[k]][1])**2+int(img2[diflist[k]][1])**2),np.sqrt(int(img1[diflist[k]][2])**2+int(img2[diflist[k]][2])**2))

plt.imshow(img3)
plt.show()

plt.imsave('i.jpg', img3)
