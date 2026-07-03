/*
Project Name : Student Database Management System
File Name    : 08_group_by_having.sql
Description  : GROUP BY and HAVING Clause Examples
*/

USE student_dbms;
 
-- GROUP BY

-- Number of Students in Each City
SELECT
    city,
    COUNT(*) AS total_students
FROM students
GROUP BY city;

-- Average Marks for Each Course
SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM results r
INNER JOIN courses c
ON r.course_id = c.course_id
GROUP BY c.course_name;

-- Highest Marks in Each Course
SELECT
    c.course_name,
    MAX(r.marks) AS highest_marks
FROM results r
INNER JOIN courses c
ON r.course_id = c.course_id
GROUP BY c.course_name;

-- Lowest Marks in Each Course
SELECT
    c.course_name,
    MIN(r.marks) AS lowest_marks
FROM results r
INNER JOIN courses c
ON r.course_id = c.course_id
GROUP BY c.course_name;

-- Number of Students Enrolled in Each Course
SELECT
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM enrollments e
INNER JOIN courses c
ON e.course_id = c.course_id
GROUP BY c.course_name;

-- Attendance Count by Status
SELECT
    status,
    COUNT(*) AS total_records
FROM attendance
GROUP BY status;

-- HAVING

-- Courses Having More Than One Student
SELECT
    c.course_name,
    COUNT(e.student_id) AS total_students
FROM enrollments e
INNER JOIN courses c
ON e.course_id = c.course_id
GROUP BY c.course_name
HAVING COUNT(e.student_id) > 1;

-- Courses Having Average Marks Greater Than 80
SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM results r
INNER JOIN courses c
ON r.course_id = c.course_id
GROUP BY c.course_name
HAVING AVG(r.marks) > 80;

-- Cities Having More Than One Student
SELECT
    city,
    COUNT(*) AS total_students
FROM students
GROUP BY city
HAVING COUNT(*) > 1;

-- Faculty Teaching More Than One Enrollment
SELECT
    f.faculty_name,
    COUNT(e.enrollment_id) AS total_enrollments
FROM enrollments e
INNER JOIN faculty f
ON e.faculty_id = f.faculty_id
GROUP BY f.faculty_name
HAVING COUNT(e.enrollment_id) > 1;

-- ORDER BY with GROUP BY

SELECT
    city,
    COUNT(*) AS total_students
FROM students
GROUP BY city
ORDER BY total_students DESC;

-- GROUP BY Multiple Columns

SELECT
    city,
    gender,
    COUNT(*) AS total_students
FROM students
GROUP BY city, gender
ORDER BY city;
