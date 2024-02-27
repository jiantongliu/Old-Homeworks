#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 25 03:10:36 2020

@author: liujiantong
"""
#%%
"""
Problem 1

We evaluate the boundary of the heart as four functions lines/curves, and outside of 
each function the pixels are changed to pink. 
"""

import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import numpy as np

#im = mpimg.imread("kitty-cat.jpg")
#im = im/255.0

def heart(im):
    #img = mpimg.imread(im)
    img = im.copy()
    imc = img.copy()
    x = imc.shape[0]
    y = imc.shape[1]
    for i in range(x):
        for j in range(y):
            if i + j >= y/2 + x or i >= j + x - y/2:
                imc[i,j] = (0.93,0.51,0.93)
    for i in range(x):
        for j in range(y):
            if (i - x/3)**2 + (j - y/4)**2 >= (y/4)**2 and i <= x/3 and j <= y/2:
                imc[i,j] = (0.93,0.51,0.93)
    for i in range(x):
        for j in range(y):
            if (i - x/3)**2 + (j - y/4*3)**2 >= (y/4)**2 and i <= x/3 and j >= y/2:
                imc[i,j] = (0.93,0.51,0.93)
    
    plt.imshow(imc)
    plt.show()
    return imc
             
#%%
"""
Problem 2

For Uniform Blurring and Gaussian Blurring we provide an algorithm to calculate the 
filter and thus the new value for each point. 
"""

#im2 = mpimg.imread("M.jpg")
#im2 = im2/255.0

def blurring(im2, method):
    imn = im2.copy()
    imn2 = imn.copy()
    
    #Uniform Blurring
    if method == "uniform":
        for i in range(2,imn.shape[0]-2):
            for j in range(2,imn.shape[1]-2):
                for k in range(3):
                    imn2[i,j,k] = np.sum(imn[i-2:i+3,j-2:j+3,k] * np.array([[1.0/5**2]*5]*5))
        plt.imshow(imn2)
        plt.show()
        plt.imsave("Uniform_Blur.jpg",imn2)
        return imn2
    
    #Gaussian Blurring
    if method == "Gaussian":
        sigma = 1
        k = 5
        filt=np.array([[0]*k]*k,dtype='float')
        for x in range(k):
            for y in range(k):
                filt[x,y]=np.exp(-((x-(k-1)*0.5)**2+(y-(k-1)*0.5)**2)/(2.0*sigma**2))
        filter_sum=np.sum(filt)
        filt=filt/filter_sum

        for i in range(2, imn.shape[0]-2):
            for j in range(2, imn.shape[1]-2):
                for k in range(3):
                    imn2[i,j,k] = np.sum(np.multiply(imn[i-2:i+3,j-2:j+3,k],filt[0:5,0:5]))
        plt.imshow(imn2)
        plt.show()
        plt.imsave("Gaussian_Blur.jpg",imn2)
        return imn2

             
#%%
"""
Problem 3

First we calculate the value at each pixel after convolution on horizontal and vertical 
directions, then we check the Euclidean value for each pixel so that we may find the 
value in any given directions. 
"""

#im3 = mpimg.imread("sqr.jpg")
#im3 = im3/255.0

def detect_edge(im3, method):
    img3 = im3.copy()
    imo3 = img3.copy()
    vertical_filter=np.array([[-1,0,1],[-2,0,2],[-1,0,1]])
    horizontal_filter=np.array([[-1,-2,-1],[0,0,0],[1,2,1]])
    if method == "vertical":
        for i in range(1, img3.shape[0]-1):
            for j in range(1, img3.shape[1]-1):
                for k in range(3):
                    const = (np.sum(img3[i-1:i+2,j-1:j+2,k] * vertical_filter)+4)/8
                    if const > 0.7:
                        imo3[i,j,k] = 1
                    if const < 0.3:
                        imo3[i,j,k] = 0
                    if const  >= 0.3 and const <= 0.7:
                        imo3[i,j,k] = 0.5
        plt.imshow(imo3)
        plt.show()
        plt.imsave("vertical_bound.jpg",imo3)
        return imo3
    
    if method == "horizontal":
        for j in range(1, img3.shape[1]-1):
            for i in range(1, img3.shape[0]-1):
                for k in range(3):
                    const = (np.sum(img3[i-1:i+2,j-1:j+2,k] * horizontal_filter)+4)/8
                    if const > 0.7:
                        imo3[i,j,k] = 1
                    if const < 0.3:
                        imo3[i,j,k] = 0
                    if const >= 0.3 and const <= 0.7:
                        imo3[i,j,k] = 0.5
        plt.imshow(imo3)
        plt.show()
        plt.imsave("horizontal_bound.jpg",imo3)
        return imo3
    
    if method == "both":
        for i in range(1, img3.shape[0]-1):
            for j in range(1, img3.shape[1]-1):
                for k in range(3):
                    const1 = np.sum(img3[i-1:i+2,j-1:j+2,k] * vertical_filter)
                    const2 = np.sum(img3[i-1:i+2,j-1:j+2,k] * horizontal_filter)
                    const = np.sqrt(const1**2+const2**2)/4
                    if const > 0.7:
                        imo3[i,j,k] = 1
                    if const < 0.3:
                        imo3[i,j,k] = 0
                    if const >= 0.3 and const <= 0.7:
                        imo3[i,j,k] = 0.5
        plt.imshow(imo3)
        plt.show()
        plt.imsave("all_bound.jpg",imo3)
        return imo3