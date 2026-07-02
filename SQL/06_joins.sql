/*
Project Name : Student Database Management System
File Name    : 06_joins.sql
Description  : Examples of SQL JOIN Operations
*/

USE student_dbms;

-- 1. INNER JOIN
-- Display Student Name and Enrolled Course

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON e.course_id = c.course_id;

-- 2. LEFT JOIN
-- Display All Students and Their Courses

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id;

-- 3. RIGHT JOIN
-- Display All Courses Even If No Student Is Enrolled

SELECT
    c.course_name,
    CONCAT(s.first_name,' ',s.last_name) AS student_name
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id
RIGHT JOIN courses c
ON e.course_id = c.course_id;

-- 4. CROSS JOIN
-- Every Student With Every Course

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name
FROM students s
CROSS JOIN courses c;

-- 5. MULTI TABLE JOIN
-- Student + Course + Faculty

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    f.faculty_name
FROM enrollments e
INNER JOIN students s
ON e.student_id = s.student_id
INNER JOIN courses c
ON e.course_id = c.course_id
INNER JOIN faculty f
ON e.faculty_id = f.faculty_id;

-- 6. Student Results

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    r.marks,
    r.grade
FROM results r
INNER JOIN students s
ON r.student_id = s.student_id
INNER JOIN courses c
ON r.course_id = c.course_id;

-- 7. Attendance Report

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    a.attendance_date,
    a.status
FROM attendance a
INNER JOIN students s
ON a.student_id = s.student_id
INNER JOIN courses c
ON a.course_id = c.course_id;

-- 8. FULL OUTER JOIN (MySQL Alternative)

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name
FROM students s
LEFT JOIN enrollments e
ON s.student_id = e.student_id
LEFT JOIN courses c
ON e.course_id = c.course_id
UNION
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name
FROM students s
RIGHT JOIN enrollments e
ON s.student_id = e.student_id
RIGHT JOIN courses c
ON e.course_id = c.course_id;