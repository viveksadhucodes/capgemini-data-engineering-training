# Week 1 - Detailed Work Log and File Guide

## What This Week Covers

Week 1 in this repository is focused on SQL fundamentals, data cleaning practice, and real-data analysis in Databricks SQL.
The work progresses from basic data cleanup (Day 1) to aggregations and joins (Day 2), conditional and window logic (Day 3), notebook-based student activity analysis (Day 4), and regex extraction patterns (Day 5).

This README is written so that someone with no prior context can understand exactly what was done, where it was done, and why each file exists.

## Week 1 Folder Structure (Audited)

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
\- DAY5/
   \- REGEX_PRACTICE.sql
```

## Day-by-Day Breakdown

### DAY1 - PySpark Data Cleaning Practice

#### Files
- `DAY1/C1.csv`
- `DAY1/customer_cleaning_pyspark.py`
- `DAY1/DAY1.py` (empty placeholder file)
- `DAY1/__pycache__/customer_cleaning_pyspark.cpython-312.pyc` (auto-generated Python bytecode)

#### What was done
`customer_cleaning_pyspark.py` reads `C1.csv`, standardizes messy fields, removes invalid rows, and writes cleaned output.

Main logic implemented:
- trims whitespace and converts placeholders like `blank`, `null`, `none`, `na`, `n/a` to actual nulls
- casts `CustomerID` to integer and `Sales` to double
- normalizes `Name` using proper case (`initcap`)
- standardizes `Country` values (`india` to `India`, `usa` and `new york` to `USA`, `uk` to `UK`)
- normalizes `Category` to `A/B/C` else `Unknown`
- parses `JoinDate` using two formats (`dd-MM-yyyy` and `MM-dd-yyyy`)
- fills missing text/sales values with safe defaults
- drops rows missing critical fields (`CustomerID`, `JoinDate`)
- removes duplicates based on business columns
- writes cleaned CSV output to `DAY1/cleaned_output`

This day demonstrates practical ETL-style cleaning in PySpark.

### DAY2 - SQL Aggregations and Joins

#### Files
- `DAY2/README.md`
- `DAY2/sql_queries_day2.sql`
- `DAY2/sql_joins_day2.sql`

#### What was done
This day contains two SQL practice tracks.

`sql_queries_day2.sql`:
- creates and populates `Employee` and `Sales` tables
- practices aggregate reporting with `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`
- uses `GROUP BY` and `HAVING` for filtered summaries
- combines employee and sales data to compute metrics like top departments, product totals, employee-wise sales, and non-performing employees

`sql_joins_day2.sql`:
- creates `employees`, `departments`, and `projects`
- practices self joins for employee-manager mapping
- practices `INNER JOIN`, `LEFT JOIN`, and right-side coverage patterns
- includes `UNION`-based combinations for full relationship visibility
- includes scenarios for unmatched records (employees with no departments/projects, and departments with no employees)

This day shows transition from basic SQL to relational analysis.

### DAY3 - CASE Logic and Window Functions

#### Files
- `DAY3/sql_queries_day3.sql`
- `DAY3/sql_window_functions.sql`

#### What was done
`sql_queries_day3.sql`:
- creates an employee performance dataset with salary, experience, and rating
- solves conditional business rules using `CASE`
- includes nested `CASE` for advanced compensation and bonus logic
- classifies employees by risk/performance categories

`sql_window_functions.sql`:
- practices `ROW_NUMBER`, `RANK`, and `DENSE_RANK`
- applies global and partitioned ranking by salary, department, and join date
- demonstrates ordered analytics patterns used in reporting and leaderboard-style outputs

This day focuses on analytical SQL reasoning beyond simple joins.

### DAY4 - Real Data Workflow in Databricks Notebook

#### Files
- `DAY4/day4_real_data.ipynb`
- `DAY4/README.md` (currently empty)

#### What was done in notebook
The notebook contains a multi-phase SQL pipeline using CSV inputs from Databricks volume paths.

Key assets created in the notebook:
- tables: `my_csv_table`, `my_csv_table1`, `my_csv_table2`, `email_mapping`, `task_submissions_ranked`, `final_student_report`
- views: `gold_student_activity`, `first_submissions_only`

Workflow covered:
- ingest raw CSV datasets
- rename/normalize columns and standardize emails
- create unified student-email mapping
- validate mapped vs unmapped responses
- build a gold activity view with submission status
- generate missing/success/invalid submission lists
- detect duplicates using `ROW_NUMBER()` window logic
- count repeated submissions and multi-email usage
- produce final student classification report

This is the most real-world data quality and reporting workflow in Week 1.

### DAY5 - SQL Regex Extraction Practice

#### File
- `DAY5/REGEX_PRACTICE.sql`

#### What was done
- creates `regex_practice` with synthetic data (`full_text`, `email`, `phone`, `mixed_value`)
- inserts 40 sample records covering multiple text patterns
- solves 20 extraction tasks using regex and string functions

Patterns practiced include:
- leading/trailing numbers
- exact-length numeric extraction
- extracting email local part/domain/TLD
- country code extraction from phones
- extracting text between delimiters/underscores
- mixed alphanumeric segment extraction

This day demonstrates pattern parsing skills useful in data cleaning and validation.

## Important Notes for Reviewers

- `DAY1/DAY1.py` is an empty file and does not contain runnable logic.
- `DAY4/README.md` is empty; the actual Day 4 work is fully inside `day4_real_data.ipynb`.
- `DAY1/__pycache__` contains interpreter-generated cache files, not authored business logic.

## How to Run the Main Script in Week 1

From repository root:

```powershell
python Week1/DAY1/customer_cleaning_pyspark.py
```

Optional custom input/output paths:

```powershell
python Week1/DAY1/customer_cleaning_pyspark.py <input_csv_path> <output_folder_path>
```

## What Someone New Should Understand

By the end of Week 1, this repository shows:
- practical data cleaning in PySpark
- core SQL analytics with aggregation and joins
- conditional SQL design with nested business rules
- window-function based ranking and duplicate handling
- notebook-based real-data reconciliation and reporting
- regex-driven text extraction for semi-structured fields

In short, Week 1 establishes the SQL and data quality foundation used later in data engineering workflows.
