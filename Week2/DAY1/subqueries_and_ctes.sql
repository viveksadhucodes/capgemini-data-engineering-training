CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary INT,
    manager_id INT
);
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    order_amount INT,
    order_date DATE
);
INSERT INTO employees VALUES
(1, 'Alice', 101, 60000, NULL),
(2, 'Bob', 102, 45000, 1),
(3, 'Charlie', 101, 70000, 1),
(4, 'David', 103, 40000, 2),
(5, 'Eve', 102, 50000, 2);
INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');
INSERT INTO Orders VALUES
(1, 1, 5000, '2024-01-10'),
(2, 2, 3000, '2024-02-15'),
(3, 3, 7000, '2024-03-12'),
(4, 1, 2000, '2024-04-01'),
(5, 4, 1000, '2024-05-05');

  -- 1 Find employees who earn more than average salary
SELECT * 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees ) ;

-- 2 Find employees who belong to the same department as 'Alice'
SELECT * 
FROM employees
WHERE department_id = 
(SELECT department_id FROM employees where name='Alice' ) ;

-- 3 Get employees whose salary is equal to the minimum salary
SELECT * 
FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees );

-- 4 Find employees who have placed at least one order
SELECT name
FROM employees
WHERE emp_id IN (SELECT emp_id FROM Orders)
ORDER BY name;
 
 
 -- 5 Get employees whose salary is greater than ALL employees in department 102
SELECT name
FROM employees
WHERE salary > ( SELECT MAX(salary)  FROM employees  WHERE department_id=102 )
