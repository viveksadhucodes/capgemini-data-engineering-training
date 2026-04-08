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

 -- 9.	Rank all employees based on salary (highest first). 
 SELECT *,
 RANK() OVER(ORDER BY salary DESC) AS emp_sal
 FROM employees ;
 
 -- 10.	Rank employees within each department based on salary. 
 SELECT *,
 RANK() OVER(PARTITION BY department ORDER BY salary) as based_on_salary_by_dept
 FROM employees ;
 
 -- 11.	Rank employees based on joining date (latest gets rank 1). 
 SELECT *,
 RANK() OVER(ORDER BY join_date DESC) as joined_dates
 FROM employees ;
 
 -- 12.	Rank orders based on order amount (highest first). 
 
 
 
 -- 13.	Rank orders within each city based on order amount. 
 SELECT *,
 RANK() OVER(PARTITION BY department ORDER BY salary) as high_amount
 FROM employees ;
 
 
 -- 14.	Rank employees within department based on salary (lowest first). 
SELECT *,
 RANK() OVER(PARTITION BY department ORDER BY salary ASC) as high_amount
 FROM employees ;
 
-- 15.	Rank employees based on name alphabetically
SELECT *,
RANK() OVER(ORDER BY emp_name) as names
FROM employees ;

-- 16.	Rank orders within each city based on order date. 


-- 17.	Assign dense rank to employees based on salary (highest first). 
SELECT *,
DENSE_RANK() OVER(ORDER BY salary) as ranked_dense
FROM employees ;

-- 18.	Assign dense rank within each department based on salary. 
SELECT *,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary) as dept_wise_salary_rank 
FROM employees ;


-- 19.	Assign dense rank to employees based on joining date. 
SELECT *,
DENSE_RANK() OVER(ORDER BY join_date) as rank_based_on_join_date
FROM employees ;

-- 20.	Assign dense rank to orders based on order amount. 
SELECT *,
DENSE_RANK() OVER(ORDER BY salary) as amt
FROM employees ;

-- 21.	Assign dense rank within each city based on order amount. 
SELECT *,
DENSE_RANK() OVER(PARTITION BY department ORDER BY salary ) as city_amt
FROM employees ; 

-- 22.	Assign dense rank to employees based on salary (lowest first). 
SELECT * ,
DENSE_RANK() OVER(ORDER BY salary DESC) as salary_based 
FROM employees ;

-- 23.	Assign dense rank within department based on joining date
SELECT *,
DENSE_RANK() OVER(PARTITION BY department ORDER BY join_date) as dept_wise_join_date
FROM employees ;

-- 24.	Assign dense rank to orders based on order date.

