# Data Transformation with PySpark (Phase 2)

### 📌 Project Objective
This project focuses on the **Data Transformation** phase of a data engineering pipeline. Using PySpark, I processed raw datasets—including orders, customers, and order items—to perform complex joins, apply business logic, and generate aggregated insights for data-driven decision-making.

### 🛠️ Tech Stack
* **Language:** Python
* **Framework:** Apache Spark (PySpark)
* **Data Structures:** DataFrames
* **Environment:** Local/Cloud Spark Cluster

---

### 🔄 Data Pipeline & Transformations
The transformation process followed a structured engineering approach:

1. **Data Ingestion:** Loaded datasets (`orders`, `customers`, `order_items`) into PySpark DataFrames.
2. **Data Cleaning:** * Handled missing/null values to ensure aggregation accuracy.
    * Enforced schema consistency by casting data types.
3. **Core Transformations:**
    * **Joins:** Integrated tables using relational keys.
    * **Filtering:** Removed irrelevant or outlier data points.
    * **Aggregations:** Utilized `groupBy()` and `agg()` to calculate metrics such as total revenue per customer and transaction frequency.

---

### 📊 Key Insights & Outputs
The project successfully generated the following deliverables:
* **Customer-Level Aggregates:** A summary of behavior and spending patterns.
* **Transaction Metrics:** A high-level summary of business performance.

> [!TIP]
> Screenshots of the final output can be found in the `/outputs` folder.

---

### 🧠 Challenges & Learnings
* **Join Optimization:** Navigating table relationships and ensuring joins did not result in duplicate records.
* **Data Integrity:** Managing null values early in the pipeline to prevent downstream errors.
* **Scalability:** Learning how PySpark handles large-scale aggregations differently than standard Pandas.

### 📂 Repository Structure
```plaintext
├── solution.py                 # Core PySpark implementation
├── phase2_problem_statement.pdf # Detailed project requirements
├── outputs/                    # Screenshots of transformation results
└── README.md                   # Project documentation
