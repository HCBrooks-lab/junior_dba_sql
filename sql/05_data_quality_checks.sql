-- File: 05_data_quality_checks.sql
-- Perform basic data validation and integrity checks
-- practice.db


-- 1) Row count (base)
SELECT COUNT(*) AS total_records
FROM example_table;

-- 2) Checking for NULLs 
SELECT COUNT(*) AS records_with_null_required_fields
FROM example_table
WHERE created_at IS NULL
   OR category IS NULL;

-- 3) Check for empty strings (not NULL, bad)
SELECT COUNT(*) AS empty_string_issues
FROM example_table
WHERE category IS NOT NULL
  AND TRIM(category) = '';

-- 4) Duplicate check on primary key
SELECT id, COUNT(*) AS dup_count
FROM example_table
GROUP BY id
HAVING COUNT(*) > 1;

-- 5) Invalid dates: created_at for the future
SELECT COUNT(*) AS future_dates
FROM example_table
WHERE created_at > CURRENT_DATE;

-- 6) Category quality check (flags blanks and placeholders)
SELECT DISTINCT category
FROM example_table
WHERE category IS NULL
   OR TRIM(category) = ''
   OR LOWER(TRIM(category)) IN ('unknown', 'n/a', 'na', 'none', 'null');

-- 7) Category distribution check
SELECT category, COUNT(*) AS category_count
FROM example_table
GROUP BY category
ORDER BY category_count DESC;

-- 8) DISTINCT category review (quick scan)
SELECT DISTINCT category
FROM example_table
ORDER BY category ASC;

-- 9) Recent records sanity check
SELECT *
FROM example_table
WHERE created_at IS NOT NULL
ORDER BY created_at DESC
LIMIT 10;

-- 10) Date range check (min/max)
SELECT
    MIN(created_at) AS min_created_at,
    MAX(created_at) AS max_created_at
FROM example_table
WHERE created_at IS NOT NULL;