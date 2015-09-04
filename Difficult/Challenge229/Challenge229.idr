-- Challenge 229 Hard In Idris


-- | Reverses a number
reverse : Integer -> Integer
reverse = cast . reverse . show

solution : Integer -> Integer
solution max = solution' 0 0 
  where solution' : Integer -> Integer -> Integer
        solution' n sum = 
          if nextN > max 
            then sum
            else solution' nextN newSum
          where nextN = n + 7
                newSum = if ((reverse nextN) `mod` 7) == 0 
                          then sum + nextN
                          else sum
main : IO()
main = print $ solution $ cast $ power 10 11 

