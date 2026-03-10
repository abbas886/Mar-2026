-- ============================================
-- DATABASE
-- ============================================

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- ============================================
-- DEPARTMENT TABLE
-- ============================================

DROP TABLE IF EXISTS department;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department VALUES
(1,'Engineering','Bangalore'),
(2,'Human Resources','Mumbai'),
(3,'Finance','Delhi'),
(4,'Sales','Hyderabad'),
(5,'Marketing','Chennai'),
(6,'IT Support','Pune');

-- ============================================
-- EMPLOYEE TABLE
-- ============================================

DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job_title VARCHAR(50),
    manager_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    commission DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO employee VALUES
(1001,'John Smith','Software Engineer',1010,'2020-01-15',75000,NULL,1),
(1002,'Priya Sharma','Software Engineer',1010,'2021-03-10',72000,NULL,1),
(1003,'Ravi Kumar','Senior Engineer',1010,'2019-07-22',90000,NULL,1),
(1004,'Amit Patel','HR Manager',NULL,'2018-05-11',85000,NULL,2),
(1005,'Neha Singh','HR Executive',1004,'2022-01-05',45000,NULL,2),
(1006,'Robert Brown','Finance Manager',NULL,'2017-09-15',95000,NULL,3),
(1007,'Suresh Reddy','Accountant',1006,'2021-11-25',60000,NULL,3),
(1008,'Anita Desai','Sales Manager',NULL,'2019-02-14',88000,15000,4),
(1009,'Kiran Kumar','Sales Executive',1008,'2023-04-01',50000,10000,4),
(1010,'David Wilson','Engineering Manager',NULL,'2016-12-01',110000,NULL,1),
(1011,'Fatima Khan','Marketing Manager',NULL,'2019-06-18',87000,NULL,5),
(1012,'Rahul Gupta','Marketing Executive',1011,'2022-07-20',48000,NULL,5),
(1013,'Sunita Nair','Support Engineer',NULL,'2020-09-10',55000,NULL,6),
(1014,'Manoj Verma','Support Engineer',1013,'2021-10-13',52000,NULL,6),
(1015,'Alex Johnson','Software Engineer',1010,'2023-02-02',70000,NULL,1),
(1016,'Deepak Yadav','Sales Executive',1008,'2022-03-11',51000,8000,4),
(1017,'Meera Iyer','Accountant',1006,'2021-06-30',61000,NULL,3),
(1018,'Sanjay Das','HR Executive',1004,'2023-01-10',44000,NULL,2),
(1019,'Vikram Joshi','Marketing Executive',1011,'2023-05-15',47000,NULL,5),
(1020,'Pooja Kapoor','Software Engineer',1010,'2024-01-12',73000,NULL,1);

-- ============================================
-- SAMPLE CHECK
-- ============================================

SELECT * FROM employee;
SELECT * FROM department;