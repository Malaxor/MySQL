
-- 1.Q) What's a good use case for CHAR?
-- 1.A) When you know the fixed amount of string length.

-- =============================================================================

-- 2) Fill in the blanks (item_name = ?, price = ?, quantity = ?)

CREATE TABLE inventory (

	item_name VARCHAR(100),
	price DECIMAL(8,2)
	quantity INT
);

-- =============================================================================

-- 3.Q) What're the difference and similarities between DATETIME and TIMESTAMP?
-- 3.A) --  Similarities: they both store the date and time; 
--  		Differences: a) TIMESTAMPS have a much smaller range (1970 - 2038)
-- 						 b) TIMESTAMPS are used when we use matadata

-- =============================================================================

-- 4) Print out the current time

SELECT CURTIME();

-- =============================================================================

-- 5) Print out the current date

SELECT CURDATE();

-- =============================================================================

-- 6) Print out the current date of the week

SELECT DAYOFWEEK(CURDATE());
SELECT DATE_FORMAT(NOW(), '%w');

-- =============================================================================

-- 7) Print out the current date of the week (the day name)

SELECT DAYNAME(NOW());
SELECT DATE_FORMAT(NOW(), '%W');

-- =============================================================================

-- 8) Print out the current date and time using the following format: mm/dd/yyyy

SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

-- =============================================================================

-- 9) Print out the date and time using the following format: January 2nd at 3:15; April 1st at 10:18

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

-- =============================================================================

-- 10) Create a tweets table that stores the tweet content, username and the time it was created

CREATE TABLE tweets (content VARCHAR(140), username VARCHAR(20), tweeted_at TIMESTAMP DEFAULT NOW());
INSERT INTO tweets(content, username) VALUES('this is my first tweet', 'phil');

-- =============================================================================



