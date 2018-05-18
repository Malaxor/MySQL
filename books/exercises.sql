
--1) Reverse and Uppercase 

SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?')) AS 'reverse string';
-- ========================================================================================

--2.Q) What does this print out?

SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '_');

--2.A) ANSWER: I_like_cats
-- ========================================================================================

-- 3) Replace spaces in titles with '->'

SELECT REPLACE(title, ' ', '->') AS 'title' FROM books;
-- ========================================================================================

-- 4) Print out author's last name (regular) and author's last name in reverse

SELECT author_lname AS 'forward', REVERSE(author_lname) AS 'backward' FROM books;
-- ========================================================================================

-- 5) Print out authors' full names

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) FROM books;
-- ========================================================================================

-- 6) For all the books, print out their title and release year, creating a sentence

SELECT CONCAT(title, ' was released in ', released_year) AS 'blurb' FROM books;
-- ========================================================================================

-- 7) Print book titles and their length

SELECT title AS 'title', CHAR_LENGTH(title) AS 'character count' FROM books;
-- ========================================================================================

-- 8) Print out short title, author and quantity

SELECT CONCAT(SUBSTRING(title, 1, 10), "...") AS 'short title', 
CONCAT(author_lname, ", ", author_fname) AS 'author', 
CONCAT(stock_quantity, " in stock") AS 'quantity' FROM books;