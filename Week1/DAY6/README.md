# Day 6 - End-to-End Sales Data Pipeline (Core + Advanced)

## Objective

Demonstrate practical data engineering execution from raw transactional records to validated analytical reporting using PySpark and SQL in Databricks notebooks.

This day contains two implementations:
- a compact core workflow (`day6.ipynb`)
- an expanded advanced workflow (`day6_advanced_data.ipynb`)

## Files in This Folder

- `day6.ipynb` - base pipeline with essential cleaning, FK validation, and reporting
- `day6_advanced_data.ipynb` - larger dataset, dealer dimension integration, richer quality control and analytics
- `README.md` - this documentation

## Data Model Coverage

### Core notebook
- `customers(customer_id, name, city)`
- `cars(car_id, brand, model, price)`
- `sales(sale_id, customer_id, car_id, sale_date, quantity)`

### Advanced notebook
- `customers`
- `cars`
- `sales`
- `dealers(dealer_id, name, city)`
- `sales_dealer(sale_id, dealer_id)`

The advanced model enables customer-, car-, and dealer-level reporting in one joined analytical layer.

## Notebook A - `day6.ipynb` (Core)

### Work performed
1. create small source DataFrames with intentional issues
- null customer name
- negative car price
- orphan sales key (`customer_id` without customer match)

2. clean and standardize
- `fillna` for missing names
- `abs(price)` for negative correction

3. enforce referential integrity
- inner joins to create `df_final`
- invalid foreign-key records naturally excluded

4. validate pipeline quality
- `left_anti` checks for unmatched customer/car keys
- reconciliation report using row counts

5. generate analytics
- revenue by customer
- cars sold by brand
- city-level revenue

6. SQL layer
- temp view: `final_sales`
- top models per city (`DENSE_RANK`)
- purchase frequency by customer
- monthly revenue trend
- schema inspection (`DESCRIBE`)

## Notebook B - `day6_advanced_data.ipynb` (Advanced)

### Phase 1: Data cleaning
- null replacement for customer/car fields
- default date handling in sales
- negative price elimination
- string normalization (`trim`)
- duplicate handling (`dropDuplicates` on `sale_id`)

### Phase 2: Quality control
- orphan detection with `left_anti`
- null and duplicate counting
- validation report table (`validation_report_df`)
- percentage-based quality indicators

### Phase 3: Transformations
- multi-table joins (`sales`, `customers`, `cars`, `sales_dealer`, `dealers`)
- conflict-safe renaming of dealer columns (`dealer_name`, `dealer_city`)
- curated joined dataset used for all downstream analysis

### Phase 4: Dealer and customer analytics
PySpark outputs:
- customer spend ranking
- brand-wise sales profile
- city-wise revenue
- dealer revenue table
- top dealer list
- showroom revenue by dealer city

SQL outputs via `final_sales_table`:
- top 3 customers per city
- monthly units and revenue trend
- repeat-customer lifetime value report

## Evidence of Data Engineering Practices

- clean-before-join discipline
- anti-join based key integrity checks
- duplicate control and data quality metrics
- schema conflict management before reporting
- dual-mode analytics (PySpark + SQL)
- reusable temp-view based reporting layer

## Outcome

Day 6 demonstrates clear progression from foundational ETL logic to a broader analytical pipeline with measurable quality controls and multi-dimensional reporting.

For review meetings, this folder serves as direct proof of:
- cleaning strategy,
- validation rigor,
- transformation correctness,
- and analytical output readiness.
