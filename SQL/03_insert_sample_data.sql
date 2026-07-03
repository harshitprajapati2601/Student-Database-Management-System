
/*
Project Name : Student Database Management System
File Name    : 03_insert_sample_data.sql
Description  : Inserts sample records into all tables.
*/

USE student_dbms;

-- INSERT INTO STUDENTS

INSERT INTO students
(first_name, last_name, gender, date_of_birth, email, phone, city)
VALUES
('Harsh','Patel','Male','2002-04-15','harsh.patel@email.com','9876543210','Ahmedabad'),
('Priya','Sharma','Female','2003-01-12','priya.sharma@email.com','9876543211','Surat'),
('Rahul','Verma','Male','2001-09-10','rahul.verma@email.com','9876543212','Vadodara'),
('Sneha','Joshi','Female','2002-07-18','sneha.joshi@email.com','9876543213','Rajkot'),
('Amit','Singh','Male','2003-05-21','amit.singh@email.com','9876543214','Ahmedabad');

-- INSERT INTO COURSES

INSERT INTO courses
(course_name, duration_months, fees)
VALUES
('Java Programming',6,25000),
('Spring Boot',4,30000),
('Flutter Development',5,28000),
('MySQL Database',3,18000),
('Python Programming',6,24000);

-- INSERT INTO FACULTY

INSERT INTO faculty
(faculty_name, department, email, phone)
VALUES
('Rakesh Mehta','Java','rakesh@college.com','9000000001'),
('Neha Shah','Flutter','neha@college.com','9000000002'),
('Ankit Patel','Database','ankit@college.com','9000000003'),
('Pooja Desai','Python','pooja@college.com','9000000004');

-- INSERT INTO ENROLLMENTS

INSERT INTO enrollments
(student_id, course_id, faculty_id)
VALUES
(1,1,1),
(1,4,3),
(2,3,2),
(3,2,1),
(4,5,4),
(5,1,1);

-- INSERT INTO ATTENDANCE

INSERT INTO attendance
(student_id, course_id, attendance_date, status)
VALUES
(1,1,'2026-07-01','Present'),
(1,4,'2026-07-01','Present'),
(2,3,'2026-07-01','Absent'),
(3,2,'2026-07-01','Present'),
(4,5,'2026-07-01','Present'),
(5,1,'2026-07-01','Absent');

-- INSERT INTO RESULTS

INSERT INTO results
(student_id, course_id, marks, grade)
VALUES
(1,1,91,'A+'),
(1,4,88,'A'),
(2,3,79,'B+'),
(3,2,84,'A'),
(4,5,73,'B'),
(5,1,95,'A+');

-- VERIFY DATA

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM faculty;
SELECT * FROM enrollments;
SELECT * FROM attendance;
SELECT * FROM results;
