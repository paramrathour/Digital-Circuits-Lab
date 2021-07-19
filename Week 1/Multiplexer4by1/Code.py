import numpy as np

n = 7
Max = 2**n

def generateBinaryStrings(n, Max):
    return [bin(i)[2:].zfill(n) for i in range(Max)]

BinaryStrings = generateBinaryStrings(n, Max)

def MuxOutput(string):
    sizeofS = int(np.log2(len(string) + 1)-1)
    Enable  = string[0]
    S       = [i for i in string[1:sizeofS+1]]
    Svalue  = int(''.join(S),2)
    Inputs  = [i for i in string[sizeofS+1:]]
    if (Enable == '0'):
        return 0
    else:
        return int(string[1+sizeofS+Svalue])

numberOfOutputBits = 1

with open("Tracefile.txt", "w") as file: 
    for i in range(Max):
        I = BinaryStrings[i]
        output = MuxOutput(I)
        mask = '1'*numberOfOutputBits
        O = bin(output)[2:].zfill(numberOfOutputBits)
        str = "{} {} {}\n".format(I, O, mask)
        file.write(str)