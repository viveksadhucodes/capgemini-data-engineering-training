# Week 1 - SQL, PySpark, Data Quality, and Notebook Analytics

## Week Objective

Week 1 is focused on building practical data engineering strength across:
- structured SQL analysis,
- PySpark-based data cleaning,
- real-data reconciliation in Databricks notebooks,
- regex parsing for semi-structured fields,
- and end-to-end validation/reporting pipelines.

This README is the master index for all Day-level work and documentation.

## Week 1 Structure

```text
Week1/
|- README.md
|- DAY1/
|  |- C1.csv
|  |- customer_cleaning_pyspark.py
|  |- DAY1.py
|  |- README.md
|  \- __pycache__/
|- DAY2/
|  |- sql_queries_day2.sql
|  |- sql_joins_day2.sql
|  \- README.md
|- DAY3/
|  |- sql_queries_day3.sql
|  |- sql_window_functions.sql
|  \- README.md
|- DAY4/
|  |- day4_real_data.ipynb
|  \- README.md
|- DAY5/
|  |- REGEX_PRACTICE.sql
|  \- README.md
\- DAY6/
   |- day6.ipynb
   |- day6_advanced_data.ipynb
   \- README.md
```

## Day-by-Day Documentation Index

## Day 1 - PySpark Customer Cleaning
- Folder: `Week1/DAY1/`
- README: `Week1/DAY1/README.md`
- Evidence files:
  - `C1.csv`
  - `customer_cleaning_pyspark.py`

Highlights:
- null-like value normalization
- schema casting and categorical standardization
- multi-format date parsing
- mandatory-field filtering and deduplication

## Day 2 - SQL Aggregations and Joins
- Folder: `Week1/DAY2/`
- README: `Week1/DAY2/README.md`
- Evidence files:
  - `sql_queries_day2.sql`
  - `sql_joins_day2.sql`

Highlights:
- grouped reporting with `SUM/COUNT/AVG/MIN/MAX`
- `GROUP BY` + `HAVING`
- self joins and multi-table join patterns
- unmatched record handling and union-style completeness views

## Day 3 - CASE and Window Functions
- Folder: `Week1/DAY3/`
- README: `Week1/DAY3/README.md`
- Evidence files:
  - `sql_queries_day3.sql`
  - `sql_window_functions.sql`

Highlights:
- nested business rules using `CASE`
- hike/bonus/category logic
- window functions: `ROW_NUMBER`, `RANK`, `DENSE_RANK`
- partitioned and global ranking approaches

## Day 4 - Real Data Reconciliation Notebook
- Folder: `Week1/DAY4/`
- README: `Week1/DAY4/README.md`
- Evidence file:
  - `day4_real_data.ipynb`

Highlights:
- CSV ingestion in Databricks SQL
- email normalization and identity mapping
- missing/valid/invalid submission detection
- duplicate detection with window logic
- final student classification reporting

## Day 5 - Regex SQL Practice
- Folder: `Week1/DAY5/`
- README: `Week1/DAY5/README.md`
- Evidence file:
  - `REGEX_PRACTICE.sql`

Highlights:
- 40-row sample dataset for text-pattern analysis
- 20 regex extraction queries
- email/phone/id parsing and delimiter extraction

## Day 6 - Core + Advanced Sales Pipeline
- Folder: `Week1/DAY6/`
- README: `Week1/DAY6/README.md`
- Evidence files:
  - `day6.ipynb`
  - `day6_advanced_data.ipynb`

Highlights:
- end-to-end cleaning and FK validation
- anti-join quality checks and validation reports
- multi-table transformations with dealer dimension
- customer/city/dealer analytics in PySpark + SQL

## Skills Demonstrated in Week 1

- SQL modeling and query writing
- grouped analytics and KPI-style summaries
- relational joins across multiple entities
- conditional transformations using CASE
- ranking and window-function analysis
- PySpark cleaning and data typing
- notebook-based reconciliation and reporting
- regex extraction for semi-structured data
- validation-first data engineering mindset

## Reviewer Notes (Meeting Ready)

- Each Day folder now has a dedicated README documenting objective, inputs, transformations, and outcomes.
- All documentation is mapped directly to executable evidence files (`.sql`, `.py`, `.ipynb`, `.csv`).
- Week 1 can be reviewed independently as a complete proof package of practical data engineering progress.
