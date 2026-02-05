module LibraryMain where
import Data.List (filter, intercalate)

--1
data Genre = Fiction | NonFiction | Science | Historical | Programming | Other deriving (Show, Eq, Enum, Bounded)

data Status = Available | Issued | Archived deriving (Show, Eq, Enum)

data Book = Book {
    bookId :: Int,
    title :: String,
    author :: String,
    year :: Int,
    genre :: Genre,
    pages :: Int,
    status :: Status
} deriving (Show, Eq)

--2
catalog :: [Book]
catalog = [
    Book 1 "Кобзар" "Тарас Шевченко" 1840 Fiction 320 Available,
    Book 2 "Чистий код" "Robert C. Martin" 2008 Programming 450 Available,
    Book 3 "Мистецтво програмування" "Дональд Кнут" 1968 Science 650 Issued,
    Book 4 "Шерлок Голмс" "Артур Конан Дойл" 2019 Fiction 720 Available,
    Book 5 "Історія України" "Unknown" 2003 Historical 300 Archived,
    Book 6 "Убивства за абеткою" "Аґата Крісті" 2023 Fiction 288 Issued,
    Book 7 "1984" "George Orwell" 1949 Fiction 328 Available,
    Book 8 "Домашнє кондитерство" "Unknown" 2015 NonFiction 220 Available, 
    Book 9 "Алгоритми. Побудова та аналіз" "Cormen et al." 1990 Programming 1312 Archived,
    Book 10 "Sapiens: Людина розумна" "Yuval Noah Harari" 2011 NonFiction 512 Issued
    ]

--3
getAvailableBooks :: [Book] -> [Book]
getAvailableBooks = filter (\b -> status b == Available)

getBooksbyGenre :: Genre -> [Book] -> [Book]
getBooksbyGenre g = filter (\b -> genre b == g) 

getBooksbyAuthor :: String -> [Book] -> [Book]
getBooksbyAuthor a = filter (\b -> author b == a)

    
--4
getAllTitles :: [Book] -> [String]
getAllTitles = map title

describeBook :: [Book] -> [String]
describeBook books = map(\Book{title = t} -> "Назва книги " ++ t) books

getTotalPagesByGenre :: Genre -> [Book] -> Int
getTotalPagesByGenre g bs = foldl (+) 0 $ map pages $ getBooksbyGenre g bs

averagePages :: [Book] -> Maybe Double
averagePages [] = Nothing
averagePages bs = Just (fromIntegral total / fromIntegral count)
  where 
    total = sum $ map pages bs
    count = length bs

-- main :: IO ()
-- main = do
--     putStrLn "Всі доступні жанри: (1 спосіб)"
--     print ([Fiction .. Programming] :: [Genre])
--     putStrLn "Всі доступні жанри (2 спосіб):"
--     print ([minBound.. maxBound] :: [Genre])

--     putStrLn "---------"

--     putStrLn ""
--     let available = getAvailableBooks catalog
--     putStrLn $ "Книги для видачі (" ++ show (length available) ++ "):"
--     mapM_ (putStrLn . title) available
--     putStrLn ""
--     -- 3.2
--     let progBooks = getBooksbyGenre Programming catalog
--     putStrLn "Книги з програмування:"
--     mapM_ (putStrLn . (\b -> title b ++ " (" ++ author b ++ ")")) progBooks
--     putStrLn ""
    
--     -- 3.3
--     let martinBooks = getBooksbyAuthor "Robert C. Martin" catalog
--     putStrLn $ "Книги Robert C. Martin: " ++ intercalate ", " (map title martinBooks)
--     putStrLn ""


--     let allTitles = getAllTitles catalog
--     putStrLn "Список назв:"
--     -- putStrLn $ intercalate ", " allTitles   
--     mapM putStrLn allTitles


--     let progPages = getTotalPagesByGenre Programming catalog
--     putStrLn $ "\n Загальна кількість сторінок з книг для програмування: " ++ show progPages

--     case averagePages catalog of
--         Just avg -> putStrLn $ "Середня кількість сторінок у каталозі: " ++ show (round avg)
--         Nothing  -> putStrLn "Каталог порожній."