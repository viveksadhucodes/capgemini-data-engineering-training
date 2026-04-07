CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    dept_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id, dept_id) VALUES
(1, 'Karthik', NULL, 1),
(2, 'Ajay', 1, 1),
(3, 'Vijay', 1, 2),
(4, 'Vinay', 2, 2),
(5, 'Meena', 3, 3),
(6, 'Veer', NULL, 4),
(7, 'Keerthi', 4, 5),
(8, 'Priya', 4, 5);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT
);

INSERT INTO projects (project_id, project_name, emp_id) VALUES
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3),
(4, 'Project D', 4),
(5, 'Project E', 5);



    -- 1. Retrieve the names of employees and their corresponding managers from the "employees" table, ensuring that even employees without managers are included.
 SELECT 
    e.emp_name AS Employee, 
    m.emp_name AS Manager
FROM employees e
 JOIN employees m ON e.manager_id = m.emp_id;

-- 2. Display all employees and their corresponding departments from the "employees" and "departments" tables, showing employees even if they don't belong to any department
 SELECT employees.emp_name,departments.dept_name 
 FROM departments
 JOIN employees
 on employees.dept_id=departments.dept_id ;

-- 3. List the names of employees who report to a manager, along with their manager's name, from the "employees" table
 SELECT 
    e.emp_name AS Employee, 
    m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;


-- 4. Find the total salary paid to each employee and their respective department, including departments with no employees.



-- 5. Display a list of employees who do not belong to any department, even if the department data is missing.
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


-- 6. Fetch the names of employees and the projects they are assigned to. For employees who are not assigned any projects, show NULL for the project.
SELECT e.emp_name,p.project_name
FROM employees e
LEFT JOIN projects p
ON e.emp_id=p.emp_id ; 

-- 7. List all employees who have completed at least one project, showing their names and the project names.
SELECT e.emp_name,p.project_name
FROM employees e
 JOIN projects p
on e.emp_id=p.emp_id ;

-- 8. Show the names of employees and their projects, ensuring that no project is omitted even if an employee is not assigned to it.
 SELECT e.emp_name,p.project_name 
 FROM projects p
 LEFT JOIN employees e
 ON e.emp_id=p.emp_id ;
 
 -- 9. Find all employees and their corresponding salaries, and display NULL for salary if there is no salary record for the employee.


-- 10. Retrieve the names of employees and their corresponding department names, including employees who are not in any department.
SELECT e.emp_name,d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id=d.dept_id ;


