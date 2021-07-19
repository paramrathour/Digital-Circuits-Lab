import numpy as np
import sympy as sp

n = 4
Max = 2**n

def generateBinaryStrings(n, Max):
    return [bin(i)[2:].zfill(n) for i in range(Max)]

BinaryStrings = generateBinaryStrings(n, Max)

s = "1011"

int(s,2)

def multiplyIntegers(a,b,n, Max):
    return a * b;

numberOfOutputBits = 8

with open("Tracefile.txt", "w") as file: 
    for i in range(Max):
        for j in range(Max):
            I1 = BinaryStrings[i]
            I2 = BinaryStrings[j]
            output = multiplyIntegers(i,j,n, Max)
            mask = '1'*numberOfOutputBits
            o = bin(output)[2:].zfill(numberOfOutputBits)
            str = "{}{} {} {}\n".format(I1, I2, o, mask)
            file.write(str)