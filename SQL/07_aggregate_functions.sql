/*
Project Name : Student Database Management System
File Name    : 07_aggregate_functions.sql
Description  : Aggregate Function Examples
*/

USE student_dbms;

-- COUNT()

-- Total Students
SELECT COUNT(*) AS total_students
FROM students;

-- Total Courses
SELECT COUNT(*) AS total_courses
FROM courses;

-- Total Faculty
SELECT COUNT(*) AS total_faculty
FROM faculty;

-- Total Enrollments
SELECT COUNT(*) AS total_enrollments
FROM enrollments;

-- SUM()

-- Total Course Fees
SELECT SUM(fees) AS total_course_fees
FROM courses;

-- Total Marks
SELECT SUM(marks) AS total_marks
FROM results;

-- AVG()

-- Average Student Marks
SELECT AVG(marks) AS average_marks
FROM results;

-- Average Course Fees
SELECT AVG(fees) AS average_course_fee
FROM courses;

-- MAX()

-- Highest Marks
SELECT MAX(marks) AS highest_marks
FROM results;

-- Highest Course Fee
SELECT MAX(fees) AS highest_course_fee
FROM courses;

-- MIN()

-- Lowest Marks
SELECT MIN(marks) AS lowest_marks
FROM results;

-- Lowest Course Fee
SELECT MIN(fees) AS lowest_course_fee
FROM courses;

-- Combined Aggregate Report

SELECT
    COUNT(*) AS total_students,
    MIN(student_id) AS first_student_id,
    MAX(student_id) AS last_student_id
FROM students;

-- Aggregate with WHERE

SELECT COUNT(*) AS ahmedabad_students
FROM students
WHERE city = 'Ahmedabad';

SELECT AVG(marks) AS average_above_80
FROM results
WHERE marks > 80;

-- Aggregate Using JOIN

SELECT
    c.course_name,
    AVG(r.marks) AS average_marks
FROM results r
INNER JOIN courses c
ON r.course_id = c.course_id
GROUP BY c.course_name;

-- Highest Scoring Student

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    r.marks
FROM results r
INNER JOIN students s
ON r.student_id = s.student_id
ORDER BY r.marks DESC
LIMIT 1;

-- Lowest Scoring Student

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    r.marks
FROM results r
INNER JOIN students s
ON r.student_id = s.student_id
ORDER BY r.marks
LIMIT 1;