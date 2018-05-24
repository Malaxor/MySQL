
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);
 
 
CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) 
	 REFERENCES students(id)
     ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- ==============================================================================================


-- 1) Print a joint table that includes first_name, title and grade

SELECT first_name, title, grade 
FROM students INNER JOIN papers 
ON students.id=papers.student_id 
ORDER BY grade DESC;

-- ==============================================================================================

-- 2 Print a joint table that includes first_name, title and grade for all students

SELECT first_name, title, grade
FROM students LEFT JOIN papers
ON students.id=papers.student_id;

-- ==============================================================================================

-- 3 Print a joint table that includes first_name, title and grade -->
-- substituting null grade with a 0 and null title with "MISSING"

SELECT first_name, 
IFNULL(title, "MISSING"), 
IFNULL(grade, 0)
FROM students LEFT JOIN papers
ON students.id=papers.student_id;

-- ==============================================================================================

-- 4 Print a joint table that includes first_name and average grade.
-- If a student didn't turn in a paper, the grade is 0.

SELECT first_name,  
IFNULL(AVG(grade), 0) AS average
FROM students LEFT JOIN papers
ON students.id=papers.student_id
GROUP BY students.id
ORDER BY average DESC;

-- ==============================================================================================

-- 5 Print a table that includes first_name, average and a new column called passing_status

SELECT first_name,  
IFNULL(AVG(grade), 0) AS average,
CASE
	WHEN AVG(grade) IS NULL THEN 'FAILLING'
	WHEN AVG(grade) >= 75 THEN "PASSING"
	ELSE "FAILLING"
END AS passing_status
FROM students LEFT JOIN papers
ON students.id=papers.student_id
GROUP BY students.id
ORDER BY average DESC;







