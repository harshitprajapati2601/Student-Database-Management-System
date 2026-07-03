/*
Project Name : Student Database Management System
Database     : student_dbms
Developer    : Harshit Prajapati
Version      : 1.0
Created On   : 02-July-2026

Description:
This script initializes the Student Database Management System by:
1. Removing the existing database (if present).
2. Creating a fresh database.
3. Selecting the database for further operations.
4. Verifying successful creation.

Compatible With:
- MySQL 8.0+
*/
DROP DATABASE IF EXISTS student_dbms;

CREATE DATABASE student_dbms;

USE student_dbms;

SELECT DATABASE() AS current_database;

SHOW DATABASES;