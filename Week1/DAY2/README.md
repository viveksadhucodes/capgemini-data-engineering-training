# Day 2 - SQL Aggregations and Relational Joins

## Objective

Practice analytical SQL and relationship-based querying by building sample datasets and solving reporting-focused business questions.

## Files in This Folder

- `sql_queries_day2.sql` - aggregation and reporting exercises
- `sql_joins_day2.sql` - join-focused relational exercises
- `README.md` - this documentation

## 1) `sql_queries_day2.sql` - Aggregation Track

### Tables created
- `Employee(emp_id, emp_name, department, salary, joining_date)`
- `Sales(sales_id, emp_id, product, amount, sale_date)`

### Work completed
- departmental salary totals, counts, averages, min/max
- filtered grouped outputs using `HAVING`
- product-wise and employee-wise sales summaries
- top department and top employee style ranking using `ORDER BY ... LIMIT`
- department-level and employee-level combined salary/sales attempts
- identifying employees with no sales using `LEFT JOIN` + grouped conditions

### SQL concepts practiced
- `GROUP BY`, `HAVING`
- `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`
- aggregate filtering and grouped reporting
- join-supported business summaries

## 2) `sql_joins_day2.sql` - Join Track

### Tables created
- `employees(emp_id, emp_name, manager_id, dept_id)`
- `departments(dept_id, dept_name)`
- `projects(project_id, project_name, emp_id)`

### Work completed
- manager reporting lines using self joins
- employee-department and employee-project mapping
- inclusion of unmatched rows via left/right style joins
- department coverage and project coverage checks
- full relationship views using `UNION` between left/right outputs
- null-handling style outputs using `COALESCE`

### SQL concepts practiced
- self join
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- anti-pattern detection via null checks
- `UNION` for merged relational completeness

## Coverage Summary

This day demonstrates two essential SQL capabilities required in data engineering:
- summarizing data for reporting (aggregation path), and
- connecting normalized tables accurately (join path).

## Practical Value

Day 2 directly maps to real project tasks such as:
- KPI table creation
- department/product dashboards
- unmatched-record identification
- organizational and project relationship reporting

## Notes for Review

- A few exercise prompts in SQL comments are placeholders or partially implemented; this is expected in practice sets.
- The implemented queries still provide broad coverage of grouped analytics and join patterns.
