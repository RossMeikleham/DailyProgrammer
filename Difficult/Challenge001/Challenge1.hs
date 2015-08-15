{-# LANGUAGE ScopedTypeVariables #-}

import System.Random

data GuessResult = Low | High | Correct


getResult :: (Int, Int) -> Int -> IO GuessResult
getResult (low, high) num = do
    putStrLn $ "I guess the number is " ++ show num
    putStrLn "Am I too low (l), too high (h), or am I correct (c)?"
    putStr "> "
    result <- getLine 
    case result of
        "l" -> if num >= high
               then do 
                    putStrLn $ "Number cannot be greater than " ++ show high
                    getResult (low, high) num
               else return Low

        "h" -> if num <= low 
               then do
                    putStrLn $ "Number cannot be les than " ++ show low
                    getResult (low, high) num
               else return High

        "c" -> return Correct

        other -> do
                 putStrLn "Either enter \"l\" if my guess was too low, \"h\"\ 
                    \ if my guess was too high, or \"c\" if my guess was correct."

                 getResult (low, high) num


guess :: (Int, Int) -> StdGen -> IO ()
guess (low, high) rng = 
    if low == high 
        then putStrLn $ "The number must be " ++ show low ++ "!"
        else do
            let (num :: Int, rng') = randomR (low, high) rng
            result <- getResult (low, high) num
            case result of
                Low -> guess (num + 1, high) rng'
                High -> guess (low, num - 1) rng'
                Correct -> putStrLn "Yay!" 

main = do
  rng <- newStdGen
  let (num :: Int, rng') = randomR (0, 100) rng
  guess (0, 100) rng
