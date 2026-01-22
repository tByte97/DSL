module Main where

import PureFuncs 


main :: IO ()
main = do
    putStrLn "\n--чисті функції "
    
    putStrLn $ "квадрат 5 " ++ show (square 5)
    putStrLn $ "модуль числа -10" ++ show (absValue (-10))
    putStrLn $ "більше з двух 7 12" ++ show (maxOfTwo 7 12)
   
    {-
    1. чисті функції це функції які для одинакових вхідних завжди 
    повертає одинаковий результат (тобто зв'язок між входом та виходом є незмінним )
    2. не має побічних ефектів
    -}
    

    putStrLn "\n--рекурсія"
    putStrLn $ "факторіал 5 " ++ show (factorial 5)
    putStrLn ""
    putStrLn $ "сума зі списку [1, 2, 3] " ++ show (recursSum [1, 2, 3])
    putStrLn ""
    putStrLn $ "сума зі списку [10, -5, 7] " ++ show (recursSum [10, -5, 7])

    putStrLn "\nmap | filter | fold"
    let numbers = [1..10]
    putStrLn $ show numbers

    -- 4.2. map
    let squares = map (^2) numbers
    let squares2 = map square numbers

    putStrLn $ "map(^2) " ++ show squares
    putStrLn $ "map (square) " ++ show squares2 ++ "\n"


    -- 4.2. filter 
    let evens = filter even numbers
    putStrLn $ "Парні числа: " ++ show evens ++  "\n"


    -- 4.2. fold 
    let sumTotal = foldl (+) 0 numbers
    putStrLn $ "cума списку: " ++ show sumTotal ++ "\n"

    putStrLn "композиція функцій"
    let testList = [1,6,7,4,2,6,7,2]
    let res = sumSquaredEvens testList
    putStrLn $ show testList ++ " -> " ++ show res


    putStrLn $ "другий список"
    let testList = [1..4]
    let res = sumSquaredEvens testList
    putStrLn $ show testList ++ " -> " ++ show res




sumSquaredEvens :: [Int] -> Int
sumSquaredEvens = sum . map square . filter even