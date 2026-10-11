DROP PROCEDURE IF EXISTS transfer_employee;

DROP TRIGGER IF EXISTS validate_employee_salary;
DROP TRIGGER IF EXISTS audit_employee_update;
DROP TRIGGER IF EXISTS audit_employee_insert;

DROP TABLE IF EXISTS Employee_Audit;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT,
    project_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (manager_id) REFERENCES Employee(emp_id)
);

CREATE TABLE Employee_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_dept_id INT,
    new_dept_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_type VARCHAR(30),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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

DELIMITER //

CREATE TRIGGER validate_employee_salary
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be greater than zero';
    END IF;
END//

CREATE TRIGGER validate_employee_salary_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be greater than zero';
    END IF;
END//

CREATE TRIGGER audit_employee_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit
    (emp_id, old_dept_id, new_dept_id, old_salary, new_salary, action_type)
    VALUES
    (OLD.emp_id, OLD.dept_id, NEW.dept_id, OLD.salary, NEW.salary, 'UPDATE');
END//

CREATE PROCEDURE transfer_employee(
    IN p_emp_id INT,
    IN p_new_dept_id INT
)
BEGIN
    DECLARE employee_exists INT DEFAULT 0;
    DECLARE department_exists INT DEFAULT 0;

    SELECT COUNT(*)
    INTO employee_exists
    FROM Employee
    WHERE emp_id = p_emp_id;

    IF employee_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Employee does not exist';
    END IF;

    SELECT COUNT(*)
    INTO department_exists
    FROM Department
    WHERE dept_id = p_new_dept_id;

    IF department_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Department does not exist';
    END IF;

    UPDATE Employee
    SET dept_id = p_new_dept_id
    WHERE emp_id = p_emp_id;

    SELECT 'Employee transferred successfully' AS message;
END//

DELIMITER ;

SELECT emp_id, emp_name, dept_id
FROM Employee
WHERE emp_id = 2;

CALL transfer_employee(2,3);

SELECT emp_id, emp_name, dept_id
FROM Employee
WHERE emp_id = 2;

SELECT *
FROM Employee_Audit;

SELECT emp_id, emp_name, salary
FROM Employee
WHERE emp_id = 2;

UPDATE Employee
SET salary = 51000
WHERE emp_id = 2;

SELECT *
FROM Employee_Audit;

SELECT *
FROM Employee_Audit
WHERE emp_id = 2;

SELECT emp_id, emp_name, salary
FROM Employee
WHERE emp_id = 2;

SELECT emp_id, emp_name, dept_id
FROM Employee
WHERE emp_id = 999;

SELECT dept_id, dept_name
FROM Department
WHERE dept_id = 999;
