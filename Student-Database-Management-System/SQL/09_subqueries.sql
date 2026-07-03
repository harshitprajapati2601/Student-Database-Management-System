/*
Project Name : Student Database Management System
File Name    : 09_subqueries.sql
Description  : SQL Subquery Examples
*/

USE student_dbms;

-- Scalar Subqueries

-- Student(s) Having Highest Marks
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    r.marks
FROM students s
INNER JOIN results r
ON s.student_id = r.student_id
WHERE r.marks = (
    SELECT MAX(marks)
    FROM results
);

-- Student(s) Having Lowest Marks
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    r.marks
FROM students s
INNER JOIN results r
ON s.student_id = r.student_id
WHERE r.marks = (
    SELECT MIN(marks)
    FROM results
);

-- Students Scoring Above Average Marks
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    r.marks
FROM students s
INNER JOIN results r
ON s.student_id = r.student_id
WHERE r.marks > (
    SELECT AVG(marks)
    FROM results
);

-- IN Subquery

-- Students Enrolled in Java Programming
SELECT
    student_id,
    first_name,
    last_name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM enrollments
    WHERE course_id = (
        SELECT course_id
        FROM courses
        WHERE course_name = 'Java Programming'
    )
);

-- NOT IN Subquery

-- Students Not Enrolled in Any Course
SELECT
    student_id,
    first_name,
    last_name
FROM students
WHERE student_id NOT IN (
    SELECT student_id
    FROM enrollments
);

-- EXISTS Subquery

-- Students Who Have Results
SELECT
    student_id,
    first_name,
    last_name
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM results r
    WHERE r.student_id = s.student_id
);

-- NOT EXISTS Subquery

-- Students Without Results
SELECT
    student_id,
    first_name,
    last_name
FROM students s
WHERE NOT EXISTS (
    SELECT 1
    FROM results r
    WHERE r.student_id = s.student_id
);

-- Correlated Subquery

-- Students Scoring Above Their Course Average
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    r.course_id,
    r.marks
FROM students s
INNER JOIN results r
ON s.student_id = r.student_id
WHERE r.marks >
(
    SELECT AVG(r2.marks)
    FROM results r2
    WHERE r2.course_id = r.course_id
);

-- Subquery in FROM Clause

-- Average Marks Report
SELECT *
FROM
(
    SELECT
        course_id,
        AVG(marks) AS average_marks
    FROM results
    GROUP BY course_id
) AS course_report;

-- Subquery with Aggregate Function

-- Course(s) Having Maximum Average Marks
SELECT *
FROM
(
    SELECT
        course_id,
        AVG(marks) AS avg_marks
    FROM results
    GROUP BY course_id
) AS avg_result
WHERE avg_marks =
(
    SELECT MAX(avg_marks)
    FROM
    (
        SELECT AVG(marks) AS avg_marks
        FROM results
        GROUP BY course_id
    ) AS temp
);