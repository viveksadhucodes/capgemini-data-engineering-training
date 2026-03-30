# Phase 1: Data Exploration & SQL Fundamentals

## 📝 Problem Summary
The objective of this phase was to demonstrate proficiency in basic Data Manipulation Language (DML) and Data Query Language (DQL) within the Databricks environment. Using a sample `customers` dataset, I performed table creation, data insertion, and various filtering and aggregation tasks.

## 🚀 Approach Taken
1. **Schema Definition**: Created a structured `customers` table with appropriate data types (`INT`, `VARCHAR`) to ensure data integrity.
2. **Data Ingestion**: Populated the table using manual `INSERT` statements to simulate a raw data entry process.
3. **Exploratory Data Analysis (EDA)**:
   - Verified the total dataset using `SELECT *`.
   - Applied conditional filtering to isolate records by specific attributes (City and Age).
4. **Aggregation**: Implemented grouping logic to derive business insights regarding customer distribution across different cities.

## 🛠 Key Transformations & Queries
- **Filtering**: Used the `WHERE` clause to filter customers specifically from 'Chennai' and those above the age of 25.
- **Selection**: Performed columnar selection to retrieve only necessary fields (`customer_name`, `city`), optimizing query performance.
- **Aggregation**: Used `COUNT(*)` combined with `GROUP BY` to calculate the density of customers per city.
- **Sorting**: Applied `ORDER BY` in descending order to highlight the most prominent customer locations.

## 💡 Learnings
- **Databricks SQL Syntax**: Practiced running standard SQL commands directly within Databricks notebooks.
- **Data Filtering**: Mastered the use of logical operators to subset data effectively for reporting.
- **Aggregation Logic**: Understood how to transform raw row-level data into summarized business metrics.

---
### 📁 Deliverables in this Folder
- `sql_queries.sql`: The full set of SQL commands executed.
- `pyspark.py`: (If applicable) The PySpark equivalent of these transformations.
- `outputs/`: Screenshots of the query result tables from the Databricks cell outputs.
