sumSquaresOfEvens :: [Int] -> Int
sumSquaresOfEvens xs = foldl (+) 0 (map (^2) (filter even xs))

--[1, 2, 3, 4, 5, 6]
