import System.IO

parseAge :: String -> Either String Int
parseAge s = 
    if length xs /= 1 || (not . null) excess || (age < 0)
        then Left "Error: Expected a non negative number"
        else Right age    
    where xs = reads s :: [(Int, String)]
          excess = snd $ head xs
          age = fst $ head xs


main = do
    putStrLn "What is your name?"
    name <- getLine
    putStrLn "What is your age?"
    ageStr <- getLine
    case parseAge ageStr of

       (Left err) -> putStrLn err
       (Right age) -> do
            putStrLn "What is your username"
            username <- getLine

            putStrLn $ "Your name is " ++ name ++ ", you are " ++ show age ++
                        " years old, and your username is " ++ username

            -- Write to file
            handle <- openFile "out.txt" WriteMode  
            hPutStrLn handle name >> hPutStrLn handle (show age) >> hPutStrLn handle username  
            hClose handle  
            
