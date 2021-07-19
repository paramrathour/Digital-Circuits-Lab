function AddBinaryIntegers(a,b,n,max)
    c = a+b
    carry = 0
    if c > max
        c = c - max - 1
        carry = 1
    end
    return c, carry
end

n = 8
max = 2^n - 1

DecimalNumbers = [i for i in 0:max]

open("tracefile.txt","w") do file
    for i in DecimalNumbers
        for j in DecimalNumbers
            I1 = string(i, base = 2, pad=n)             # Convert i to binary string
            I2 = string(j, base = 2, pad=n)             # Convert j to binary string
            Output, OutputCarry = AddBinaryIntegers(i,j,n,max) # Function returns output and carry in Decimal
            O, C = string(Output, base = 2, pad=n), string(OutputCarry, base = 2, pad=1) # Calculating output and carry in Binary
            M = "11111"                                 # Mask bit
            write(file,"$I1$I2 $C$O $M\n")              # Writing to file
        end
    end
end
