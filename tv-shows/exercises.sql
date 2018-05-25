
-- 1) Print a table that displays all the series' names and their ratings

SELECT title, rating FROM series INNER JOIN reviews ON series.id = reviews.series_id;

-- ===========================================================================================

-- 2) Print a table that displays the average rating for each series 

SELECT 
  title, 
  AVG(rating) AS 'avg_rating'
FROM series 
INNER JOIN reviews 
ON series.id = reviews.series_id 
GROUP BY series.id
ORDER BY avg_rating;

-- ============================================================================================

-- 3) Print a table that displays for every review that's been given the reviewers full name

SELECT 
  first_name, 
  last_name, rating 
FROM reviewers 
INNER JOIN reviews ON reviewers.id = reviews.reviewer_id;

-- ============================================================================================


-- 4) Print a table that displays all the series that haven't been reviewed

SELECT 
  title AS 'unreviewed_series'
FROM series 
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE rating IS NULL;

-- ============================================================================================

-- 5) Print a table that displays the average rating for each genre

SELECT 
  genre, 
  ROUND(AVG(rating), 2) AS 'avg_rating'
FROM series
INNER JOIN reviews ON series.id = reviews.series_id
GROUP BY genre
ORDER BY avg_rating DESC;

-- ============================================================================================

-- 6) Print a table that includes the number of ratings each user has awarder, 
-- the min. and max rating, the average rating and whether or not the reviewer is active

SELECT 
  first_name,
  last_name,
  COUNT(rating) AS 'count',
  IFNULL(MIN(rating), 0) AS 'MIN',
  IFNULL(MAX(rating), 0) AS 'MAX',
  IFNULL(AVG(rating), 0) AS 'avg_rating',
  IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS 'STATUS'
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id
ORDER BY count DESC;

SELECT 
  first_name,
  last_name,
  COUNT(rating) AS 'count',
  IFNULL(MIN(rating), 0) AS 'MIN',
  IFNULL(MAX(rating), 0) AS 'MAX',
  IFNULL(AVG(rating), 0) AS 'avg_rating',
  CASE 
    WHEN COUNT(rating) >= 10 THEN 'POWER USER' 
    WHEN COUNT(rating) > 0  THEN 'ACTIVE'
    ELSE 'INACTIVE' 
  END  AS 'STATUS' 
FROM reviewers
LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id
ORDER BY count DESC;

-- ============================================================================================

-- 7) Print a table that prints out all the serie's titles, and their corresponding reviwer ratings

SELECT 
  title,
  rating,
  CONCAT(first_name,' ', last_name) AS 'reviewer'
FROM reviewers 
INNER JOIN reviews ON reviewers.id = reviews.reviewer_id
INNER JOIN series ON series.id = reviews.series_id
ORDER BY title;
