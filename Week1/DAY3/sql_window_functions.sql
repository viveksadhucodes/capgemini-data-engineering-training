--ROW_NUMBER() 

-- 1.	Assign a unique row number to all employees based on salary (highest first). 
SELECT 
    *, 
    ROW_NUMBER() OVER (ORDER BY salary DESC) as row_num
FROM employees;


-- 2.	Assign row numbers to employees within each department based on salary descending. 
SELECT *,ROW_NUMBER()  OVER (PARTITION BY department ORDER BY salary DESC) AS salray_desc_dept
FROM employees ;


-- 3.	Assign row numbers based on employee joining date (latest first). 
SELECT 
    *, 
    ROW_NUMBER() OVER (ORDER BY join_date DESC) as row_num
FROM employees;


-- 4.Assign row numbers within each department based on earliest joining date.  
SELECT *,ROW_NUMBER()  OVER (PARTITION BY department ORDER BY join_date DESC) AS salray_desc_dept
FROM employees ;


-- 5.Assign row numbers to orders based on order date.  



-- 7.Assign row numbers to employees based on salary (lowest first). 
SELECT 
    *, 
    ROW_NUMBER() OVER (ORDER BY salary ASC) as row_num
FROM employees;
 
 
-- 8.	Assign row numbers within department for employees based on name alphabetically. 
SELECT *,ROW_NUMBER() OVER(PARTITION BY department ORDER BY emp_name ASC ) AS dept_wise_names_order
FROM employees ;

