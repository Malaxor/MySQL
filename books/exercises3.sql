
-- 1) Print the total number of books in the database

SELECT COUNT(*) FROM books;

-- ========================================================================================

-- 2) Print out how many books were released each year

SELECT released_year, COUNT(*) AS 'Count' FROM books GROUP BY released_year;

-- ========================================================================================

-- 3) Print out the total number of books in stock

SELECT Sum(stock_quantity) AS 'Total Books in Stock' FROM books;

-- ========================================================================================

-- 4) Find the average released_year for each other

SELECT author_lname, author_fname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;

-- ========================================================================================

-- 5) Find the full name of the author who wrote the longest books

SELECT CONCAT(author_fname, " ", author_lname) AS 'author', pages, title FROM books ORDER BY pages DESC LIMIT 1;

-- ========================================================================================

-- 6) Print out released_year, number of books and average pages

SELECT released_year AS 'year', 
Count(*) AS "# books", 
AVG(pages) AS 'avg pages' 
FROM books GROUP BY released_year;