/*
Project Name : Student Database Management System
File Name    : 04_crud_operations.sql
Description  : Demonstrates CRUD Operations
*/

USE student_dbms;

-- CREATE OPERATION
-- Insert a New Student

INSERT INTO students
(first_name,last_name,gender,date_of_birth,email,phone,city)
VALUES
('Karan','Patel','Male','2002-10-20',
'karan.patel@email.com',
'9876543299',
'Ahmedabad');

-- Verify

SELECT * FROM students;

-- READ OPERATION
-- Display All Students

SELECT *
FROM students;

-- READ
-- Display Selected Columns

SELECT
student_id,
first_name,
last_name,
city
FROM students;




-- READ
-- Student from Ahmedabad

SELECT *
FROM students
WHERE city='Ahmedabad';

-- READ
-- Student Ordered by Name

SELECT *
FROM students
ORDER BY first_name;

-- READ
-- First Three Students

SELECT *
FROM students
LIMIT 3;

-- UPDATE OPERATION
-- Update Student City

UPDATE students
SET city='Surat'
WHERE student_id=6;

-- Verify

SELECT *
FROM students
WHERE student_id=6;

-- UPDATE
-- Update Student Phone Number

UPDATE students
SET phone='9876500000'
WHERE student_id=6;

-- Verify

SELECT *
FROM students
WHERE student_id=6;

-- DELETE OPERATION
-- Delete Student

DELETE FROM students
WHERE student_id=6;

-- Verify

SELECT *
FROM students;

UPDATE students
SET city='Surat'
WHERE student_id=5;