# Day 3 - CASE Logic and Window Function Practice

## Objective

Develop intermediate-to-advanced SQL reasoning by solving conditional business-rule problems and ranking-style analytical tasks.

## Files in This Folder

- `sql_queries_day3.sql` - conditional and nested CASE problem set
- `sql_window_functions.sql` - window-function and ranking problem set
- `README.md` - this documentation

## 1) `sql_queries_day3.sql` - Conditional Business Logic

### Dataset prepared
`Employee` table with:
- identity fields (`emp_id`, `emp_name`, `department`)
- compensation and experience fields (`salary`, `experience`)
- rating field (`performance_rating`)

### Core work completed
- salary hike classification using `CASE`
- department-wise bonus computation
- employee category tagging (high/mid/low performer)
- nested CASE logic using multiple conditions (salary + experience + rating)

### Why this matters
These are typical transformation rules used in:
- HR analytics pipelines
- compensation simulations
- rule-based reporting layers

## 2) `sql_window_functions.sql` - Ordered Analytics

### Core work completed
- row sequencing with `ROW_NUMBER()`
- ranking with `RANK()`
- dense ranking with `DENSE_RANK()`
- partitioned ranking by department
- global ranking by salary/joining date

### SQL analytics concepts covered
- window definition (`OVER (...)`)
- partitioned vs global ordering
- tie behavior differences (`RANK` vs `DENSE_RANK`)

## Skills Demonstrated

- writing readable conditional SQL
- implementing nested business rules in query form
- handling rank/ordering needs for leaderboard and top-N style reports
- converting row-level data into ordered analytical outputs

## Notes for Review

- The file includes practice prompts where some "orders/city" comments are conceptual placeholders while executed queries use the `employees` table.
- The implemented statements still cover the expected window-function behavior clearly.

## Outcome

Day 3 strengthens analytical SQL maturity by combining business logic (`CASE`) with ranking mechanics (window functions), both of which are heavily used in enterprise reporting and scoring pipelines.
