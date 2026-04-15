# 🚀 Week 0 - Data Engineering Foundations

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Portfolio%20Ready-success?style=for-the-badge)

## 📌 What This Week Proves

Week 0 is the foundation layer of the Capgemini Data Engineering training journey. It starts with Databricks Lakeflow and DevOps concepts, then moves through SQL basics, PySpark transformations, data quality handling, customer segmentation, window functions, and realistic e-commerce analytics.

The work is organized as a progression from simple query practice to complete analytical pipelines:

```text
Concepts -> SQL/PySpark basics -> joins and aggregations -> cleaning -> segmentation -> real dataset analytics -> reporting pipeline
```

## 🗂️ Folder Map

```text
Week0/
|- Phase0/   Databricks Lakeflow and DevOps reference foundation
|- Phase1/   SQL basics with PySpark equivalents
|- Phase2/   Joins, aggregations, and customer/order reporting
|- Phase3/   ETL pipeline mindset and SQL-to-PySpark mapping
|- Phase3A/  Data quality challenge with null, duplicate, and invalid-value handling
|- Phase4/   Business mini-pipeline with sales metrics and customer segmentation
|- Phase4A/  Advanced segmentation with fixed thresholds and quantile buckets
|- Phase5/   Olist e-commerce analytics notebook
\- Phase6/   End-to-end dirty-data pipeline with validation, windows, and final reporting
```

## 🧭 Phase-by-Phase Highlights

| Phase | Main Focus | Evidence | Engineering Value |
|---|---|---|---|
| [Phase0](Phase0/) | Lakeflow, Jobs, Connect, DevOps | PDFs + README | Establishes Databricks production concepts before coding |
| [Phase1](Phase1/) | SQL fundamentals and PySpark equivalents | `sql_queries.sql`, `pyspark_code.py`, output screenshots | Builds query fluency across SQL and DataFrame APIs |
| [Phase2](Phase2/) | Customer/order aggregations | `sql_queries.sql`, `pyspark.py`, outputs | Covers revenue, top customers, no-order detection, and order frequency |
| [Phase3](Phase3/) | ETL sequence discipline | `sql_queries.sql`, `pyspark.py` | Reinforces extract, clean, filter, join, aggregate, and output flow |
| [Phase3A](Phase3A/) | Data quality correction | `pyspark.py`, output screenshot | Removes null keys, duplicates, invalid ages, and fills missing attributes |
| [Phase4](Phase4/) | Mini business pipeline | `py_spark.py`, output | Produces daily sales, city revenue, top customers, repeat customers, and segments |
| [Phase4A](Phase4A/) | Advanced segmentation | `pyspark.py`, outputs | Compares fixed business tiers with quantile-driven tiers |
| [Phase5](Phase5/) | Olist real dataset analytics | `Phase5.py.ipynb` | Applies joins, windows, dense ranking, segmentation, and final reporting on real e-commerce tables |
| [Phase6](Phase6/) | Validated reporting pipeline | `Phase6.ipynb` | Cleans dirty customer/order data, detects orphan orders, ranks customers, builds running totals and monthly trends |

## 🔎 Key Work Delivered

### SQL and PySpark Core
- Created sample business tables and queried them with filtering, projection, grouping, and ordering.
- Rebuilt the same logic in PySpark using `select`, `filter`, `groupBy`, `agg`, and ordered results.
- Practiced SQL-to-PySpark translation so the same business question can be solved in both styles.

### Joins and Business Metrics
- Calculated total and average order value per customer.
- Identified top spenders and customers with no orders.
- Produced city-wise revenue and frequent-customer reporting.
- Used joins as the bridge between normalized source tables and analytical outputs.

### Data Quality Mindset
- Removed null primary keys before downstream joins.
- De-duplicated repeated customer records.
- Replaced missing text fields with controlled defaults such as `Guest` and `Unknown`.
- Filtered logically invalid records, including negative ages and invalid transaction values.

### Segmentation and Window Analytics
- Implemented Gold/Silver/Bronze customer tiers with `when/otherwise`.
- Used `approxQuantile` for distribution-aware segmentation.
- Applied `RANK`, `DENSE_RANK`, running totals, and city-level ranking in notebooks.

### Real Dataset and Reporting
- Used Olist datasets from Databricks Volumes for customer, order, payment, item, product, and category analysis.
- Built daily sales with running totals.
- Ranked top customers per city and top products per category.
- Created final reporting tables with customer spend, city, segment, and order counts.

## 🧠 Skills Demonstrated

- Databricks Lakeflow and data DevOps awareness
- SQL DDL, DML, filtering, grouping, and ordering
- PySpark DataFrame transformations
- Join strategy and relationship-aware reporting
- Null handling, deduplication, and invalid-record filtering
- Customer segmentation with business and statistical rules
- Window functions for ranking and cumulative analytics
- End-to-end notebook-based reporting

## ✅ Reviewer Quick Scan

Start here if you are reviewing the week:

1. [Phase1/sql_queries.sql](Phase1/sql_queries.sql) and [Phase1/pyspark_code.py](Phase1/pyspark_code.py) for SQL/PySpark basics.
2. [Phase3A/pyspark.py](Phase3A/pyspark.py) for focused data cleaning.
3. [Phase4/py_spark.py](Phase4/py_spark.py) and [Phase4A/pyspark.py](Phase4A/pyspark.py) for reporting and segmentation.
4. [Phase5/Phase5.py.ipynb](Phase5/Phase5.py.ipynb) for Olist analytics.
5. [Phase6/Phase6.ipynb](Phase6/Phase6.ipynb) for the most complete Week 0 validation and reporting workflow.

## 👤 Author

**Vivek Sadhu**

Data Engineering Trainee
