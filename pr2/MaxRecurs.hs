myMax :: [Int] -> Int
myMax [] = error "Порожній список!"
myMax [x] = x
myMax (x:xs) = if x > m then x else m
  where m = myMax xs

maxFold :: [Int] -> Maybe Int
maxFold [] = Nothing
maxFold (x:xs) = Just $ foldl (\x y -> if y > x then y else x) x xs

-- [5,2,9,-3,7]  
-- [-5,-10,-2]