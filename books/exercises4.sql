
-- 1) Evaluate the following: 

-- SELECT 10 != 10;		False/0
-- SELECT 15 > 14 && 99 - 5 <= 94; 		True/1
-- SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; 	True/1

-- ==============================================================================================================

-- 2) Select all books written before 1980

SELECT * FROM books WHERE released_year < 1980;

-- ==============================================================================================================

-- 3) Select all books written by Eggers or Chabbon

SELECT book_id, title, author_lname FROM books WHERE author_lname="Eggers" || author_lname="Chabon";

SELECT title, author_lname FROM books WHERE author_lname IN ('Eggers','Chabon');

-- ====================================================================================

-- 4) Select all books written by Lahiri, published after 2000

SELECT title, author_lname, released_year FROM books WHERE author_lname="Lahiri" && released_year > 2000;

-- =============================================================================================================

-- 5) Select all books with page count between 100 and 200

SELECT title, pages FROM books WHERE pages BETWEEN 100 AND 200;

-- ==============================================================================================================

-- 6) Select all books where author_lname starts with a "C" or an "S"

SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT title, author_lname FROM books WHERE SUBSTR(author_lname, 1, 1) = "C" OR SUBSTR(author_lname, 1, 1) = "S";

SELECT title, author_lname FROM books WHERE SUBSTR(author_lname, 1, 1) IN ('C', 'S');


-- ==============================================================================================================

-- 7) Use "case statements" to categorize books based on their title

SELECT title, author_lname, author_fname, 

	CASE

		WHEN title LIKE '%stories%' THEN 'Short Stories'
		WHEN title = "Just Kids" || title = 'A Heartbreaking Work of Staggering Genius'	THEN 'Memoirs'
		ELSE 'Novel' 
	END AS Genre
FROM books;

-- ==============================================================================================================

-- 8) Group by author, and count how many books each author has written

SELECT author_lname,
	
	CASE 

		WHEN COUNT(*) = 1 THEN '1 book'
		ELSE CONCAT(COUNT(*), ' books')
	END AS Count
FROM books GROUP BY author_lname, author_fname;
