
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
        WHEN salary BETWEEN 50000 AND 80000 AND performance_rating = 'B' THEN 'Mid Performer'
        WHEN salary < 50000 OR performance_rating = 'C' THEN 'Low Performer'
        ELSE 'Not Categorized'
    END AS employee_category
FROM Employee;