
# 🚀 PySpark Data Engineering: Phase 4 Mini-Project

## 📌 Executive Summary
This project represents the culmination of my transition from SQL-based analysis to **distributed data processing with PySpark**. I engineered a full-scale ETL (Extract, Transform, Load) pipeline designed to convert messy, multi-source raw data into a structured business intelligence report.

---

## 🛠️ What I Built (The Pipeline)
The architecture follows a strict **Medallion-style logic**:

1.  **Ingestion:** Unified data from CSV, JSON, and Parquet formats.
2.  **Cleaning (The Guardrail):** * Filtered out rows with missing `customer_id`.
    * Pruned duplicate entries and handled negative "ghost" transactions.
3.  **Analytics:** Executed 5 core business tasks, including **City-wise Revenue** and **Customer Segmentation** (Gold, Silver, Bronze tiers).
4.  **Persistence:** Exported the final reporting table to a distributed CSV format for downstream stakeholders.

---

## 🚧 Challenges Faced & Solutions

| Challenge | Impact | How I Recovered (Solution) |
| :--- | :--- | :--- |
| **Data Integrity Issues** | Null keys and duplicates were causing "Data Explosion" during joins, leading to incorrect revenue totals. | Implemented a **Pre-Join Validation Layer** using `.dropna()` and `.dropDuplicates()` before any aggregation. |
| **Multi-Format Chaos** | Handling different schemas across JSON and CSV caused type mismatch errors. | Used **Explicit Schema Definition** to ensure all datasets spoke the same language before merging. |
| **Logic Complexity** | Categorizing customers into tiers (Gold/Silver) using standard SQL logic felt clunky in Python. | Leveraged the **PySpark `when/otherwise` functions**, making the business logic more readable and easier to maintain. |
| **Memory Overhead** | Large datasets threatened to slow down the `Top 5 Customers` calculation. | Optimized the pipeline by **filtering early and aggregating often**, reducing the data volume before the final sort. |

---

## 💡 Key Reflections
* **Cleaning is Non-Negotiable:** Phase 4 taught me that joining "dirty" data is the fastest way to lose stakeholder trust.
* **The Power of Scalability:** While SQL is great for small tables, PySpark’s ability to handle partition-based processing makes it the superior choice for modern data volumes.
* **End-to-End Ownership:** Moving from isolated queries (Phase 3) to a full pipeline (Phase 4) provided a holistic view of the Data Engineering lifecycle.

---

## 📈 Technical Stack
* **Language:** Python 3.x
* **Engine:** Apache PySpark
* **Operations:** Filtering, Grouping, Windowing, Data Quality Check
* **Output:** Partitioned CSV Reporting Table
