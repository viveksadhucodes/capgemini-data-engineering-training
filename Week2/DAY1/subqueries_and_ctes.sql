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


-- 1 Create a CTE to show employees with salary > 50,000 and fetch all records
WITH HighEarners AS (
    SELECT * FROM employees 
    WHERE salary > 50000
)
SELECT * FROM HighEarners;

-- 2 Find average salary per department using CTE
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.dept_name, a.average_salary
FROM Departments d
JOIN dept_avg a ON d.dept_id = a.department_id;

-- 3 Use CTE to get employees and their department names
WITH EmpDept AS (
    SELECT 
        e.name AS employee_name, 
        d.dept_name AS department
    FROM employees e
    JOIN Departments d ON e.department_id = d.dept_id
)
SELECT * FROM EmpDept;


-- 4 Find total order amount per employee using CTE
WITH total_order AS (
    SELECT 
        emp_id, 
        SUM(order_amount) AS total_amount
    FROM Orders
    GROUP BY emp_id
)
SELECT 
    e.name, 
    COALESCE(t.total_amount, 0) AS total_sales
FROM employees e
LEFT JOIN total_order t ON e.emp_id = t.emp_id;


-- 5 Find employees whose salary is above department average using CTE
-- 5 Find employees whose salary is above department average using CTE
WITH DeptAverages AS (
    SELECT 
        department_id, 
        AVG(salary) AS avg_dept_salary
    FROM employees
    GROUP BY department_id
)
SELECT 
    e.name, 
    e.salary, 
    d.dept_name,
    ROUND(da.avg_dept_salary, 2) AS dept_average
FROM employees e
JOIN DeptAverages da ON e.department_id = da.department_id
JOIN Departments d ON e.department_id = d.dept_id
WHERE e.salary > da.avg_dept_salary;