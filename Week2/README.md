# 🏗️ Week 2 - Advanced SQL, Delta Lake, Incremental Loads, and Medallion Architecture

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)
![Delta Lake](https://img.shields.io/badge/Delta%20Lake-00A1E0?style=for-the-badge)
![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=for-the-badge&logo=databricks&logoColor=white)
![Status](https://img.shields.io/badge/Status-Documented-success?style=for-the-badge)

## 🎯 Week Objective

Week 2 moves from basic transformations into production-style data engineering patterns. The focus is on advanced SQL reasoning, Common Table Expressions, subqueries, Delta Lake operations, full and incremental loads, notebook parameterization, and Medallion Architecture design.

The learning path is:

```text
Advanced SQL -> PySpark cleaning and validation -> Delta operations -> incremental loads -> reusable notebooks -> Bronze/Silver/Gold architecture
```

## 🗂️ Folder Map

```text
Week2/
|- DAY1/
|  |- basic_cte's.sql
|  |- subqueries_and_ctes.sql
|  \- day1_week2.ipynb
|- DAY2_WEEK2/
|  |- delta_table_practise.ipynb
|  |- Existing_Pyspark_Code_5.ipynb
|  |- End_To_End_Pipeline_6.ipynb
|  \- work_given/
|     |- Handle_Nulls_1.ipynb
|     |- UDF_2.ipynb
|     |- Full_And_Incremental_Load_3.ipynb
|     |- DemoWidgets_4.ipynb
|     \- Delta_Table_And_Operations.ipynb
\- DAY3/
   \- Medallion_Architecture.ipynb
```

## 📚 Day-by-Day Portfolio

| Day | Main Focus | Evidence | Practical Outcome |
|---|---|---|---|
| [DAY1](DAY1/) | CTEs, subqueries, and PySpark validation | SQL files + `day1_week2.ipynb` | Builds advanced SQL logic and an insurance-style PySpark pipeline with cleaning, validation, and risk metrics |
| [DAY2_WEEK2](DAY2_WEEK2/) | Delta Lake, UDFs, null handling, incremental loads | Delta and pipeline notebooks | Practices production load patterns, UPSERT thinking, schema evolution, widgets, and reusable transformations |
| [DAY3](DAY3/) | Medallion Architecture | `Medallion_Architecture.ipynb` | Implements Bronze ingestion, Silver cleaning/deduplication, and Gold business aggregations |

## 🔎 File-by-File Summary

### DAY1 - SQL CTEs, Subqueries, and Insurance Pipeline

#### `basic_cte's.sql`
- Creates `employees`, `Departments`, and `Orders` tables.
- Uses CTEs to isolate high earners, rename columns, filter departments, calculate bonus amounts, and select orders after a date.
- Practices staff counts, string labels with `CONCAT`, department salary totals, department-name joins, and salary-limited outputs.

#### `subqueries_and_ctes.sql`
- Uses subqueries to find employees earning above average salary.
- Finds employees in the same department as Alice.
- Finds minimum-salary employees.
- Uses `IN` to detect employees with orders.
- Compares salaries against all employees in department `102`.
- Adds CTE solutions for high earners, average salary by department, employee-department mapping, total order amount per employee, and salary-above-department-average analysis.

#### `day1_week2.ipynb`
- Builds sample insurance datasets: customers, policies, claims, agents, and policy-agent mapping.
- Joins all entities into a unified analytical DataFrame.
- Cleans negative premiums and claim amounts with `abs`.
- Standardizes strings and fills missing premiums, claim amounts, and statuses.
- Validates orphan keys using `left_anti` joins for policies, claims, and policy-agent mappings.
- Produces a validation summary across raw, invalid, and cleaned records.
- Calculates customer-level premium, claim, and risk score.
- Builds city-level insurance distribution with total premium, total claim, and risk index.

## DAY2_WEEK2 - Delta Lake and Pipeline Patterns

### `work_given/Handle_Nulls_1.ipynb`
- Demonstrates `isNull`, `isNotNull`, `fillna`, `dropna`, and `coalesce`.
- Replaces null salary values with average salary or constants.
- Drops rows with missing names.
- Counts null records.
- Adds derived columns such as bonus, category, and grade.
- Compares UDF logic with optimized built-in `when` expressions.

### `work_given/UDF_2.ipynb`
- Explains why User Defined Functions are used.
- Creates a Python `grade` function for salary classification.
- Converts the function into a Spark UDF with `StringType`.
- Applies the UDF to a DataFrame column.

### `work_given/Full_And_Incremental_Load_3.ipynb`
- Performs a Day 1 full load into Parquet.
- Reads the existing target dataset.
- Derives `last_loaded_date` dynamically.
- Filters Day 2 data for new and updated records.
- Uses `left_anti` join logic to remove old versions of updated rows.
- Combines existing and incremental data and overwrites the target.

### `work_given/DemoWidgets_4.ipynb`
- Creates Databricks widgets: combobox, dropdown, multiselect, and text box.
- Reads widget values using `dbutils.widgets.get`.
- Demonstrates notebook parameterization basics.

### `work_given/Delta_Table_And_Operations.ipynb`
- Creates a sample DataFrame and writes it as Delta.
- Reads a Delta table from storage.
- Demonstrates Delta `INSERT`, `UPDATE`, `DELETE`, and `MERGE`.
- Implements UPSERT behavior with `whenMatchedUpdate` and `whenNotMatchedInsert`.
- Shows schema evolution with `mergeSchema`.
- Uses Delta history, time travel with `versionAsOf`, and restore to an older version.

### `delta_table_practise.ipynb`
- Creates order-style sample data and writes it to Delta.
- Appends data with schema merge.
- Reads Delta data back for validation.
- Uses `DeltaTable.update` to modify records.
- Experiments with merge, schema evolution, time travel, and restore.

### `Existing_Pyspark_Code_5.ipynb`
- Reads CSV source data.
- Casts salary to integer.
- Filters salary values greater than `5000`.
- Writes the result to Parquet.
- Documents the conversion strategy: identify source, transformations, actions, and output.

### `End_To_End_Pipeline_6.ipynb`
- Builds a dirty orders dataset with nulls, string amounts, dates, and update scenarios.
- Handles null amounts with default values.
- Casts amount and date columns.
- Adds derived columns such as bonus, category, and amount bucket.
- Applies a custom UDF for bucket classification.
- Renames columns for target structure.
- Creates a second-day incremental dataset.
- Uses anti-join logic to prepare updated/final output.

## DAY3 - Medallion Architecture

### `Medallion_Architecture.ipynb`
- Creates a dirty retail orders dataset with nulls, duplicate records, negative amounts, and updated order records.
- Writes raw data into a Delta-backed Bronze-style layer.
- Reads Bronze data and creates a cleaned Silver layer.
- Casts amount and date columns into correct types.
- Fills missing amount and city values.
- Filters invalid negative amounts.
- Uses `row_number` over a window to keep the latest record per `order_id`.
- Standardizes city values with trimming and title casing.
- Builds Gold-style aggregates:
  - total sales by product
  - total sales by category
  - total sales by city
  - customer order count and total spend
  - top product and top customer insight
- Saves Gold outputs as Delta tables.

## 🧠 Skills Demonstrated

- SQL subqueries and scalar comparison logic
- Common Table Expressions for readable analytics
- PySpark joins across multi-entity datasets
- Null handling, type casting, string cleanup, and invalid-value correction
- Orphan-record validation with `left_anti`
- Full load and incremental load design
- Delta Lake CRUD operations and merge-based UPSERT
- Schema evolution and Delta time travel
- Databricks widgets for parameterized notebooks
- Bronze, Silver, and Gold layer thinking
- Business-ready aggregations and validation summaries

## ✅ Reviewer Quick Scan

For a fast review, open these files first:

1. [DAY1/subqueries_and_ctes.sql](DAY1/subqueries_and_ctes.sql) for advanced SQL logic.
2. [DAY1/day1_week2.ipynb](DAY1/day1_week2.ipynb) for the insurance cleaning, validation, and risk pipeline.
3. [DAY2_WEEK2/work_given/Delta_Table_And_Operations.ipynb](DAY2_WEEK2/work_given/Delta_Table_And_Operations.ipynb) for Delta CRUD, merge, schema evolution, and time travel.
4. [DAY2_WEEK2/End_To_End_Pipeline_6.ipynb](DAY2_WEEK2/End_To_End_Pipeline_6.ipynb) for full pipeline practice.
5. [DAY3/Medallion_Architecture.ipynb](DAY3/Medallion_Architecture.ipynb) for the Bronze/Silver/Gold workflow.

## 👤 Author

**Vivek Sadhu**

Data Engineering Trainee
