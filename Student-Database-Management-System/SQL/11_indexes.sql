/*
Project Name : Student Database Management System
File Name    : 11_indexes.sql
Description  : Indexes and Query Optimization
*/

USE student_dbms;

-- SHOW EXISTING INDEXES
SHOW INDEXES FROM students;
SHOW INDEXES FROM courses;
SHOW INDEXES FROM faculty;
SHOW INDEXES FROM enrollments;
SHOW INDEXES FROM attendance;
SHOW INDEXES FROM results;

-- CREATE SINGLE COLUMN INDEX

CREATE INDEX idx_student_city
ON students(city);

CREATE INDEX idx_course_name
ON courses(course_name);

CREATE INDEX idx_student_marks
ON results(marks);

-- CREATE COMPOSITE INDEX

CREATE INDEX idx_student_course
ON enrollments(student_id, course_id);

CREATE INDEX idx_attendance_student_date
ON attendance(student_id, attendance_date);

-- VERIFY INDEXES

SHOW INDEXES FROM students;
SHOW INDEXES FROM courses;
SHOW INDEXES FROM results;
SHOW INDEXES FROM enrollments;
SHOW INDEXES FROM attendance;

-- QUERY USING INDEX

EXPLAIN
SELECT *
FROM students
WHERE city = 'Ahmedabad';

EXPLAIN
SELECT *
FROM courses
WHERE course_name = 'Java Programming';

EXPLAIN
SELECT *
FROM results
WHERE marks > 80;

EXPLAIN
SELECT *
FROM enrollments
WHERE student_id = 1
AND course_id = 1;

-- DROP INDEX

DROP INDEX idx_student_marks
ON results;

-- Recreate for further project usage

CREATE INDEX idx_student_marks
ON results(marks);

-- FINAL VERIFICATION

SHOW INDEXES FROM results;
