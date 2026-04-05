# 📊 PySpark Data Engineering: Advanced Customer Segmentation

## 📝 Project Overview
This project focuses on **Data Transformation and Feature Engineering** within a PySpark environment. The goal was to take raw, continuous financial transaction data and convert it into meaningful categorical segments. This process, known as **Bucketing**, is essential for targeted marketing, loyalty programs, and risk assessment.

I implemented three distinct methodologies to solve this:
1.  **Fixed-Rule Segmentation** (Business Logic)
2.  **Frequency Analysis** (Aggregation)
3.  **Quantile-Based Bucketing** (Statistical Distribution)

---

## 🏗️ Technical Architecture & Implementation

### 1. The Environment
* **Engine:** PySpark 3.5.5
* **Data Source:** Mock `customers` and `orders` dataframes simulating real-world schema.
* **Key Libraries:** `pyspark.sql.functions` (when, col), `pyspark.sql.Window`.

### 2. Step-by-Step Task Breakdown

#### Task 1: Conditional Logic (Fixed Thresholds)
I created a tiered loyalty system based on specific spending milestones. Using the `when().otherwise()` syntax, I mapped continuous `amount` values to discrete labels.
* **Logic:** * `> 10,000` ➡️ **Gold**
    * `5,000 - 10,000` ➡️ **Silver**
    * `< 5,000` ➡️ **Bronze**

#### Task 2: Distribution Analytics
To understand the "health" of the customer base, I performed a categorical aggregation.
* **Method:** `df.groupBy("segment").count()`
* **Insight:** This allowed me to see if the thresholds were too restrictive or too inclusive.

#### Task 3: Statistical Quantiles (Relative Ranking)
I implemented `approxQuantile` to solve the "static threshold" problem. Instead of choosing a number like $5,000, I asked Spark to find the values that split the population into three equal parts (33rd and 66th percentiles).
* **Result:** This created a "Top/Middle/Bottom" tier system that stays accurate even if the average order value changes over time.

---

## 💻 Code Showcase

```python
# Fixed Logic Implementation
df_segmented = orders.withColumn("segment", 
    when(col("amount") > 10000, "Gold")
    .when((col("amount") >= 5000) & (col("amount") <= 10000), "Silver")
    .otherwise("Bronze")
)

# Statistical Quantile Implementation
thresholds = orders.stat.approxQuantile("amount", [0.33, 0.66], 0)
df_quantiles = orders.withColumn("quantile_segment",
    when(col("amount") <= thresholds[0], "Bottom Tier")
    .when(col("amount") <= thresholds[1], "Middle Tier")
    .otherwise("Top Tier")
)
