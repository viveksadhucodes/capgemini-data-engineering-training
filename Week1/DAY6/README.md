# Day 6 - Real-Data Cleaning and Analysis with PySpark + SQL

## Overview

This folder contains my Day 6 hands-on work where I simulated a small real-world sales pipeline in Databricks.
I created customer, car, and sales datasets, cleaned quality issues, validated referential integrity, and produced business-style reports using both PySpark and SQL.

The notebook shows an end-to-end mini workflow:
- build raw datasets
- clean nulls and bad values
- remove invalid foreign-key records using joins
- validate row-level quality metrics
- generate revenue and sales insights

## Files in This Folder

- `day6.ipynb` - Main Databricks notebook containing all PySpark and SQL steps.
- `README.md` - Documentation for what was implemented and why.

## Data Model Used

The notebook creates three in-memory DataFrames:

1. `customers`
- `customer_id`
- `name`
- `city`

2. `cars`
- `car_id`
- `brand`
- `model`
- `price`

3. `sales`
- `sale_id`
- `customer_id`
- `car_id`
- `sale_date`
- `quantity`

This structure is intentionally relational so joins can validate data quality and drive analysis.

## Work Done Step by Step

### 1. Raw Data Setup

I initialized Spark and created sample DataFrames with deliberate quality issues:
- one customer name is `NULL`
- one car price is negative (`-20000`)
- one sales row references a non-existent customer (`customer_id = 99`)

I then converted `sale_date` to proper `DATE` type.

### 2. Data Cleaning

Two cleaning operations were applied:

- Null handling:
  - `customers_cleaned = customers.fillna({"name": "Unknown"})`
  - This ensures customer names are never empty in downstream reporting.

- Negative value correction:
  - `cars_cleaned = cars.withColumn("price", abs(col("price")))`
  - This fixes invalid negative prices.

### 3. Invalid Key Removal (Integrity Cleaning)

I created `df_final` using inner joins:
- `sales` join `customers_cleaned` on `customer_id`
- result join `cars_cleaned` on `car_id`

Because joins are inner joins, rows with invalid foreign keys are automatically dropped.
This removes bad transactional rows before analysis.

### 4. Validation Report

I added anti-join based validation:

- `bad_customer_data`: sales rows with missing customer matches
- `bad_car_data`: sales rows with missing car matches

Then printed a reconciliation summary:
- total raw records
- invalid foreign key records
- final cleaned records

A final check confirms whether:
`total_raw - invalid_fk == final_records`

If true, validation passes.

### 5. Analytical Aggregations (PySpark)

Using `df_final`, I generated:

- Revenue per customer
  - group by `customer_id`, `name`
  - total spend using `SUM(price)`

- Cars sold per brand
  - group by `brand`
  - sales count using `COUNT(car_id)`

- City-wise revenue
  - group by `city`
  - total city revenue using `SUM(price)`

### 6. SQL Layer on Cleaned Data

I created temp view:
- `final_sales`

Then ran SQL reports:

1. Top models by city using window function
- `DENSE_RANK()` partitioned by city
- keeps top 3 models per city

2. Customer purchase frequency
- count purchases per `customer_id`, `name`

3. Monthly revenue and transaction trend
- month-wise `SUM(price)` and `COUNT(sale_id)`

4. Schema inspection
- `DESCRIBE final_sales`

## Key Concepts Practiced

- Data cleaning (`fillna`, value correction)
- Referential integrity checks using joins
- Anti-join based bad-record detection
- Data validation and reconciliation metrics
- Aggregation with `groupBy`, `SUM`, `COUNT`
- Window functions (`DENSE_RANK`) in SQL
- Hybrid PySpark + SQL workflow in Databricks

## Outcome

By the end of Day 6, I built a compact but complete data-quality and reporting pipeline.
The notebook demonstrates how to:
- convert raw transactional data into cleaned analysis-ready data
- verify cleaning impact with measurable counts
- produce business-facing insights from the final curated dataset

## Notes

- The current notebook focuses on null handling, invalid key removal, and value correction.
- Explicit duplicate-removal logic (`dropDuplicates`) is not present in the current cells.
- In one cell, `cars_per_brand` is calculated but `revenue_per_cust` is displayed again; this does not affect saved data but can be adjusted for display accuracy.
