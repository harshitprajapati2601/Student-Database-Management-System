/*
Project Name : Student Database Management System
File Name    : 13_final_reports.sql
Description  : Dashboard and Final Reporting Queries
*/

USE student_dbms;

-- Dashboard Statistics

SELECT COUNT(*) AS Total_Students
FROM students;

SELECT COUNT(*) AS Total_Courses
FROM courses;

SELECT COUNT(*) AS Total_Faculty
FROM faculty;

SELECT COUNT(*) AS Total_Enrollments
FROM enrollments;

-- Student Report

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS Student_Name,
    s.city,
    c.course_name,
    f.faculty_name
FROM enrollments e
INNER JOIN students s
ON e.student_id=s.student_id
INNER JOIN courses c
ON e.course_id=c.course_id
INNER JOIN faculty f
ON e.faculty_id=f.faculty_id
ORDER BY Student_Name;

-- Student Performance Report

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS Student_Name,
    c.course_name,
    r.marks,
    r.grade
FROM results r
INNER JOIN students s
ON r.student_id=s.student_id
INNER JOIN courses c
ON r.course_id=c.course_id
ORDER BY r.marks DESC;

-- Top 5 Students

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS Student_Name,
    r.marks
FROM results r
INNER JOIN students s
ON r.student_id=s.student_id
ORDER BY r.marks DESC
LIMIT 5;

-- Lowest Scoring Student

SELECT
    CONCAT(s.first_name,' ',s.last_name) AS Student_Name,
    r.marks
FROM results r
INNER JOIN students s
ON r.student_id=s.student_id
ORDER BY r.marks
LIMIT 1;

-- Course Wise Average Marks

SELECT
    c.course_name,
    ROUND(AVG(r.marks),2) AS Average_Marks
FROM results r
INNER JOIN courses c
ON r.course_id=c.course_id
GROUP BY c.course_name;

-- Students Per Course

SELECT
    c.course_name,
    COUNT(e.student_id) AS Total_Students
FROM enrollments e
INNER JOIN courses c
ON e.course_id=c.course_id
GROUP BY c.course_name
ORDER BY Total_Students DESC;

-- Attendance Summary

SELECT
    status,
    COUNT(*) AS Total
FROM attendance
GROUP BY status;

-- City Wise Students

SELECT
    city,
    COUNT(*) AS Total_Students
FROM students
GROUP BY city
ORDER BY Total_Students DESC;

-- Faculty Wise Students

SELECT
    f.faculty_name,
    COUNT(e.student_id) AS Total_Students
FROM faculty f
INNER JOIN enrollments e
ON f.faculty_id=e.faculty_id
GROUP BY f.faculty_name
ORDER BY Total_Students DESC;

-- Highest Marks Per Course

SELECT
    c.course_name,
    MAX(r.marks) AS Highest_Marks
FROM results r
INNER JOIN courses c
ON r.course_id=c.course_id
GROUP BY c.course_name;

-- Lowest Marks Per Course

SELECT
    c.course_name,
    MIN(r.marks) AS Lowest_Marks
FROM results r
INNER JOIN courses c
ON r.course_id=c.course_id
GROUP BY c.course_name;

-- Complete Student Dashboard

SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS Student_Name,
    s.city,
    c.course_name,
    f.faculty_name,
    r.marks,
    r.grade,
    a.status
FROM students s
INNER JOIN enrollments e
ON s.student_id=e.student_id
INNER JOIN courses c
ON e.course_id=c.course_id
INNER JOIN faculty f
ON e.faculty_id=f.faculty_id
LEFT JOIN results r
ON s.student_id=r.student_id
AND c.course_id=r.course_id
LEFT JOIN attendance a
ON s.student_id=a.student_id
AND c.course_id=a.course_id
ORDER BY Student_Name;

-- Database Summary

SELECT 'Students' AS Table_Name, COUNT(*) AS Total FROM students
UNION ALL
SELECT 'Courses', COUNT(*) FROM courses
UNION ALL
SELECT 'Faculty', COUNT(*) FROM faculty
UNION ALL
SELECT 'Enrollments', COUNT(*) FROM enrollments
UNION ALL
SELECT 'Attendance', COUNT(*) FROM attendance
UNION ALL
SELECT 'Results', COUNT(*) FROM results;