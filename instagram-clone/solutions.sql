
-- 1) Find the five users who've been on instagram for five years.

SELECT * FROM users ORDER BY created_at LIMIT 5;

-- ===============================================================================

-- 2) What day of the week do most users register on?

SELECT DAYNAME(created_at) AS 'day', COUNT(*) AS 'total'
FROM users 
GROUP BY day
ORDER BY total DESC LIMIT 1;

-- ===============================================================================

-- 3) Which users have never posted a photo?

SELECT username
FROM users 
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id is NULL;


-- ===============================================================================

-- 4) Which is the most liked photo (find user)?

SELECT username, photos.id, photos.image_url, COUNT(*) AS 'total'
FROM photos
INNER JOIN likes ON likes.photo_id = photos.id
INNER JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC LIMIT 1;


-- ===============================================================================

-- 5) Calculate the average number of photos posted per user.

SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS 'AVG';


-- ===============================================================================

-- 6) Which are the five most commonly used hashtags?

SELECT tags.tag_name, COUNT(*) AS 'total'
FROM photo_tags
JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY tags.id
ORDER BY total DESC LIMIT 5;

-- ===============================================================================

-- 7) Find the bots (users) who have liked every photo.

SELECT username, COUNT(*) AS 'total' 
FROM users
INNER JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING total = (SELECT COUNT(*) FROM photos);