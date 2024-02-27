#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 16 03:29:48 2020

@author: liujiantong
"""

'''
paint the green background to another color and then get rid of them when
printing the image onto the background
'''

import numpy as np
import matplotlib.image as mpimg 
import matplotlib.pyplot as plt

img1 = mpimg.imread("d.jpg")
img2 = mpimg.imread("e.jpg")
imgt = img2.copy()
imgt1 = img1.copy()


for i in range(imgt.shape[0]):
    for j in range(imgt.shape[1]):
        if np.sqrt((int(imgt[i,j][0])-int(imgt[10,10][0]))**2+(int(imgt[i,j][1])-int(imgt[10,10][1]))**2+(int(imgt[i,j][2])-int(img2[10,10][2]))**2) > 200:
            imgt[i,j] = (255,0,0)

for i in range(imgt.shape[0]):
    for j in range(imgt.shape[1]):
        if imgt[i,j][0] == 255 and imgt[i,j][1] == 0 and imgt[i,j][2] == 0:
            imgt1[580+i,300+j] = img2[i,j]
            
plt.imshow(imgt1)
plt.show()

plt.imsave('f.jpg', imgt1)
