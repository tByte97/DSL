module PureFuncs where

--квадрат числа
square :: Int -> Int
square x = x * x

--модуль числа
absValue :: Int -> Int
absValue x
  | x < 0     = -x
  | otherwise = x

--більше з двох
maxOfTwo :: Int -> Int -> Int
maxOfTwo a b = if a > b then a else b


--факторіал
factorial :: Int -> Int
factorial 0 = 1          
factorial n = n * factorial (n - 1)

-- сума елементів зі списку
recursSum :: [Int] -> Int
recursSum [] = 0       
recursSum (x:xs) = x + recursSum xs

