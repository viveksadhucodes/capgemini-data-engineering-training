# Week 1 - Complete Detailed Documentation (Folder-by-Folder, File-by-File)

## Purpose of Week 1

Week 1 captures my foundational data engineering practice across SQL, PySpark, Databricks notebooks, and regex-based text extraction.
The week is organized as a practical progression:

1. Day 1: Data cleaning with PySpark
2. Day 2: SQL aggregations and joins
3. Day 3: CASE logic and window functions
4. Day 4: Real student-response analysis in Databricks SQL
5. Day 5: Regex extraction practice in SQL
6. Day 6: End-to-end mini sales cleaning + validation + reporting workflow

This README is written so that even a new person with no prior context can understand exactly what was implemented and where.

## Audited Week 1 Structure

```text
Week1/
|- README.md
|- DAY1/
|  |- C1.csv
|  |- customer_cleaning_pyspark.py
|  |- DAY1.py
|  \- __pycache__/
|     \- customer_cleaning_pyspark.cpython-312.pyc
|- DAY2/
|  |- README.md
|  |- sql_queries_day2.sql
|  \- sql_joins_day2.sql
|- DAY3/
|  |- sql_queries_day3.sql
|  \- sql_window_functions.sql
|- DAY4/
|  |- day4_real_data.ipynb
|  \- README.md
|- DAY5/
|  \- REGEX_PRACTICE.sql
\- DAY6/
   |- day6.ipynb
   \- README.md
```

## Folder-by-Folder Explanation

## DAY1 - PySpark Cleaning on Raw Customer CSV

### Files in DAY1

- `C1.csv`
- `customer_cleaning_pyspark.py`
- `DAY1.py` (empty)
- `__pycache__/customer_cleaning_pyspark.cpython-312.pyc` (auto-generated cache)

### What each file does

1. `C1.csv`
- Raw input dataset used for cleaning.
- Contains intentional data quality issues:
  - duplicate-like customer records
  - mixed country formats (`india`, `India`, `New York`, etc.)
  - placeholder strings like `blank`
  - mixed date formats and missing values

2. `customer_cleaning_pyspark.py`
- Main PySpark cleaning script.
- Key implementation details:
  - accepts optional CLI input/output paths
  - configures local Spark safely (`SPARK_LOCAL_IP`, driver host/bind)
  - normalizes empty markers (`blank`, `null`, `none`, `na`, `n/a`) to nulls
  - casts `CustomerID` and `Sales` to numeric types
  - standardizes name casing
  - standardizes countries (`india` -> `India`, `new york` -> `USA`, etc.)
  - normalizes category to `A/B/C`; invalid category becomes `Unknown`
  - parses `JoinDate` using two patterns (`dd-MM-yyyy`, `MM-dd-yyyy`)
  - fills nullable fields with defaults
  - drops rows with missing critical columns (`CustomerID`, `JoinDate`)
  - removes duplicate business records
  - writes cleaned output CSV

3. `DAY1.py`
- Present as a placeholder file but currently empty.

4. `__pycache__` content
- Python runtime artifact.
- Not source logic; generated automatically when scripts run.

### Day 1 outcome

This day demonstrates practical data-quality handling in PySpark and basic ETL thinking: read -> clean -> validate mandatory fields -> deduplicate -> write curated output.

## DAY2 - SQL Aggregation and Join Practice

### Files in DAY2

- `README.md`
- `sql_queries_day2.sql`
- `sql_joins_day2.sql`

### What each file does

1. `README.md`
- Day-specific summary of Day 2 practice themes (aggregation + joins).

2. `sql_queries_day2.sql`
- Creates sample `Employee` and `Sales` tables with inserts.
- Runs around 30 analytical tasks using:
  - `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`
  - `GROUP BY`, `HAVING`
  - join-based sales reporting
- Query themes include:
  - salary distribution by department
  - filtering departments by aggregated thresholds
  - employee sales totals
  - product-level revenue summaries
  - top departments/employees by sales
  - employees with no sales

3. `sql_joins_day2.sql`
- Creates relational tables: `employees`, `departments`, `projects`.
- Practices join scenarios:
  - self-join for employee-manager mapping
  - department and project mapping
  - left/right style inclusion for unmatched rows
  - union-based full relationship visibility
- Includes cases to identify:
  - employees without departments
  - employees without projects
  - departments without employees

### Day 2 outcome

Day 2 builds core analytical SQL fluency: grouped reporting plus relationship-based extraction across linked tables.

## DAY3 - Conditional Logic and Window Functions

### Files in DAY3

- `sql_queries_day3.sql`
- `sql_window_functions.sql`

### What each file does

1. `sql_queries_day3.sql`
- Creates an `Employee` table with salary, experience, department, and performance rating.
- Uses `CASE` and nested `CASE` to solve compensation-style rules:
  - hike status based on experience + rating
  - bonus amount based on department + rating
  - employee category labels based on salary + performance
  - advanced hike/bonus rules using multi-condition nesting

2. `sql_window_functions.sql`
- Practices ranking/window techniques on `employees`:
  - `ROW_NUMBER()`
  - `RANK()`
  - `DENSE_RANK()`
- Uses both global and partitioned ranking patterns:
  - salary-based ranking
  - department-wise ranking
  - join-date ordering/ranking

### Day 3 outcome

Day 3 strengthens decision-based SQL (CASE logic) and analytical SQL (window functions), which are essential for reporting, scoring, and ordered insights.

## DAY4 - Databricks Notebook: Student Activity Reconciliation Pipeline

### Files in DAY4

- `day4_real_data.ipynb`
- `README.md` (currently empty)

### What the notebook does (phase-wise)

The notebook is SQL-driven (`%sql`) and processes multiple CSV sources from Databricks Volumes.

Phase 0 style ingestion and normalization:
- Loads raw student master data and response datasets into:
  - `my_csv_table`
  - `my_csv_table1`
  - `my_csv_table2`
- Renames raw `_c0`, `_c1`, ... columns into meaningful names.
- Normalizes emails (`LOWER(TRIM(...))`) to avoid mismatch issues.

Phase 1 mapping:
- Creates `email_mapping` table to unify student identity using registration and normalized email.

Phase 2 data quality checks:
- Builds missing list (students who did not submit)
- Builds valid submission list
- Builds ghost/invalid submission list (emails not in mapping)

Phase 3 duplicate detection:
- Creates `task_submissions_ranked` with `ROW_NUMBER()` over email-based partitions.
- Uses ranking to identify repeat submission behavior.

Phase 4 reporting:
- Counts multi-attempt students
- Detects students using multiple emails
- Creates final classification output `final_student_report`
- Includes curated activity output via `gold_student_activity` view

Additional objects seen in notebook:
- view `first_submissions_only`

### Day 4 outcome

This is a realistic operational data-quality workflow: identity mapping, submission validation, duplicate handling, and final status reporting.

## DAY5 - Regex SQL Practice

### File in DAY5

- `REGEX_PRACTICE.sql`

### What the file does

- Creates `regex_practice` table with 40 rows of structured + semi-structured strings.
- Data fields:
  - `full_text`
  - `email`
  - `phone`
  - `mixed_value`
- Solves 20 regex/string extraction questions.

### Pattern categories covered

- leading numeric extraction
- trailing numeric extraction
- exact single-digit / two-digit capture
- number between letters
- email local part/domain/TLD extraction
- country-code extraction from phone formats
- segment extraction from underscore-delimited strings

### Day 5 outcome

Day 5 improves text parsing capability required for cleaning unstructured and semi-structured columns in real pipelines.

## DAY6 - Real-Life Mini Pipeline (PySpark + SQL in Notebook)

### Files in DAY6

- `day6.ipynb`
- `README.md`

### What `day6.ipynb` does

1. Creates in-memory source DataFrames:
- `customers`
- `cars`
- `sales`

2. Injects and handles practical issues:
- null customer name
- negative car price
- invalid foreign key in sales (`customer_id` with no match)

3. Cleans and validates data:
- null fill for customer name
- absolute value transform for negative price
- inner joins to remove invalid keys
- anti-join checks to measure bad FK rows
- validation summary with consistency check

4. Generates analysis outputs:
- revenue per customer
- cars sold per brand
- city-wise revenue

5. SQL reporting layer:
- creates temp view `final_sales`
- top models per city via `DENSE_RANK()`
- customer purchase count
- monthly revenue and transaction trend
- schema check with `DESCRIBE final_sales`

### Day 6 outcome

Day 6 is an end-to-end miniature data pipeline showing cleaning, referential validation, and business reporting on curated data.

## Weekly Progress Summary (What This Week Proves)

By the end of Week 1, the repository demonstrates:

- PySpark-based cleaning and normalization
- SQL aggregation and grouped business metrics
- relational joins and join strategy understanding
- CASE-based business-rule implementation
- window functions for ranking and dedup-like logic
- notebook-driven reconciliation on real response data
- regex extraction techniques for messy text fields

This week creates a strong base for future phases involving larger datasets, orchestration, and production-style data engineering workflows.

## Important Review Notes

- `DAY1/DAY1.py` is empty and contains no logic.
- `DAY4/README.md` is empty; Day 4 logic exists in `day4_real_data.ipynb`.
- `DAY1/__pycache__` contains generated bytecode, not authored implementation.

## How to Run Main Script from Week 1

```powershell
python Week1/DAY1/customer_cleaning_pyspark.py
```

With custom paths:

```powershell
python Week1/DAY1/customer_cleaning_pyspark.py <input_csv_path> <output_folder_path>
```
