import math
from decimal import Decimal

def getPoint(s, n) :
    if n > (s**2) or n <= 0 or (s & 0x1 != 0x1):
        print("Error expected n > 0 and n < s^2, and s to be odd")
    else:
        #Obtain co-ordinates for center of the spiral
        center = (s + 1) / 2
    
        #Next obtain the "level" that the given n is in,
        #Low represents the lowest value, and high the highest
        # e.g. level 0 is for n =1, 
        #level 1 is between 2 and 9, then level 2 is between 10 and 25 etc.
        high = (math.ceil(math.sqrt(n)))**2     
        low = 0
        
        #Highest must be a square number must be the next square number 
        #above or equal to n which is odd
        if (high & 0x1 != 0x1):
            high = (math.sqrt(high) + 1)**2

        sqrtHigh = math.sqrt(high)
        low = (sqrtHigh - 2)**2 + 1
        sideLength = (high - low + 1)/4
        offset = (sqrtHigh - 1)/2 # Offset from center where the perimiter is

        # End Of Spiral
        if (n == high):
            return (center + offset, center + offset)

        # Right side of spiral
        elif (n <= low + sideLength - 1):
            y = low - n + ((sqrtHigh - 3)/2)
            return (center + offset, center + y)

        # Top side of spiral (excluding top right positon)
        elif (n <= low + (sideLength * 2) - 1):
            x = low - n + sideLength + ((sqrtHigh - 3)/2)
            return (center + x, center - offset)
        
        # Left side of spiral (excluding top left positon)
        elif (n <= low + (sideLength * 3) - 1):
            y = low - n + (2 * sideLength) + ((sqrtHigh - 3)/2) 
            return (center - offset, center - y)

        # Bottom side of spiral (excluding bottom left position)
        else:
            x = low - n + (3 * sideLength) + ((sqrtHigh - 3)/2)
            return (center - x, center + offset)
        


def getN(s, x, y):
    if (x < 1 or x > s) or (y < 1 or y > s) or (s & 0x1 != 0x1):
        print("Error, expected 1 <= x,y <= s, and s to be odd")
    else:
        center = Decimal((s + 1)/2)
        
        #Use Chebyshev distance to work out how many "levels" out the point is
        level = Decimal(max(abs(x - center), abs(y - center)))
        squareLevel = Decimal(2 * level + 1)

        # Before Top Left Corner
        if (x > y):
            low = Decimal((squareLevel - 2)**2 + 1)
            n = Decimal(low + squareLevel - 2 - ((x - center) + (y - center)))
            return n

        # After Top Left Corner
        elif (y > x):
            low = Decimal((squareLevel - 1)**2 + 2)
            n = Decimal(low + squareLevel - 2 + ((x - center) + (y - center)))
            return n
        
        ##On the main Diagonal
        else:
            if (y < center):
                return (squareLevel - 1)**2 + 1
            elif (y > center):
                return squareLevel ** 2
            else:
                return 1
                
        
def points():
    s = int(input())
    n = int(input())
    print(getPoint(s, n))


def n():
    s = int(input())
    x = int(input())
    y = int(input())
    print(getN(s, x, y)) 

n()
