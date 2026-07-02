/*
Project Name : Student Database Management System
File Name    : 05_basic_select_queries.sql
Description  : Basic SQL SELECT Queries
*/

USE student_dbms;

-- 1. Display All Students

SELECT *
FROM students;

-- 2. Display Selected Columns

SELECT
student_id,
first_name,
last_name,
city
FROM students;

-- 3. Display Unique Cities

SELECT DISTINCT city
FROM students;

-- 4. Students From Ahmedabad

SELECT *
FROM students
WHERE city='Ahmedabad';

-- 5. Female Students

SELECT *
FROM students
WHERE gender='Female';

-- 6. Students Born After 2002

SELECT *
FROM students
WHERE date_of_birth > '2002-01-01';

-- 7. Students Ordered by First Name

SELECT *
FROM students
ORDER BY first_name ASC;

-- 8. Students Ordered by Admission Date

SELECT *
FROM students
ORDER BY admission_date DESC;

-- 9. Display First Three Students

SELECT *
FROM students
LIMIT 3;

-- 10. Students Whose Name Starts With 'A'

SELECT *
FROM students
WHERE first_name LIKE 'A%';

-- 11. Students Whose Name Ends With 'a'

SELECT *
FROM students
WHERE first_name LIKE '%a';

-- 12. Students Containing 'ar'

SELECT *
FROM students
WHERE first_name LIKE '%ar%';

-- 13. Students From Ahmedabad or Surat

SELECT *
FROM students
WHERE city IN ('Ahmedabad','Surat');

-- 14. Students NOT From Ahmedabad

SELECT *
FROM students
WHERE city NOT IN ('Ahmedabad');

-- 15. Students Born Between Two Dates

SELECT *
FROM students
WHERE date_of_birth
BETWEEN '2002-01-01' AND '2003-12-31';

-- 16. Students With Email

SELECT *
FROM students
WHERE email IS NOT NULL;

-- 17. Column Aliases

SELECT
student_id AS ID,
first_name AS First_Name,
last_name AS Last_Name,
city AS City
FROM students;

-- 18. Students Ordered by City then Name

SELECT *
FROM students
ORDER BY city ASC, first_name ASC;