/*attendancecoursesenrollmentsfacultyresultsstudents
Project Name : Student Database Management System
File Name    : 02_create_tables.sql
Database     : student_dbms
Description  : Creates all project tables with constraints.
*/

USE student_dbms;

-- STUDENTS TABLE

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    admission_date DATE DEFAULT (CURRENT_DATE)
);

-- COURSES TABLE

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) UNIQUE NOT NULL,
    duration_months INT NOT NULL CHECK(duration_months > 0),
    fees DECIMAL(10,2) NOT NULL CHECK(fees >= 0)
);

-- FACULTY TABLE

CREATE TABLE faculty (
    faculty_id INT AUTO_INCREMENT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);

-- ENROLLMENTS TABLE

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    faculty_id INT NOT NULL,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    CONSTRAINT fk_enrollment_student
        FOREIGN KEY(student_id)
        REFERENCES students(student_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_enrollment_course
        FOREIGN KEY(course_id)
        REFERENCES courses(course_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_enrollment_faculty
        FOREIGN KEY(faculty_id)
        REFERENCES faculty(faculty_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ATTENDANCE TABLE

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present','Absent') NOT NULL,
    CONSTRAINT fk_attendance_student
        FOREIGN KEY(student_id)
        REFERENCES students(student_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_attendance_course
        FOREIGN KEY(course_id)
        REFERENCES courses(course_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- RESULTS TABLE

CREATE TABLE results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    marks INT NOT NULL CHECK(marks BETWEEN 0 AND 100),
    grade CHAR(2) NOT NULL,
    CONSTRAINT fk_result_student
        FOREIGN KEY(student_id)
        REFERENCES students(student_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_result_course
        FOREIGN KEY(course_id)
        REFERENCES courses(course_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- VERIFY TABLES

SHOW TABLES;