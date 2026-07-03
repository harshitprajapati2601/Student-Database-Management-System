/*
Project Name : Student Database Management System
File Name    : 12_views.sql
Description  : SQL Views Examples
*/

USE student_dbms;

-- Remove Existing Views

DROP VIEW IF EXISTS vw_student_details;
DROP VIEW IF EXISTS vw_student_course_details;
DROP VIEW IF EXISTS vw_student_results;
DROP VIEW IF EXISTS vw_course_statistics;
DROP VIEW IF EXISTS vw_attendance_report;

-- View 1 : Student Details

CREATE VIEW vw_student_details AS
SELECT
    student_id,
    CONCAT(first_name,' ',last_name) AS student_name,
    gender,
    city,
    email,
    phone
FROM students;

-- View Data

SELECT * FROM vw_student_details;

-- View 2 : Student Course Details

CREATE VIEW vw_student_course_details AS
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    f.faculty_name,
    e.enrollment_date
FROM enrollments e
INNER JOIN students s
ON e.student_id = s.student_id
INNER JOIN courses c
ON e.course_id = c.course_id
INNER JOIN faculty f
ON e.faculty_id = f.faculty_id;

-- View Data

SELECT * FROM vw_student_course_details;

-- View 3 : Student Result Report

CREATE VIEW vw_student_results AS
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    r.marks,
    r.grade
FROM results r
INNER JOIN students s
ON r.student_id = s.student_id
INNER JOIN courses c
ON r.course_id = c.course_id;

-- View Data

SELECT * FROM vw_student_results;

-- View 4 : Course Statistics

CREATE VIEW vw_course_statistics AS
SELECT
    c.course_name,
    COUNT(r.student_id) AS total_students,
    AVG(r.marks) AS average_marks,
    MAX(r.marks) AS highest_marks,
    MIN(r.marks) AS lowest_marks
FROM courses c
LEFT JOIN results r
ON c.course_id = r.course_id
GROUP BY c.course_name;

-- View Data

SELECT * FROM vw_course_statistics;

-- View 5 : Attendance Report

CREATE VIEW vw_attendance_report AS
SELECT
    s.student_id,
    CONCAT(s.first_name,' ',s.last_name) AS student_name,
    c.course_name,
    a.attendance_date,
    a.status
FROM attendance a
INNER JOIN students s
ON a.student_id = s.student_id
INNER JOIN courses c
ON a.course_id = c.course_id;

-- View Data

SELECT * FROM vw_attendance_report;

-- Show All Views

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

-- View Definitions

SHOW CREATE VIEW vw_student_details;

SHOW CREATE VIEW vw_student_course_details;

SHOW CREATE VIEW vw_student_results;

SHOW CREATE VIEW vw_course_statistics;

SHOW CREATE VIEW vw_attendance_report;

