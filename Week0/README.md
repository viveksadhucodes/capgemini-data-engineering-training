# 🚀 Week0 - Capgemini Data Engineering Foundations

### SQL · PySpark · ETL Thinking · Data Quality · Segmentation · Olist Analytics

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Apache Spark](https://img.shields.io/badge/Apache%20Spark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Week0-Documented-success?style=for-the-badge)

---

## 📌 Week0 Purpose

`Week0` captures the foundation stage of my Capgemini data engineering journey.
The work starts with environment setup and SQL basics, then moves into PySpark transformations, data-quality handling, ETL pipeline structure, segmentation logic, and real-dataset analytics on Olist.

This folder serves as proof of both:
- conceptual understanding (phase readmes, reference material), and
- hands-on implementation (`.sql`, `.py`, `.ipynb`, and output evidence).

---

## 🗂️ Week0 Structure

```text
Week0/
|- Phase0/
|- Phase1/
|- Phase2/
|- Phase3/
|- Phase3A/
|- Phase4/
|- Phase4A/
|- Phase5/
\- Phase6/
```

---

## 📚 Phase-by-Phase Summary

## Phase0 - Lakeflow and DevOps Foundations

Key assets:
- `Phase0/README.md`
- Lakeflow and DevOps PDFs

Focus:
- Databricks Lakeflow concepts
- ingestion, declarative pipelines, job orchestration
- DevOps mindset for data engineering delivery

## Phase1 - SQL Basics + PySpark Equivalents

Key assets:
- `Phase1/sql_queries.sql`
- `Phase1/pyspark_code.py`
- `Phase1/Outputs/`

Work delivered:
- basic table creation and inserts
- filtering and grouped counts
- SQL-to-PySpark mapping for core operations

## Phase2 - Transformation and Aggregation Practice

Key assets:
- `Phase2/sql_queries.sql`
- `Phase2/pyspark.py`
- `Phase2/outputs/`

Work delivered:
- customer/order transformations
- top customers, no-order detection, city revenue, average spending
- early practice of join + aggregation sequencing

## Phase3 - ETL and Pipeline Mindset

Key assets:
- `Phase3/sql_queries.sql`
- `Phase3/pyspark.py`
- `Phase3/Outputs/`

Work delivered:
- structured flow: extract -> clean -> filter -> join -> aggregate -> output
- emphasis on cleaning before joins and filtering before heavy aggregation

## Phase3A - Data Quality Challenge

Key assets:
- `Phase3A/pyspark.py`
- `Phase3A/README.md`
- `Phase3A/Outputs/`

Work delivered:
- null-key removal
- duplicate elimination
- invalid value filtering (for example negative ages)
- imputation for missing attributes

## Phase4 - Business Mini Pipeline

Key assets:
- `Phase4/py_spark.py`
- `Phase4/Output/`
- `Phase4/README.md`

Work delivered:
- daily sales metrics
- city-wise revenue
- top customer and repeat customer logic
- spending-based customer segmentation
- final reporting output generation

## Phase4A - Advanced Segmentation

Key assets:
- `Phase4A/pyspark.py`
- `Phase4A/README.md`

Work delivered:
- rule-based bucketing (`Gold/Silver/Bronze`)
- quantile-based segmentation using `approxQuantile`
- distribution analysis per segment

## Phase5 - Olist Real Dataset Analytics (Updated)

Key assets:
- `Phase5/Phase5.py.ipynb`
- `Phase5/README.md`

Implemented in notebook (line-by-line verified):
- load Olist datasets from Databricks Volume:
  - customers
  - orders
  - payments
  - order items
  - products
  - category translation
- Task 1: top 3 customers per city using window `RANK()` on total spend
- Task 2: daily sales + running total using ordered window aggregation
- Task 3: top products per category using `DENSE_RANK()`
- Task 4: customer total spend (customer-level CLV-style aggregate)
- Task 5: customer segmentation (`Gold`, `Silver`, `Bronze`)
- Task 6: final reporting table combining:
  - `customer_id`
  - `customer_city`
  - `total_spend`
  - `segment`
  - `total_orders`

Why Phase5 is important:
- this is the transition from practice data to realistic e-commerce scale and relationships.

## Phase6 - Current State (Updated)

Key assets:
- `Phase6/README.md`

Current status observed:
- Phase6 folder is created and tracked.
- README placeholder exists, but implementation files are not yet present in this repository snapshot.

This indicates Phase6 setup is in place and ready for next-stage implementation/documentation updates.

---

## 🧠 Core Skills Demonstrated in Week0

- SQL querying and grouped analytics
- PySpark DataFrame transformations
- join strategy and null-safe processing
- data quality controls (nulls, duplicates, invalid values)
- ETL pipeline ordering discipline
- customer segmentation methods
- window-function analytics on real datasets
- integration of multiple Olist tables into final reports

---

## 📈 Why Week0 Matters

Week0 establishes the engineering base required for advanced weekly work:
- strong query and transformation fundamentals,
- data quality-first approach,
- and evidence of scaling from toy data to real-business data logic.

For review discussions, this folder demonstrates consistent progression from foundational concepts to applied analytics.

---

## 👤 Author

Vivek Sadhu
Data Engineering Trainee
