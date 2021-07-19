import numpy as np
import sympy as sp

n = 4
Max = 2**n

def generateBinaryStrings(n, Max):
    return [bin(i)[2:].zfill(n) for i in range(Max)]

BinaryStrings = generateBinaryStrings(n, Max)

s = "1011"

int(s,2)

def PrimeCheck(string):
    if (sp.isprime(int(string,2))):
        return 1
    else:
        return 0

numberOfOutputBits = 1

with open("TRACEFILE.txt", "w") as file: 
    for i in range(Max):
        I = BinaryStrings[i]
        output = PrimeCheck(I)
        mask = '1'*numberOfOutputBits
        O = bin(output)[2:].zfill(numberOfOutputBits)
        str = "{} {} {}\n".format(I, O, mask)
        file.write(str)