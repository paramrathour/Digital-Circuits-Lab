import numpy as np
import sympy as sp

n = 4
Max = 2**n

def generateBinaryStrings(n, Max):
    return [bin(i)[2:].zfill(n) for i in range(Max)]

BinaryStrings = generateBinaryStrings(n, Max)

def addBinaryIntegers(a,b,n, Max):
    c = a + b
    carry = 0
    if c > Max - 1:
        c = c - Max
        carry = 1
    return c, carry

def subBinaryIntegers(a,b,n, Max):
    b = 2**n - b
    c = a + b
    carry = 0
    if c > Max - 1:
        c = c - Max
        carry = 1
    carry = 1 - carry
    return c, carry

subBinaryIntegers(2,14,n,Max)

def PrimeCheck(string):
    if (sp.isprime(int(string,2))):
        return 1
    else:
        return 0

numberOfOutputBits = 7

with open("Tracefile.txt", "w") as file: 
    for i in range(Max):
        for j in range(Max):
            I1 = BinaryStrings[i]
            I2 = BinaryStrings[j]
            opa = PrimeCheck(I1)
            opb = PrimeCheck(I2)
            if opa == 1 and opb == 1:
                output, carry = subBinaryIntegers(i,j,n, Max)
            elif opa == 1 or opb == 1:
                output, carry = addBinaryIntegers(i,j,n, Max)
            else:
                output, carry = 0, 0
            mask = '1'*numberOfOutputBits
            o = bin(output)[2:].zfill(n)
            str = "{}{} {}{}{}{} {}\n".format(I1, I2, opa, opb, carry, o, mask)
            file.write(str)