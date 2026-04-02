# Phase 3A: Data Quality & Cleaning Challenge

## 📌 Project Overview
This project focuses on the "Data Cleaning" stage of a Data Engineering pipeline using **PySpark**. In real-world scenarios, raw data is often "dirty"—containing nulls, duplicates, and logical errors. This challenge demonstrates how to identify and fix these issues to ensure accurate downstream analysis.

## 🛠️ Tech Stack
* **Language:** Python
* **Framework:** PySpark
* **Concepts:** Data Imputation, Deduplication, Filtering, and Aggregation

## 🔍 Identified Data Issues
Based on the initial messy dataset, the following problems were identified:
* **Missing Identifiers:** One record had a `null` for `customer_id`.
* **Missing Information:** Missing `name` and `city` entries.
* **Redundancy:** Duplicate records for "Meena" (ID 4).
* **Logical Error:** "John" has an age of `-5`, which is invalid for demographic data.

## 🚀 Implementation Logic
The cleaning process followed these steps:
1. **Remove Null Keys:** Eliminated rows where `customer_id` was missing.
2. **Remove Duplicates:** Used `.dropDuplicates()` to ensure unique records.
3. **Impute Values:** Replaced missing names with `"Guest"` and missing cities with `"Unknown"`.
4. **Range Validation:** Filtered the data to ensure `age > 0`.

## 💻 PySpark Code Snippet
```python
# Initializing cleaning steps
df_cleaned = df.filter(col("customer_id").isNotNull()) \
               .dropDuplicates() \
               .fillna({"city": "Unknown", "name": "Guest"}) \
               .filter(col("age") > 0)

# Validate results
df_cleaned.show()
