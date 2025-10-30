CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    ssn VARCHAR(11) UNIQUE NOT NULL, -- Sensitive data
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO departments (dept_id, dept_name) VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'Engineering');
INSERT INTO employees (employee_id, first_name, last_name, salary, ssn, dept_id) VALUES
(1, 'Alice', 'Smith', 65000.00, '123-45-6789', 101), -- Sales
(2, 'Bob', 'Jones', 52000.00, '987-65-4321', 101), -- Sales
(3, 'Charlie', 'Brown', 88000.00, '111-22-3333', 103), -- Engineering
(4, 'Diana', 'Prince', 45000.00, '000-11-2222', 102), -- Marketing
(5, 'Eve', 'Adams', 110000.00, '555-44-3333', 103); -- Engineering
CREATE VIEW Employee_Department_Roster AS
SELECT
    e.first_name,
    e.last_name,
    e.salary,
    d.dept_name
FROM
    employees e
JOIN
    departments d ON e.dept_id = d.dept_id;
-- This single line executes the complex join logic above
SELECT * FROM Employee_Department_Roster
WHERE salary > 60000;
CREATE VIEW Public_Employee_Directory AS
SELECT
    employee_id,
    first_name,
    last_name,
    dept_id
FROM
    employees;
-- The ssn column is not accessible through this view
SELECT * FROM Public_Employee_Directory;