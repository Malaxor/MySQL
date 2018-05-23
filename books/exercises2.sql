
-- 1) Select titles that contain the word "stories"

SELECT title FROM books WHERE title LIKE '%stories%';

-- ===================================================================================

-- 2) Find the longest book; print out the title and page count

SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- ====================================================================================

-- 3) Print a summary containing the title and year, for the three most recent books

SELECT CONCAT(title, " - ", released_year) AS 'summary' FROM books 
ORDER BY released_year DESC LIMIT 3;

-- ====================================================================================

-- 4) Find all the books with an author's last name that contains a space

SELECT title, author_lname FROM books WHERE author_lname LIKE'% %';

-- ====================================================================================

-- 5) Find the three books with the lowest stock quantity

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

-- ====================================================================================

-- 6) Print title and author_lname, sorter first by author, then by title

SELECT title, author_lname FROM books ORDER BY 2, 1;

-- ====================================================================================

-- 7) Sort alphabetically, by last name

SELECT 
	UPPER
	(
		CONCAT('MY FAVORITE AUTHOR IS', ' ', author_fname, ' ', author_lname)
	) 
FROM books ORDER BY author_lname;
