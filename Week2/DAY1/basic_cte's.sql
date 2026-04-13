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
-- 1 High Earners
WITH rich_staff AS (
  SELECT name 
  FROM employees
  WHERE salary > 55000 
  )
  SELECT * from rich_staff ;
  
  -- 2 Naming
  WITH naming as (
   SELECT
   name as Employee_Name ,
   salary as Annual_Income 
   FROM employees 
    )
 SELECT * FROM naming ;
 
 -- 3 DEPARTMENT FILTER 
 WITH dept_filter AS (
   SELECT 
   emp_id,name,department_id
   FROM employees
   WHERE department_id= 102
  
   )
SELECT * 
FROM dept_filter d
JOIN Departments ds
ON d.department_id=ds.dept_id ; 

-- 4 MATH CHECK
WITH bonus as (
  SELECT 
  (salary/100)*10 as BONUS_AMOUNT
  FROM employees ) 
SELECT * FROM bonus ;

-- 5 ORDER DATES
WITH order_dates AS (
  SELECT 
  order_date 
  FROM Orders
  WHERE order_date > '2024-02-01'
  )
SELECT * FROM order_dates ;

-- 6 STAFF COUNT 
WITH counts AS (
  SELECT 
  COUNT(emp_id) AS total_employees 
  FROM employees 
  )
 SELECT * FROM counts ;
 
 -- 7 CONCAT
 WITH labels AS (
    SELECT 
   CONCAT('EMPLOYEE: ',name ) AS Names 
   FROM employees 
   )
SELECT * FROM labels ;

-- 8 IT SALARIES
WITH IT_salaries AS (
  SELECT SUM(salary) AS total_sal,department_id
  FROM  employees 
  GROUP BY department_id 
  )
SELECT 
*
FROM IT_salaries sal
JOIN Departments D
ON sal.department_id=D.dept_id 
WHERE D.dept_name = 'IT' ;

-- 9 SPECIFIC JOIN 
-- 9 SPECIFIC JOIN
WITH department_names AS (
  SELECT dept_id, dept_name 
  FROM Departments
)
SELECT 
  e.name, 
  dn.dept_name
FROM employees e
JOIN department_names dn ON e.department_id = dn.dept_id;

-- 10 SALARY LIMIT 
WITH below_sal AS (
  SELECT name, salary
  FROM employees 
  WHERE salary  < 50000 
  )
SELECT * 
FROM below_sal 
ORDER BY salary DESC
LIMIT 2 ;