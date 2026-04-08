CREATE TABLE Employee (
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
experience INT,
performance_rating CHAR(1)
);
INSERT INTO Employee (emp_id, emp_name, department, salary, experience, performance_rating)
VALUES
(1, 'Karthik', 'Engineering', 95000, 9, 'A'),
(2, 'Prathik', 'HR', 55000, 4, 'B'),
(3, 'Vinay', 'Finance', 78000, 10, 'B'),
(4, 'Vijay', 'Marketing', 48000, 3, 'C'),
(5, 'Anil', 'Engineering', 88000, 6, 'A'),
(6, 'Suresh', 'Finance', 92000, 12, 'A'),
(7, 'Ramesh', 'HR', 46000, 2, 'C'),
(8, 'Mahesh', 'Marketing', 67000, 7, 'B'),
(9, 'Rajesh', 'Engineering', 72000, 5, 'B'),
(10,'Naveen', 'Finance', 61000, 6, 'C'),
(11,'Deepak', 'HR', 83000, 11, 'A'),
(12,'Arjun', 'Engineering', 54000, 3, 'C'),
(13,'Kiran', 'Marketing', 76000, 8, 'A'),
(14,'Rohit', 'Finance', 68000, 4, 'B'),
(15,'Pavan', 'HR', 59000, 5, 'B'),
(16,'Srikanth', 'Engineering', 102000, 14, 'A'),
(17,'Manoj', 'Finance', 47000, 2, 'C'),
(18,'Varun', 'Marketing', 52000, 6, 'B'),
(19,'Ashok', 'HR', 74000, 9, 'A'),
(20,'Sunil', 'Engineering', 66000, 4, 'B'),
(21,'Nikhil', 'Finance', 86000, 7, 'A'),
(22,'Harish', 'Marketing', 45000, 1, 'C'),
(23,'Vamsi', 'Engineering', 79000, 8, 'B'),
(24,'Chaitanya','HR', 91000, 13, 'A'),
(25,'Lokesh', 'Finance', 58000, 5, 'B');

SELECT *,
	CASE 
		WHEN experience >=8 AND performance_rating='A' then '20% hike'
 		WHEN experience >=5 AND performance_rating='B' then '15% hike'
        WHEN performance_rating='C' THEN 'no hike'
        ELSE '10% hike'
    END as status
FROM Employee ;

-- 2) Problem 2: Bonus Calculation Based on Department and PerformanceScenario: Bonus is calculated based on the department and performance rating: · For Finance department:o If performance is 'A', the bonus is 20% of the salary.o If performance is 'B', the bonus is 15% of the salary.o If performance is 'C', the bonus is 5% of the salary.· For Engineering department:o If performance is 'A', the bonus is 18% of the salary.o If performance is 'B', the bonus is 12% of the salary.o If performance is 'C', the bonus is 3% of the salary.· For other departments, a flat 10% bonus.

SELECT emp_name, department, salary, performance_rating,
    CASE 
        WHEN department = 'Finance' THEN
            CASE 
                WHEN performance_rating = 'A' THEN salary * 0.20
                WHEN performance_rating = 'B' THEN salary * 0.15
                WHEN performance_rating = 'C' THEN salary * 0.05
            END
        WHEN department = 'Engineering' THEN
            CASE 
                WHEN performance_rating = 'A' THEN salary * 0.18
                WHEN performance_rating = 'B' THEN salary * 0.12
                WHEN performance_rating = 'C' THEN salary * 0.03
            END
        ELSE salary * 0.10
    END AS bonus_amount
FROM Employee;


-- Problem 3: Categorizing Employees by Salary Range and PerformanceScenario: You want to categorize employees based on salary ranges and their performance:· If salary is greater than 80,000 and performance is 'A', label them as High Performer.· If salary is between 50,000 and 80,000 and performance is 'B', label them as Mid Performer.· If salary is less than 50,000 or performance is 'C', label them as Low Performer.Problem 4: Risk Assessment Based on Experience and DepartmentScenario: You want to assess employee risk based on their experience and department:· For employees in the HR department:o If experience is less than 5 years, they are High Risk.o If experience is more than 5 years, they are Low Risk.· For employees in Engineering or Finance departments:o If experience is more than 8 years, they are Low Risk.o If experience is less than 8 years, they are Medium Risk.· Employees in other departments are automatically labeled Medium Risk.

SELECT emp_name, salary, performance_rating,
    CASE 
        WHEN salary > 80000 AND performance_rating = 'A' THEN 'High Performer'
        WHEN salary BETWEEN 50000 AND 80000 or performance_rating = 'B' THEN 'Mid Performer'
        WHEN salary < 50000 OR performance_rating = 'C' THEN 'Low Performer'
        ELSE 'Not Categorized'
    END AS employee_category
FROM Employee;

-- Nested case and when
-- Problem 1: Nested CASE for Performance and Salary Hike Based on Multiple Criteria
-- Scenario: You want to determine the salary hike based on performance rating, experience, and current salary. The hike rules are:
-- · If performance is 'A':
-- o For salaries above 80,000, experience above 5 years gets a 25% hike, otherwise 20%.
-- o For salaries between 50,000 and 80,000, the hike is 15%.
-- · If performance is 'B':
-- o For experience above 5 years, the hike is 12%.
-- o Otherwise, it's 10%.
-- · For performance 'C', there is no hike.

SELECT *, 
    CASE 
        WHEN performance_rating = 'A' THEN 
            CASE 
                WHEN salary > 80000 AND experience > 5 THEN '25% hike'
                WHEN salary BETWEEN 50000 AND 80000 THEN '15% hike'
                ELSE '20% hike'
            END
        WHEN performance_rating = 'B' THEN
            CASE
                WHEN experience > 5 THEN '12% hike'
                ELSE '10% hike'
            END
        WHEN performance_rating = 'C' THEN 'no hike'
        ELSE 'no hike'
    END AS hike_status
FROM Employee;


-- 2.Department and Performance
-- Scenario: You are tasked with giving bonuses based on the department, performance rating, and experience:
-- · For Finance department:
-- o If performance is 'A' and experience is more than 10 years, bonus is 25% of salary.
-- o Otherwise, bonus is 20%.
-- · For HR department:
-- o If performance is 'B' or experience is greater than 5 years, the bonus is 15%.
-- o Otherwise, the bonus is 10%.
-- · For other departments, the bonus is 8%.

SELECT emp_name, department, salary, performance_rating, experience,
    CASE 
        -- Finance Logic
        WHEN department = 'Finance' THEN
            CASE 
                WHEN performance_rating = 'A' AND experience > 10 THEN salary * 0.25
                ELSE salary * 0.20
            END
        -- HR Logic
        WHEN department = 'HR' THEN
            CASE 
                WHEN performance_rating = 'B' OR experience > 5 THEN salary * 0.15
                ELSE salary * 0.10
            END
        -- All other departments (Engineering, Marketing, etc.)
        ELSE salary * 0.08
    END AS bonus_amount
FROM Employee;



