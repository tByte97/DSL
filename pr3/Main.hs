import LibraryMain
import Data.List (filter, intercalate)


main :: IO ()
main = do
    putStrLn "Всі доступні жанри: (1 спосіб)"
    print ([Fiction .. Programming] :: [Genre])
    putStrLn "Всі доступні жанри (2 спосіб):"
    print ([minBound.. maxBound] :: [Genre])

    putStrLn "---------"

    putStrLn ""
    let available = getAvailableBooks catalog
    putStrLn $ "Книги для видачі (" ++ show (length available) ++ "):"
    mapM_ (putStrLn . title) available
    putStrLn ""
    -- 3.2
    let progBooks = getBooksbyGenre Programming catalog
    putStrLn "Книги з програмування:"
    mapM_ (putStrLn . (\b -> title b ++ " (" ++ author b ++ ")")) progBooks
    putStrLn ""
    
    -- 3.3
    let martinBooks = getBooksbyAuthor "Robert C. Martin" catalog
    putStrLn $ "Книги Robert C. Martin: " ++ intercalate ", " (map title martinBooks)
    putStrLn ""


    let allTitles = getAllTitles catalog
    putStrLn $ "Список назв: "
    -- putStrLn $ intercalate ", " allTitles
    mapM putStrLn allTitles

    let progPages = getTotalPagesByGenre Programming catalog
    putStrLn $ "\nЗагальна кількість сторінок з книг для програмування: " ++ show progPages

    case averagePages catalog of
        Just avg -> putStrLn $ "Середня кількість сторінок у каталозі: " ++ show (round avg)
        Nothing  -> putStrLn "Каталог порожній."