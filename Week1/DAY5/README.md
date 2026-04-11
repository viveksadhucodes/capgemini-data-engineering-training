# Day 5 - Regex and String Extraction Practice in SQL

## Objective

Practice robust text extraction techniques in SQL using regular expressions and string functions for semi-structured fields such as IDs, emails, phone numbers, and mixed alphanumeric values.

## Files in This Folder

- `REGEX_PRACTICE.sql` - complete table setup + regex query set
- `README.md` - this documentation

## Dataset Created

`regex_practice` table columns:
- `id`
- `full_text`
- `email`
- `phone`
- `mixed_value`

The script inserts 40 rows with varied patterns, including:
- underscore-delimited and hyphen-delimited IDs
- optional plus-prefixed country codes in phone numbers
- personal and company email domains
- strings containing mixed alphabetic and numeric segments

## Query Coverage (20 tasks)

The file includes targeted extraction exercises such as:
- leading and trailing numeric sequence extraction
- exact one-digit and exact two-digit matching
- first/last character extraction
- numeric sequence between alphabetic boundaries
- email username and domain extraction
- top-level domain extraction
- country code extraction from phone values
- segment extraction between delimiters in `full_text`

## Functions and Patterns Used

- regex functions:
  - `REGEXP_SUBSTR`
  - `REGEXP_REPLACE`
- string functions:
  - `LEFT`
  - `RIGHT`
  - `SUBSTRING_INDEX`
- advanced regex usage:
  - anchors (`^`, `$`)
  - lookahead and lookbehind expressions
  - quantifiers (`{2}`, `+`)

## Practical Relevance

These patterns are directly useful in real pipelines for:
- standardizing contact and ID fields
- deriving domain/country attributes
- preprocessing messy text columns before joins and analytics

## Outcome

Day 5 builds regex confidence for practical data-cleaning scenarios and strengthens SQL readiness for semi-structured text transformation tasks.
