function generateBinaryString(n, max) # Strings of binary numbers from 00... to 11... of length n
    return [string(i, base = 2, pad=n) for i in 0:max]
end

function OneCounter(string)        # returns number of ones in decimal
    count = 0
    for i in string
        if (i == '1')
          count += 1  
        end
    end
    return count
end

n = 8
max = 2^n - 1
BinaryStrings = generateBinaryString(n, max)

open("TRACEFILE.txt","w") do file
    for i in BinaryStrings
        count = OneCounter(i)                    # Function returns number of ones in decimal
        c = string(count, base = 2, pad = 4)     # Convert count to binary
        M = "1111"                               # Mask bit
        write(file,"$i $c $M\n")                 # Writing in file
    end
end
