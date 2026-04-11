# Day 4 - Real Dataset Reconciliation in Databricks SQL

## Objective

Build a practical SQL workflow for student activity reconciliation by integrating master student data and task submission responses from multiple CSV sources.

## Files in This Folder

- `day4_real_data.ipynb` - main Databricks SQL notebook
- `README.md` - this documentation

## Workflow Implemented in Notebook

The notebook is organized into phased SQL execution blocks (`%sql`) and demonstrates ingestion, normalization, mapping, validation, duplicate handling, and final classification.

### Phase 0 - Ingestion and column standardization
Raw CSV files are loaded into staging tables:
- `my_csv_table`
- `my_csv_table1`
- `my_csv_table2`

Then raw `_c0`, `_c1`, ... columns are renamed into meaningful business columns (registration, student name, branch, email, completion fields, etc.).

### Phase 1 - Unified identity mapping
A canonical mapping table is built:
- `email_mapping`

Key logic:
- normalize email casing and whitespace with `LOWER(TRIM(...))`
- map student identity using `REGNO`, student name, branch, and primary email

### Phase 2 - Data quality validation buckets
The notebook creates actionable validation views/lists:
- missing submissions (students from master with no response)
- valid submissions (responses correctly linked to known students)
- ghost/invalid submissions (response emails not found in mapping)

### Phase 3 - Duplicate attempt detection
A ranked submission table is created:
- `task_submissions_ranked`

Core logic:
- `ROW_NUMBER()` partitioned by student/email timeline
- identifies first submission vs repeated attempts

### Phase 4 - Reporting and classification
Final reporting outputs include:
- repeat-attempt counts per student
- students using multiple emails
- curated gold-style activity view: `gold_student_activity`
- final status table: `final_student_report`
- supporting view: `first_submissions_only`

## Data Engineering Skills Demonstrated

- SQL-based ingestion from external storage paths
- schema normalization and field standardization
- identity resolution using normalized email keys
- missing/invalid record detection via joins
- duplicate behavior analysis with window functions
- final business-friendly reporting table creation

## Outcome

Day 4 demonstrates a real operational workflow similar to production reconciliation tasks:
- unify source systems,
- validate integrity,
- classify records,
- and produce final reporting outputs for tracking and decision-making.

## Notes for Review

- The primary implementation lives entirely in `day4_real_data.ipynb`.
- This folder originally had an empty README; it is now documented end-to-end for review readiness.
