fibonacciSequence :: Int -> [Integer]
fibonacciSequence n = take n fibs
  where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

