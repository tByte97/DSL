normalizeGrades :: [Double] -> [Double]
normalizeGrades [] = []
normalizeGrades grades = 
    let maxG = maximum grades
    in map (\g -> (g / maxG) * 100) grades

filterThreshold :: Double -> [Double] -> [Double]
filterThreshold threshold grades = filter (>= threshold) grades

average :: [Double] -> Double
average [] = 0
average xs = (foldl (+) 0 xs) / fromIntegral (length xs)


-- grades = [60, 75, 90, 100, 45, 82, 73]

-- norm = normalizeGrades grades

-- filtered = filterThreshold 70 norm

-- avgBefore = average grades

-- avgAfter = average filtered