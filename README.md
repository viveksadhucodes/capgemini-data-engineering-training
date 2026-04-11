# Capgemini Data Engineering Training

## Repository Overview

This repository documents my hands-on learning path in data engineering, with practical work in:
- SQL fundamentals and analytical querying
- PySpark DataFrame transformations
- Data cleaning and validation patterns
- Join and aggregation pipelines
- Window functions and ranking
- Regex-based parsing for semi-structured data
- Databricks notebook workflows

The work is organized week-wise, with `Week0` containing phase-level progression and `Week1` containing day-level detailed implementation.

## Current Repository Structure

```text
capgemini-data-engineering-training/
|- Week0/
|  |- Phase0/
|  |- Phase1/
|  |- Phase2/
|  |- Phase3/
|  |- Phase3A/
|  |- Phase4/
|  |- Phase4A/
|  |- Phase5/
|  \- Phase6/
|- Week1/
|  |- DAY1/
|  |- DAY2/
|  |- DAY3/
|  |- DAY4/
|  |- DAY5/
|  |- DAY6/
|  \- README.md
|- Week2/
|  \- README.md
|- Week3/
|  \- README.md
|- Week4/
|  |- DAY4/
|  \- README.me
\- README.md
```

## Detailed Progress by Week

## Week0 - Phase-Based Foundation and Pipeline Thinking

`Week0` is the most phase-driven part of the repository and contains core SQL/PySpark building blocks.

### Phase0

Files:
- `Week0/Phase0/README.md`
- 4 reference PDFs on Lakeflow + DevOps concepts

Focus:
- Databricks Lakeflow foundations
- ingestion/orchestration concepts
- DevOps mindset for data pipelines

### Phase1

Files:
- `Week0/Phase1/sql_queries.sql`
- `Week0/Phase1/pyspark_code.py`
- `Week0/Phase1/Outputs/` (result screenshots)
- `Week0/Phase1/README.md`

Implemented work:
- customer table creation and inserts in SQL
- filtering, projection, and grouped counts
- PySpark equivalents for SQL selection/filter/group operations

### Phase2

Files:
- `Week0/Phase2/sql_queries.sql`
- `Week0/Phase2/pyspark.py`
- `Week0/Phase2/outputs/`
- `Week0/Phase2/README.md`

Implemented work:
- customer and orders analytical tasks
- total spend calculations, top customers, no-order detection
- city-level revenue and average-order metrics

### Phase3

Files:
- `Week0/Phase3/sql_queries.sql`
- `Week0/Phase3/pyspark.py`
- `Week0/Phase3/Outputs/`
- `Week0/Phase3/README.md`

Implemented work:
- extract-filter-join-aggregate pipeline mindset
- SQL and PySpark mapping for core transformations

### Phase3A

Files:
- `Week0/Phase3A/pyspark.py`
- `Week0/Phase3A/Outputs/`
- `Week0/Phase3A/README.md`

Implemented work:
- quality cleanup challenge on messy data
- remove null keys, drop duplicates, fill missing values, remove invalid ages
- validate count changes before and after cleaning

### Phase4

Files:
- `Week0/Phase4/py_spark.py`
- `Week0/Phase4/Output/`
- `Week0/Phase4/README.md`

Implemented work:
- mini business pipeline:
- daily sales
- city-wise revenue
- top customers
- repeat customer detection
- spend-based segmentation (`Gold`, `Silver`, `Bronze`)
- final reporting table preparation

### Phase4A

Files:
- `Week0/Phase4A/pyspark.py`
- `Week0/Phase4A/outputs/`
- `Week0/Phase4A/README.md`

Implemented work:
- fixed-threshold bucketing and segment counts
- quantile-based dynamic segmentation using `approxQuantile`

### Phase5 and Phase6

Files:
- `Week0/Phase5/README.md`
- `Week0/Phase6/README.md`

Current state:
- folders are present
- readme files are currently placeholders/empty

## Week1 - Day-Wise SQL, PySpark, Notebook, and Regex Work

`Week1` contains detailed daily tasks and is currently the most fully documented week.

Main index:
- `Week1/README.md` (comprehensive day-wise and file-wise audit)

### Day 1 (`Week1/DAY1`)

Key files:
- `C1.csv`
- `customer_cleaning_pyspark.py`

Implemented work:
- raw CSV cleanup using PySpark
- null normalization, type casting, country/category standardization
- date parsing with multiple formats
- record validation and deduplication

### Day 2 (`Week1/DAY2`)

Key files:
- `sql_queries_day2.sql`
- `sql_joins_day2.sql`
- `README.md`

Implemented work:
- aggregation tasks with `SUM/COUNT/AVG/MIN/MAX`, `GROUP BY`, `HAVING`
- self joins and relational joins across employees/departments/projects
- missing-match analysis with outer joins and unions

### Day 3 (`Week1/DAY3`)

Key files:
- `sql_queries_day3.sql`
- `sql_window_functions.sql`

Implemented work:
- business-rule logic with `CASE` and nested `CASE`
- ranking and sequencing using `ROW_NUMBER`, `RANK`, `DENSE_RANK`

### Day 4 (`Week1/DAY4`)

Key files:
- `day4_real_data.ipynb`
- `README.md` (currently empty)

Implemented work in notebook:
- ingest student and response CSV datasets in Databricks SQL
- normalize emails and create unified `email_mapping`
- build valid/missing/invalid submission views
- duplicate detection using window functions
- create `final_student_report` and curated activity views

### Day 5 (`Week1/DAY5`)

Key file:
- `REGEX_PRACTICE.sql`

Implemented work:
- regex extraction practice over 40 sample rows
- email, phone, alphanumeric, delimiter-based extraction patterns

### Day 6 (`Week1/DAY6`)

Key files:
- `day6.ipynb`
- `README.md`

Implemented work:
- mini end-to-end cleaning + validation + reporting flow in notebook
- null handling, negative value correction, invalid-key elimination
- anti-join based validation metrics
- city/customer/brand revenue analyses
- SQL reporting via temp view `final_sales`

## Week2, Week3, Week4 Current Status

- `Week2/README.md` exists but is currently empty placeholder content.
- `Week3/README.md` exists but is currently empty placeholder content.
- `Week4/README.me` exists with placeholder content and includes `Week4/DAY4/` folder.

## Technical Skills Demonstrated in This Repository

- SQL DDL and DML
- SQL aggregations and filtering patterns
- SQL joins (inner/left/right/self/union patterns)
- SQL window functions for ranking and dedup logic
- PySpark DataFrame API for ETL operations
- data quality checks (nulls, duplicates, invalid values)
- spend and customer segmentation logic
- notebook-driven reporting workflows in Databricks
- regex-based extraction for string parsing tasks

## How to Use This Repository

1. Start with `Week0` if you want phase-wise learning progression from fundamentals.
2. Use `Week1/README.md` for the most detailed day-by-day implementation log.
3. Open `.sql` files to review query practice and business logic tasks.
4. Open `.py` files for PySpark transformations and data-cleaning pipelines.
5. Open `.ipynb` notebooks for Databricks-oriented workflows.

## Execution Notes

- Python scripts assume a PySpark-capable environment.
- Notebook files (`.ipynb`) are designed for Databricks-style execution.
- Some folders include screenshots and output references as evidence of completed tasks.

## Author

Vivek Sadhu
