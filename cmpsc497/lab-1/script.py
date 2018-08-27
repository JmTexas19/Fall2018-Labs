# -*- coding: utf-8 -*-
"""
Name :  Julian Marin
Class : CMPSC 497
Date :  8/27/2018
Lab :   1
"""

from copy import deepcopy
import sys

matrixM = [
        [3, 3, 3, 3, 3, 3, 3, 3],
        [3, 3, 3, 3, 3, 3, 3, 3],
        [3, 3, 3, 3, 3, 3, 3, 3],
        [3, 3, 3, 3, 3, 3, 3, 3],
        [3, 3, 3, 3, 3, 3, 3, 3],
        [3, 3, 3, 3, 3, 3, 3, 3],
        [3, 3, 3, 3, 3, 3, 3, 3],
        [3, 3, 3, 3, 3, 3, 3, 3]
]

print "Current Matrix M:\n", matrixM, "\n"

#Multiplication Variable
n = 2
print "Variable n:", 2, "\n"


#Nested Loop Scalar Multiplication
tempMatrix = deepcopy(matrixM)
for i in range(0,8,1):
    for j in range(0,8,1):
        temp = tempMatrix[i][j]
        tempMatrix[i][j] = temp * n

print "Matrix M after scalar multiplication:\n", tempMatrix, "\n"

matrixO = [
        [1, 2, 3, 4, 5, 6, 7, 8],
        [1, 2, 3, 4, 5, 6, 7, 8],
        [1, 2, 3, 4, 5, 6, 7, 8],
        [1, 2, 3, 4, 5, 6, 7, 8],
        [1, 2, 3, 4, 5, 6, 7, 8],
        [1, 2, 3, 4, 5, 6, 7, 8],
        [1, 2, 3, 4, 5, 6, 7, 8],
        [1, 2, 3, 4, 5, 6, 7, 8]
]

print "Matrix O:\n", matrixO, "\n"

matrixMO = [
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
]

#Nested Loop Matrix Multiplication
for i in range(0,8,1):
    for j in range(0,8,1):
        for k in range(0,8,1):
            matrixMO[i][j] += matrixM[i][k] * matrixO[k][j]

print "Matrix MO:\n", matrixMO, "\n"

matrixD = [
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
        [24, 48, 72, 96, 120, 144, 168, 192, 0],
]

#Nested Loop Minimum of current row
for i in range(0,8,1):
    minimum = sys.maxsize
    for j in range(0,8,1):
        for k in range(0,8,1):
            if matrixD[i][j] < minimum:
                minimum = matrixD[i][j]
            matrixD[k][8] = minimum
 
print "Matrix D:\n", matrixD, "\n"
