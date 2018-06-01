
-- 1) Find the earliest date a user joined.

SELECT DATE_FORMAT(MIN(created_at), '%M %D %Y') AS 'earliest date 'FROM users;

-- ====================================================================================

-- 2) Find the email of the user who joined the earliest.

SELECT * FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);

-- ====================================================================================

-- 3) Print a table that displays number of users according to the month they joined.

SELECT 
MONTHNAME(created_at) AS month, 
COUNT(*)  AS count 
FROM users 
GROUP BY month
ORDER BY count DESC;

-- ====================================================================================

-- 4) Count the number of users with yahoo emails.

SELECT COUNT(*) AS 'yahoo users' FROM users WHERE email LIKE '%@yahoo.com%';

-- ====================================================================================

-- 5) Calculate the total number of users for each email host.

SELECT 
	CASE
		WHEN email LIKE '%@yahoo.com%' THEN 'yahoo'
		WHEN email LIKE '%@gmail.com%' THEN 'gmail'
		WHEN email LIKE '%@hotmail.com%' THEN 'hotmail'
		ELSE 'other'
	END AS Provider,
	COUNT(*) AS total_users
FROM users
GROUP BY Provider
ORDER BY total_users DESC;	