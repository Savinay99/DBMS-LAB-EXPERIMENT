CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INT,
    project_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

INSERT INTO Project VALUES
(101, 'AI System'),
(102, 'Web Development'),
(103, 'Cloud Platform'),
(104, 'Data Analytics'),
(105, 'Cyber Security'),
(106, 'Mobile Application'),
(107, 'Inventory System'),
(108, 'Customer Support');

INSERT INTO Employee VALUES
(1, 'Savinay', 65000, 1, 101, NULL),
(2, 'Rahul', 70000, 1, 102, 1),
(3, 'Aman', 48000, 2, 108, NULL),
(4, 'Priya', 62000, 3, 104, NULL),
(5, 'Neha', 51000, 4, 106, NULL),
(6, 'Rohan', 73000, 1, 103, 1),
(7, 'Anjali', 58000, 2, 108, 3),
(8, 'Karan', 42000, 5, 107, NULL),
(9, 'Pooja', 46000, 4, 106, 5),
(10, 'Vikas', 58000, 1, 105, 1),
(11, 'Simran', 44000, 2, 108, 3),
(12, 'Arjun', 47000, 3, 104, 4),
(13, 'Mehul', 72000, 1, 101, 1),
(14, 'Nikhil', 60000, 5, 107, 8),
(15, 'Kavya', 54000, 4, 106, 5),
(16, 'Varun', 49000, 3, 104, 4),
(17, 'Isha', 51000, 2, 108, 3),
(18, 'Yash', 45000, 5, 107, 8),
(19, 'Tanya', 68000, 1, 102, 1),
(20, 'Harsh', 55000, 4, 106, 5),
(21, 'Riya', 59000, 3, 104, 4),
(22, 'Dev', 47000, 2, 108, 3),
(23, 'Muskan', 52000, 5, 107, 8),
(24, 'Aditya', 61000, 1, 103, 1),
(25, 'Sahil', 62000, 3, 105, 4),
(26, 'Nisha', 48000, 2, 108, 3),
(27, 'Mohit', 56000, 4, 106, 5),
(28, 'Komal', 51000, 5, 107, 8),
(29, 'Abhishek', 59000, 1, 101, 1),
(30, 'Shreya', 49000, 3, 104, 4);

SELECT * FROM Department;

SELECT * FROM Project;

SELECT * FROM Employee;

SELECT *
FROM Employee
WHERE salary > 60000;

SELECT emp_id, emp_name, salary
FROM Employee;

SELECT
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary,
    SUM(salary) AS total_salary
FROM Employee;

SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employee
GROUP BY dept_id
ORDER BY dept_id;

SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM Employee
GROUP BY dept_id
HAVING AVG(salary) > 50000;

SELECT
    emp_id,
    emp_name,
    salary,
    CASE
        WHEN salary >= 60000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM Employee;

SELECT emp_id, emp_name, salary
FROM Employee
ORDER BY salary DESC;

SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS average_salary,
    SUM(e.salary) AS total_salary
FROM Department d
JOIN Employee e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY average_salary DESC;

SELECT
    p.project_name,
    COUNT(e.emp_id) AS employee_count
FROM Project p
LEFT JOIN Employee e
    ON p.project_id = e.project_id
GROUP BY p.project_id, p.project_name
ORDER BY employee_count DESC;
