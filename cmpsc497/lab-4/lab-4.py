#Julian Marin
#Lab 4
#9/4/2018

import numpy as np

#Vector
a = np.array([70, 170])
b = np.array([90, 80])

#Zip
print(np.dstack ((a, b)))

#Subtract
print(np.subtract(a, b))

#Sum
print(np.sum(a))

#Multiply
print(np.multiply(a, b))

#Mean
print(np.mean(a))

#Dot
print(np.dot(a, b))

#Square
print(np.square(a))

#Magnitude
print(np.linalg.norm(a))

#Distance
print(np.linalg.norm(a - b))

#Matrix
aM = np.array([[1, 2], [3, 4]])
bM = np.array([[5, 6], [7, 8]])

#Shape
print(np.shape(aM))

#Row/Column
print(aM[0])        #Row
print(aM[:, 0])     #Column

#zeros
dM = np.zeros([5,5])
print(dM)

#Diagonal
np.fill_diagonal(dM, 1)
print(dM)