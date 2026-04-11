# Day 6 - Sales Data Engineering Pipeline (Core + Advanced)

## Overview

Day 6 captures a full practical progression from a small prototype pipeline to an advanced multi-table analytical workflow in Databricks (PySpark + SQL).

This folder now contains two notebook implementations:
- `day6.ipynb` - core pipeline (compact and concept-focused)
- `day6_advanced_data.ipynb` - scaled and more production-style workflow with dealer analytics and richer validation

The goal is consistent across both notebooks:
1. ingest raw transactional data,
2. clean and validate it,
3. enforce relational integrity,
4. generate business-ready analytical outputs.

---

## Files in This Folder

- `day6.ipynb`
  - first implementation of cleaning + validation + reporting flow
- `day6_advanced_data.ipynb`
  - expanded implementation with larger sample data, dealer dimension integration, and deeper analytics
- `README.md`
  - this documentation

---

## Data Entities Used

### Core notebook (`day6.ipynb`)
- `customers(customer_id, name, city)`
- `cars(car_id, brand, model, price)`
- `sales(sale_id, customer_id, car_id, sale_date, quantity)`

### Advanced notebook (`day6_advanced_data.ipynb`)
- `customers`
- `cars`
- `sales`
- `dealers(dealer_id, name, city)`
- `sales_dealer(sale_id, dealer_id)`

This creates a stronger star-like analytical model where each sale can be analyzed by customer, car, and dealer dimensions.

---

## Notebook 1: `day6.ipynb` (Core Flow)

### Phase A - Raw setup and issue simulation
The notebook creates small in-memory datasets with intentional quality issues:
- null customer name
- negative car price
- orphan sale record with unmatched customer key

### Phase B - Cleaning
Implemented cleaning steps:
- fill null customer names (`Unknown`)
- convert negative prices to positive (`abs(price)`)

### Phase C - Integrity filtering
- inner joins are used to build `df_final`
- invalid foreign-key records are removed automatically during join

### Phase D - Validation
- left anti joins identify unmatched rows
- reconciliation metrics are printed:
  - total raw records
  - invalid foreign-key records
  - final cleaned records
- count check validates pipeline consistency

### Phase E - Analytics
PySpark aggregations:
- customer-wise total spend
- brand-wise sales count
- city-wise revenue

SQL analytics via temp view `final_sales`:
- top models per city using `DENSE_RANK()`
- purchase frequency by customer
- monthly revenue and transaction trend
- schema inspection (`DESCRIBE final_sales`)

---

## Notebook 2: `day6_advanced_data.ipynb` (Advanced Flow)

This notebook extends the core logic with larger synthetic data, additional dimensions, and richer reporting.

### Phase 1 - Data cleaning
Implemented line-by-line cleaning operations include:
- null handling for customer and car attributes
- default value imputation for missing fields
- date standardization on `sale_date`
- negative price correction using absolute value
- string normalization using `trim()`
- duplicate removal on `sale_id`

### Phase 2 - Quality control and validation report
Validation logic includes:
- orphan detection with `left_anti` joins
  - sales with invalid customers
  - sales with invalid cars
- null counts and duplicate counts
- summarized validation DataFrame (`validation_report_df`)
- percentage contribution per quality check

This creates a measurable quality-control layer before business reporting.

### Phase 3 - Transformations and dimensional joins
- joins `sales`, `customers`, `cars`, `sales_dealer`, and `dealers`
- resolves column ambiguity by renaming dealer `name`/`city` fields (`dealer_name`, `dealer_city`)
- produces curated joined dataset for analysis

### Phase 4 - Business analytics
PySpark analyses:
- customer lifetime spend ranking
- brand-wise distinct cars sold
- city-wise revenue
- dealer revenue by dealer and top dealers
- dealer city contribution (`showroom_revenue`)

SQL analyses from temp view `final_sales_table`:
- top 3 customers per city (`DENSE_RANK`)
- monthly sales volume and revenue trend
- repeat customer and lifetime value report

---

## Engineering Practices Demonstrated

- clean-before-join discipline
- anti-join based orphan record detection
- explicit duplicate control
- schema-safe joins with renamed conflicting columns
- layered analytics (PySpark + SQL on temp views)
- validation-first mindset with quantifiable data quality checks

---

## Key Outcomes

By the end of Day 6, the work demonstrates both:
- a foundational data engineering pattern (`day6.ipynb`), and
- an advanced analytical pipeline with broader business context (`day6_advanced_data.ipynb`).

This progression shows practical readiness for real ETL/reporting tasks:
- handling imperfect data,
- validating correctness,
- producing stakeholder-friendly metrics.

---

## Reviewer Quick Start

1. Open `day6.ipynb` to understand the base cleaning and validation lifecycle.
2. Open `day6_advanced_data.ipynb` to see how the same logic scales with added dimensions and richer analytics.
3. Compare final SQL sections in both notebooks to see evolution from basic reporting to advanced customer/dealer insights.
