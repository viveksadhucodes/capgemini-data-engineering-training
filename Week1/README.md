# 📊 Week 1 - SQL, PySpark, Data Quality, and Analytical Pipelines

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Regex](https://img.shields.io/badge/Regex-Text%20Engineering-4B5563?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Review%20Ready-success?style=for-the-badge)

## 🎯 Week Objective

Week 1 turns the Week 0 foundation into stronger hands-on execution. The focus is practical data engineering: cleaning raw files, writing analytical SQL, validating joins, reconciling real submissions, extracting semi-structured patterns with regex, and building notebook-driven reporting pipelines.

The week follows a clear learning arc:

```text
Raw data -> cleaning -> SQL analytics -> joins -> CASE/window logic -> reconciliation -> regex parsing -> validated reporting
```

## 🗂️ Folder Map

```text
Week1/
|- DAY1/   PySpark customer CSV cleaning
|- DAY2/   SQL aggregations and relational joins
|- DAY3/   CASE logic and window functions
|- DAY4/   Databricks SQL reconciliation notebook
|- DAY5/   Regex and string extraction practice
|- DAY6/   End-to-end sales pipeline notebooks
|- Data_Engineering_Week_1_Portfolio.pptx
|- Master Guide_ Data Cleaning Techniques in PySpark.pdf
|- Tranformations.pdf
\- What is Data Validation.pdf
```

## 📚 Day-by-Day Portfolio

| Day | Main Focus | Evidence | Practical Outcome |
|---|---|---|---|
| [DAY1](DAY1/) | Customer CSV cleaning in PySpark | `C1.csv`, `customer_cleaning_pyspark.py` | Converts messy customer data into typed, standardized, deduplicated output |
| [DAY2](DAY2/) | SQL aggregations and joins | `sql_queries_day2.sql`, `sql_joins_day2.sql` | Builds KPI-style summaries and relationship-aware reports |
| [DAY3](DAY3/) | Conditional SQL and ranking | `sql_queries_day3.sql`, `sql_window_functions.sql` | Implements business rules, salary logic, row numbering, rank, and dense rank |
| [DAY4](DAY4/) | Real Databricks reconciliation | `day4_real_data.ipynb` | Maps student identities, validates submissions, detects missing/invalid/duplicate records |
| [DAY5](DAY5/) | Regex extraction in SQL | `REGEX_PRACTICE.sql` | Extracts IDs, email parts, phone codes, delimiters, and numeric patterns |
| [DAY6](DAY6/) | Sales pipeline, validation, analytics | `day6.ipynb`, `day6_advanced_data.ipynb` | Cleans dimensional data, validates foreign keys, joins dealer/customer/car data, and produces analytics |

## 🔍 What Each Day Demonstrates

### DAY1 - PySpark Customer Cleaning
- Normalizes null-like strings such as `blank`, `null`, `none`, `na`, and empty values.
- Casts `CustomerID` and `Sales` into usable numeric types.
- Standardizes names, countries, and categories.
- Handles multiple date formats with fallback parsing.
- Drops unusable key/date records and removes duplicate business rows.

### DAY2 - SQL Aggregations and Joins
- Creates employee, sales, department, and project tables.
- Uses `SUM`, `COUNT`, `AVG`, `MIN`, `MAX`, `GROUP BY`, and `HAVING`.
- Practices self joins, inner joins, left/right joins, union-style completeness views, and `COALESCE`.
- Identifies unmatched employees, departments, projects, and no-sales scenarios.

### DAY3 - CASE and Window Functions
- Encodes business rules with simple and nested `CASE`.
- Calculates hike, bonus, category, and performance-style classifications.
- Uses `ROW_NUMBER`, `RANK`, and `DENSE_RANK`.
- Compares global ranking with department-partitioned ranking.

### DAY4 - Real Dataset Reconciliation
- Loads multiple CSV sources into Databricks SQL tables.
- Renames raw `_c0`, `_c1`, style fields into meaningful columns.
- Builds a normalized `email_mapping` table.
- Detects missing submissions, valid submissions, ghost responses, duplicates, and multiple-email behavior.
- Produces final status outputs such as `gold_student_activity`, `first_submissions_only`, and `final_student_report`.

### DAY5 - Regex and Semi-Structured Fields
- Builds a 40-row practice dataset with mixed IDs, email addresses, phone numbers, and alphanumeric fields.
- Uses `REGEXP_SUBSTR`, `REGEXP_REPLACE`, `LEFT`, `RIGHT`, and `SUBSTRING_INDEX`.
- Extracts usernames, domains, TLDs, country codes, delimiter-based sections, and numeric sequences.

### DAY6 - End-to-End Sales Pipeline
- Starts with a compact workflow in `day6.ipynb` and expands into a richer dealer-integrated pipeline in `day6_advanced_data.ipynb`.
- Cleans null names, trims strings, converts dates, fixes negative prices, and removes duplicate sale IDs.
- Uses `left_anti` checks for orphan customer/car keys.
- Builds a validation report with raw counts, nulls, duplicates, orphan records, clean-record counts, and percentages.
- Produces customer spend, brand sales, city revenue, dealer revenue, top dealers, showroom revenue, monthly trends, and repeat-customer lifetime value.

## 🧠 Skills Demonstrated

- PySpark cleaning pipelines and defensive ingestion
- SQL aggregation and KPI reporting
- Relational joins and unmatched-record analysis
- Conditional business logic with `CASE`
- Window functions for ranking and duplicate detection
- Databricks SQL table/view creation
- Identity mapping and reconciliation
- Regex extraction for semi-structured data
- Foreign-key validation and anti-join quality checks
- Notebook-based analytical reporting

## 📎 Supporting Study Material

- [Data_Engineering_Week_1_Portfolio.pptx](Data_Engineering_Week_1_Portfolio.pptx)
- [Master Guide_ Data Cleaning Techniques in PySpark.pdf](Master%20Guide_%20Data%20Cleaning%20Techniques%20in%20PySpark.pdf)
- [Tranformations.pdf](Tranformations.pdf)
- [What is Data Validation.pdf](What%20is%20Data%20Validation.pdf)

## ✅ Reviewer Quick Scan

For a fast review, open these files first:

1. [DAY1/customer_cleaning_pyspark.py](DAY1/customer_cleaning_pyspark.py) for the cleanest standalone PySpark script.
2. [DAY2/sql_queries_day2.sql](DAY2/sql_queries_day2.sql) and [DAY2/sql_joins_day2.sql](DAY2/sql_joins_day2.sql) for SQL reporting and relationships.
3. [DAY3/sql_window_functions.sql](DAY3/sql_window_functions.sql) for ranking practice.
4. [DAY4/day4_real_data.ipynb](DAY4/day4_real_data.ipynb) for real reconciliation logic.
5. [DAY6/day6_advanced_data.ipynb](DAY6/day6_advanced_data.ipynb) for the broadest end-to-end pipeline.

## 👤 Author

**Vivek Sadhu**

Data Engineering Trainee
