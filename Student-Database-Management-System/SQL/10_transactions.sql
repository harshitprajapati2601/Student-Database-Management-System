/*
Project Name : Student Database Management System
File Name    : 10_transactions.sql
Description  : Transaction Management Examples
*/

USE student_dbms;

-- Disable Auto Commit

SET AUTOCOMMIT = 0;

-- Example 1 : COMMIT

START TRANSACTION;

INSERT INTO students
(first_name,last_name,gender,date_of_birth,email,phone,city)
VALUES
('Rohan','Shah','Male','2003-08-20',
'rohan.shah@email.com',
'9876543300',
'Surat');

SELECT * FROM students
WHERE email='rohan.shah@email.com';

COMMIT;

-- Verify

SELECT * FROM students
WHERE email='rohan.shah@email.com';

-- Example 2 : ROLLBACK

START TRANSACTION;

UPDATE students
SET city='Mumbai'
WHERE student_id=1;

SELECT * FROM students
WHERE student_id=1;

ROLLBACK;

-- Verify

SELECT * FROM students
WHERE student_id=1;

-- Example 3 : DELETE with ROLLBACK

START TRANSACTION;

DELETE FROM students
WHERE student_id=2;

SELECT * FROM students;

ROLLBACK;

-- Verify

SELECT * FROM students
WHERE student_id=2;

-- Example 4 : SAVEPOINT

START TRANSACTION;

UPDATE results
SET marks=95
WHERE student_id=1;

SAVEPOINT marks_updated;

UPDATE results
SET grade='A+'
WHERE student_id=1;

SELECT * FROM results
WHERE student_id=1;

ROLLBACK TO marks_updated;

SELECT * FROM results
WHERE student_id=1;

COMMIT;

-- Example 5 : Banking Transaction Simulation

DROP TABLE IF EXISTS bank_accounts;

CREATE TABLE bank_accounts
(
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2)
);

INSERT INTO bank_accounts
VALUES
(101,'Harsh',50000),
(102,'Priya',30000);

SELECT * FROM bank_accounts;

START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 5000
WHERE account_id=101;

UPDATE bank_accounts
SET balance = balance + 5000
WHERE account_id=102;

COMMIT;

SELECT * FROM bank_accounts;

-- Enable Auto Commit

SET AUTOCOMMIT = 1;
