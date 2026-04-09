# Day 4 - Real Data Validation and Submission Tracking in Databricks

## Overview

Day 4 focuses on working with real student submission data in Databricks using SQL over CSV files. The goal is to move beyond simple practice queries and build a small validation pipeline that can:

- load raw CSV files into Databricks tables
- clean and standardize incoming records
- map form submissions to students from the master list
- identify valid, missing, invalid, and duplicate submissions
- generate a final report for student activity tracking

This work is implemented primarily in the notebook `day4_real_data.ipynb` and supported by the fill-in assignment file `databricks_student_assignment.sql`.

---

## Files Used for Day 4

### 1. `Capgemini Databricks VITB-2026 (1).csv`
This is the master student list. It contains the core reference data used to identify students.

Important columns visible in the file:

- `REGNO`
- `STUDENT NAME`
- `Branch`
- `College Domain MAILID`
- `Personal Mail ID`

This file acts as the source of truth for student identity.

### 2. `Task 1 (Responses).csv`
This is one task submission file collected from a form. It contains:

- submission timestamp
- email address
- PySpark learning response
- completion status
- GitHub username

This file is used to determine whether a student submitted Task 1.

### 3. `Task 1 file 2.csv`
This is a second submission-related file with similar fields, plus repository link information. It is used as an additional submission source.

Important columns include:

- timestamp
- email address
- completion status
- GitHub username
- repository link

### 4. `day4_real_data.ipynb`
This is the main Databricks notebook for Day 4. It contains the implemented SQL workflow for:

- loading CSV files
- renaming raw columns
- normalizing email addresses
- building email mapping
- validating submissions
- detecting duplicates using window functions
- preparing the final classification report

### 5. `databricks_student_assignment.sql`
This is the student assignment template version of the same problem. It is structured as a step-by-step SQL exercise with blanks to fill in.

It is useful for practice because it clearly separates the workflow into:

- raw loading
- cleaning
- email mapping
- submission mapping
- combining records
- ranking duplicates
- final classification

---

## Business Problem

The main Day 4 problem is:

How do we verify which students actually submitted a task when submissions may come from multiple files and students may use different email addresses or submit more than once?

To solve this, the notebook uses the master student list as the reference and compares incoming task submissions against it.

---

## Day 4 Objective

By the end of this exercise, the pipeline should help answer these questions:

- Which students submitted the task?
- Which students did not submit?
- Which submissions do not match any student in the master file?
- Which students submitted more than once?
- How can we keep only the first valid submission and mark later ones as duplicates?

---

## End-to-End Workflow Implemented in the Notebook

## Step 1: Load raw CSV files into Databricks tables

The notebook first loads each CSV into a Databricks table using `csv.` paths from DBFS or Volumes.

Three raw tables are created:

- `my_csv_table` for the master list
- `my_csv_table1` for `Task 1 (Responses).csv`
- `my_csv_table2` for `Task 1 file 2.csv`

At this stage, columns are still in raw `_c0`, `_c1`, `_c2` format.

## Step 2: Standardize schemas

The next step is to rename raw columns into meaningful names.

Examples from the notebook:

- `_c2 AS REGNO`
- `_c3 AS Student_Name`
- `LOWER(TRIM(_c1)) AS Email_Address`

This step is important because:

- raw headers may not load cleanly
- email fields need normalization before matching
- later joins become readable and reliable

The notebook also filters out accidental header rows such as:

- `Timestamp`
- `Example:`

---

## Step 3: Normalize emails

Email addresses are cleaned using:

```sql
LOWER(TRIM(email_column))
```

This prevents mismatches caused by:

- uppercase vs lowercase emails
- leading spaces
- trailing spaces

Without normalization, the same student could appear as unmatched even when the email is logically the same.

---

## Step 4: Build the email mapping table

The notebook creates an `email_mapping` table from the master dataset:

```sql
CREATE OR REPLACE TABLE email_mapping AS
SELECT DISTINCT
    REGNO AS student_id,
    Student_Name,
    LOWER(TRIM(Email_Address)) AS primary_email,
    Branch
FROM my_csv_table
WHERE Email_Address IS NOT NULL;
```

Purpose of this table:

- connect a student ID to a cleaned email
- make joins easier in later steps
- keep the master list separate from raw form data

### Important implementation note

The current notebook maps students using the master college email column that was renamed to `Email_Address`.

However, the assignment template in `databricks_student_assignment.sql` is designed to support a stronger version of the solution by combining:

- college email
- personal email

That means:

- the current notebook implementation is valid for primary-email matching
- the assignment template points toward a more complete dual-email mapping approach

If extended, the mapping table can be built with a `UNION` of both email columns so student submissions from either address can be matched.

---

## Step 5: Validate matching and create a gold activity view

The notebook creates a consolidated view called `gold_student_activity`:

```sql
CREATE OR REPLACE VIEW gold_student_activity AS
SELECT 
    m.student_id,
    m.Student_Name,
    m.Branch,
    COALESCE(t1.Completed_Status, 'No') AS Task1_Status,
    COALESCE(t2.Repo_Link, 'No Link Provided') AS Github_Repo
FROM email_mapping m
LEFT JOIN my_csv_table1 t1 ON m.primary_email = t1.Email_Address
LEFT JOIN my_csv_table2 t2 ON m.primary_email = t2.Email_Address;
```

Why this is useful:

- it joins master records with submission records
- it gives one business-friendly view for reporting
- it adds default values using `COALESCE`

This is the first "gold-style" reporting layer in the Day 4 workflow.

---

## Step 6: Identify missing, valid, and invalid submissions

### A. Students who did not submit

The notebook uses a `LEFT JOIN` from the master mapping table to the submission table and filters rows where the submission side is null.

This returns students who exist in the master list but do not appear in the task response file.

### B. Valid submissions

The notebook uses an `INNER JOIN` between `email_mapping` and the response table to fetch matched students and their submission details.

This gives the list of accepted or recognized submissions.

### C. Invalid submissions

The notebook checks for emails in the task response file that do not exist in the master mapping table.

These are "ghost" or unmatched records:

- someone used an unexpected email
- someone outside the master list submitted
- the master mapping is incomplete

This is a very important real-world validation pattern in data engineering.

---

## Step 7: Detect duplicates using a window function

One of the most important Day 4 concepts is duplicate detection.

The notebook creates `task_submissions_ranked` using:

```sql
ROW_NUMBER() OVER (
    PARTITION BY m.student_id
    ORDER BY t1.Timestamp ASC
) AS submission_rank
```

This does the following:

- groups rows by student
- orders their submissions by time
- labels the first submission as rank `1`
- labels later submissions as `2`, `3`, and so on

This is better than a simple `GROUP BY` when you need row-level control.

The notebook then creates:

- `first_submissions_only`

This keeps only the earliest submission per student.

---

## Step 8: Final classification report

The final report table is:

- `final_student_report`

It classifies records with logic similar to:

- `Submitted` for the first valid submission
- `Duplicate` for later submissions
- `Not Submitted` for students in the master list with no matching submission
- `Invalid` as a conceptual category for unmatched records

The implemented query currently starts from `email_mapping` and left joins the ranked table, so the report mainly covers students from the master list. Unmatched submission emails are analyzed separately in the invalid-submission query.

This distinction is important:

- `final_student_report` is master-student-centric
- invalid email detection is submission-centric

---

## SQL Concepts Practiced on Day 4

Day 4 is not just about loading CSV files. It combines several practical SQL concepts:

- `CREATE TABLE` from CSV files
- schema cleanup with aliasing
- string cleaning with `LOWER()` and `TRIM()`
- `LEFT JOIN` for missing-record detection
- `INNER JOIN` for valid matches
- `COALESCE()` for default values
- `UNION` as part of the assignment design for multi-email mapping
- `ROW_NUMBER()` window function for duplicate handling
- report-building with `CASE WHEN`

These are core patterns used in real ETL, validation, and audit workflows.

---

## Tables and Views Created During Day 4

Based on the notebook, the following main objects are created:

- `my_csv_table`
- `my_csv_table1`
- `my_csv_table2`
- `email_mapping`
- `gold_student_activity`
- `task_submissions_ranked`
- `first_submissions_only`
- `final_student_report`

Each object represents a different layer:

- raw ingestion
- cleaned mapping
- analytical reporting
- duplicate management

---

## How `databricks_student_assignment.sql` Fits In

The SQL assignment file is a structured practice version of the notebook problem.

It expects the student to implement the following stages:

1. Load the three CSV files into raw tables.
2. Clean college and personal email columns in the master file.
3. Clean submission emails in both task files.
4. Build a unified student-email map.
5. Map all submissions back to student IDs.
6. Combine submission sources into one view.
7. Rank duplicate submissions with a window function.
8. Build a final status table.
9. Write analysis queries for counts, invalid submissions, and multiple-email usage.

So the notebook is the implemented working version, while the SQL file is the guided assignment version.

---

## Expected Outputs from Day 4

After completing the Day 4 workflow, you should be able to produce:

- a clean master student mapping
- a valid-submissions list
- a not-submitted list
- an invalid-email or unmatched-submission list
- a duplicate submission report
- a final student classification table

These outputs are useful for trainers, mentors, and batch coordinators who need to track task completion accurately.

---

## How to Run This in Databricks

## Option 1: Use the notebook

1. Upload the three CSV files to DBFS or a Databricks Volume.
2. Update paths if needed.
3. Open `day4_real_data.ipynb`.
4. Run the cells in order.
5. Inspect the generated tables and views.

## Option 2: Use the assignment SQL file

1. Open `databricks_student_assignment.sql` in a Databricks SQL notebook.
2. Replace the blank placeholders with your paths and SQL expressions.
3. Execute each section step by step.
4. Validate the final output using the analysis queries.

---

## Key Learning Outcomes

By completing Day 4, the main concepts learned are:

- how to load real CSV data into Databricks
- how to clean schema and normalize join keys
- how to compare submission data against a trusted master list
- how to detect unmatched and missing records
- how to handle duplicates using window functions
- how to build a reporting-friendly final table from messy input data

This is one of the first tasks that feels close to real data engineering work because it combines ingestion, cleaning, mapping, validation, and reporting in one flow.

---

## Current Observations and Possible Improvements

The current Day 4 notebook already demonstrates the full reporting flow, but there are some useful improvements that can make it stronger:

- include both college and personal email in the mapping table
- standardize timestamp parsing before ordering duplicate submissions
- merge both submission files into one unified submission table earlier in the pipeline
- include invalid submissions directly in a broader final audit report
- add data quality checks for null emails and duplicate master records

These improvements align closely with the design of `databricks_student_assignment.sql`.

---

## Conclusion

Day 4 is a practical data validation exercise built on real submission data. It shows how Databricks SQL can be used not only for querying data, but also for building a small audit and tracking pipeline.

The main strength of this task is that it teaches an end-to-end workflow:

- ingest
- clean
- map
- validate
- classify
- report

That makes Day 4 an important transition from basic SQL practice to real data engineering thinking.
