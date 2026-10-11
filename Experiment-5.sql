DROP VIEW IF EXISTS Employee_Hierarchy;
DROP VIEW IF EXISTS Department_Salary_Summary;
DROP VIEW IF EXISTS IT_Employees;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    project_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (manager_id) REFERENCES Employee(emp_id)
);

INSERT INTO Department VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance'),
(4,'Marketing'),
(5,'Operations');

INSERT INTO Project VALUES
(101,'AI System',1),
(102,'Web Development',1),
(103,'Cloud Platform',1),
(104,'Cyber Security',1),
(105,'Data Analytics',3),
(106,'Mobile Application',1),
(107,'Inventory System',5),
(108,'Customer Support',2);

INSERT INTO Employee VALUES
(1,'Savinay',65000,1,101,NULL),
(2,'Anjali',50000,1,102,1),
(3,'Priya',52000,1,103,1),
(4,'Karan',42000,2,108,NULL),
(5,'Aditya',59000,3,105,NULL),
(6,'Rohan',70000,1,101,1),
(7,'Anjali',51000,4,102,NULL),
(8,'Karan',42000,5,107,NULL),
(9,'Pooja',46000,2,108,4),
(10,'Vikas',58000,3,105,5),
(11,'Simran',44000,2,108,4),
(12,'Arjun',47000,4,102,7),
(13,'Mehul',72000,1,101,1),
(14,'Nikhil',62000,3,105,5),
(15,'Kavya',54000,4,106,7),
(16,'Varun',49000,5,107,8),
(17,'Isha',51000,1,103,1),
(18,'Yash',45000,2,108,4),
(19,'Tanya',68000,1,106,1),
(20,'Harsh',55000,4,102,7),
(21,'Riya',49000,3,105,5),
(22,'Dev',47000,2,108,4),
(23,'Muskan',52000,5,107,8),
(24,'Sahil',62000,1,101,1),
(25,'Aditi',59000,3,105,5),
(26,'Nisha',48000,2,108,4),
(27,'Mohit',45000,5,107,8),
(28,'Komal',51000,4,106,7),
(29,'Abhishek',56000,3,105,5),
(30,'Shreya',49000,2,108,4);

CREATE OR REPLACE VIEW Department_Salary_Summary AS
SELECT
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS employee_count,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary
FROM Department d
LEFT JOIN Employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

SELECT * FROM Department_Salary_Summary;

CREATE OR REPLACE VIEW Employee_Hierarchy AS
SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id,
    e.manager_id,
    m.emp_name AS manager_name
FROM Employee e
LEFT JOIN Employee m
ON e.manager_id = m.emp_id;

SELECT * FROM Employee_Hierarchy;

CREATE OR REPLACE VIEW IT_Employees AS
SELECT emp_id, emp_name, salary, dept_id
FROM Employee
WHERE dept_id = 1
WITH CHECK OPTION;

SELECT * FROM IT_Employees;

UPDATE IT_Employees
SET salary = salary + 1000
WHERE emp_id = 2;

SELECT * FROM IT_Employees;

SELECT * FROM Employee
WHERE emp_id = 2;

WITH RECURSIVE Reporting_Chain AS (
    SELECT
        emp_id,
        emp_name,
        manager_id,
        1 AS hierarchy_level
    FROM Employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.emp_id,
        e.emp_name,
        e.manager_id,
        rc.hierarchy_level + 1
    FROM Employee e
    INNER JOIN Reporting_Chain rc
    ON e.manager_id = rc.emp_id
)
SELECT
    emp_id,
    emp_name,
    manager_id,
    hierarchy_level
FROM Reporting_Chain
ORDER BY hierarchy_level, emp_id;
