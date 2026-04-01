# 🚀 Phase 3: The ETL & Pipeline Mindset

> **One-Line Summary:** Move from writing "isolated queries" to building "structured data flows."

---

## 📌 Core Philosophy
In Phases 1 & 2, we played with "toy data." In Phase 3, we treat data like a raw, messy resource that needs refining. **Data is NOT clean by default.**

---

## 🛠️ The Technical Stack Mapping
Mapping [DB Fiddle](https://www.db-fiddle.com/) queries to [PySpark Online Compiler](https://www.sparkplayground.com/pyspark-online-compiler) logic.

| SQL Concept | PySpark Function | Purpose |
| :--- | :--- | :--- |
| `SELECT` | `.select()` | Picking specific columns |
| `WHERE` | `.filter()` | Removing noise/invalid rows |
| `GROUP BY` | `.groupBy()` | Organizing data for math |
| `SUM / AVG` | `.agg(F.sum())` | Calculating results |
| `JOIN` | `.join()` | Connecting disparate datasets |

---

## 🏗️ The Standard Pipeline (Order of Operations)
To succeed in Phase 3, you must follow this sequence to avoid `AnalysisException` errors:

1.  **Extract:** Load data and run `df.printSchema()`.
2.  **Clean (Crucial):** * Handle Nulls: `df.dropna()`
    * Fix Types: `.cast("int")`
3.  **Filter:** Reduce data size *before* doing heavy work.
4.  **Transform/Join:** Connect your `customers` and `orders`.
5.  **Aggregate:** Calculate your `total_spent` or `avg_sales`.
6.  **Load/Show:** View the final, polished result.

---

## 📝 Practice Log: Customer & Order Analysis
This aligns with the [Core Learning Objective of Phase 3](file:///C:/Users/vivek/AppData/Local/Packages/5319275A.WhatsAppDesktop_cv1g1gvanyjgm/LocalState/sessions/C91ECFDD400992A513D3D8A03316D0F4F020F980/transfers/2026-14/Core%20Learning%20Objective%20of%20Phase%203.pdf):

### ⚡ Task 1: Filtered Selection
* **Goal:** Find customers in Hyderabad.
* **Key Learning:** Column names must match exactly (e.g., `name` vs `customer_name`).

### ⚡ Task 2: Aggregation with Filter
* **Goal:** Total spent per customer (where amount > 2000).
* **Key Learning:** **Filter BEFORE Aggregation** for better performance.

### ⚡ Task 3: The Inner Join
* **Goal:** Combine Order IDs with Customer Names.
* **Key Learning:** **Schema Awareness.** Know which table owns which column (e.g., `order_amount` vs `amount`).

---

## 🚨 Phase 3 Troubleshooting Checklist
If your code fails, check these three things immediately:
- [ ] **Name Check:** Did I name the column `amount` or `order_amount`?
- [ ] **Action Check:** Did I forget to add `.show()` at the end?
- [ ] **Import Check:** Did I include `from pyspark.sql import functions as F`?

---

## ✅ Post-Phase 3 Goals
- [ ] I can take raw, messy data and process it.
- [ ] I understand why cleaning happens before joining.
- [ ] I can explain the difference between a SQL row and a PySpark DataFrame transformation.
