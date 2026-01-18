/*
===============================================================
FILE: 00_all_queries_ref.sql
PURPOSE: SQL SYNTAX & PATTERN REFERENCE ONLY

This file is NOT meant to be executed.
All runnable queries are located in files 01–06.

This file serves as:
- A personal SQL syntax reference
- A quick lookup for common query patterns
- A learning artifact

===============================================================
*/




-- Foundational SQL examples supporting analytics and database fundamentals

-- Basic Record Retrieval 
-- ------------------------------------------------------------
SELECT *
FROM example_table;

SELECT *
FROM example_table
WHERE status = 'active';

SELECT COUNT(*) AS total_records
FROM example_table;


-- Filtered Records
-- ------------------------------------------------------------
SELECT *
FROM example_table
WHERE status = 'active';


-- Category-Level Aggregation
-- ------------------------------------------------------------
SELECT
    category,
    COUNT(*) AS category_count
FROM example_table
GROUP BY category;


-- JOINS
-- 1) Creating table
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders (
  order_id   INTEGER PRIMARY KEY AUTOINCREMENT,
  category   TEXT NOT NULL,
  amount     REAL NOT NULL,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- 2) Seeding orders
INSERT INTO orders (category, amount)
SELECT 'Retail', 29.99
WHERE NOT EXISTS (SELECT 1 FROM orders);

INSERT INTO orders (category, amount)
SELECT 'Retail', 12.50
WHERE NOT EXISTS (SELECT 1 FROM orders);

INSERT INTO orders (category, amount)
SELECT 'Healthcare', 75.00
WHERE NOT EXISTS (SELECT 1 FROM orders);

INSERT INTO orders (category, amount)
SELECT 'Technology', 199.99
WHERE NOT EXISTS (SELECT 1 FROM orders);



-- INNER JOIN: matching categories
-- ------------------------------------------------------------
SELECT
    e.category,
    e.status,
    o.amount,
    o.created_at
FROM example_table e
INNER JOIN orders o
    ON e.category = o.category;

-- LEFT JOIN: all example_table rows
SELECT
    e.category,
    e.status,
    o.amount
FROM example_table e
LEFT JOIN orders o
    ON e.category = o.category;

-- Aggregation after JOIN
SELECT
    e.category,
    COUNT(e.id)        AS example_count,
    COUNT(o.order_id)  AS order_count,
    ROUND(AVG(o.amount), 2) AS avg_order_amount
FROM example_table e
LEFT JOIN orders o
    ON e.category = o.category
GROUP BY e.category;



-- Data Quality Checks
-- 1) Row count (base)
-- ------------------------------------------------------------
SELECT COUNT(*) AS total_records
FROM example_table;

-- 2) Checking for NULLs
SELECT COUNT(*) AS records_with_null_required_fields
FROM example_table
WHERE created_at IS NULL
   OR category IS NULL;

-- 3) Checking for empty strings (not NULL, bad)
SELECT COUNT(*) AS empty_string_issues
FROM example_table
WHERE category IS NOT NULL
  AND TRIM(category) = '';

-- 4) Duplicate check on primary key
SELECT id, COUNT(*) AS dup_count
FROM example_table
GROUP BY id
HAVING COUNT(*) > 1;

-- 5) Invalid dates: created_at for future
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

-- 8) DISTINCT category review 
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



-- Exploratory patterns
-- 1) Sort records by date (most recent)
-- ------------------------------------------------------------
SELECT *
FROM example_table
ORDER BY created_at DESC;


-- 2) Sort records by category (A-Z)
SELECT *
FROM example_table
ORDER BY category ASC;


-- 3) Top-N most recent records
SELECT *
FROM example_table
WHERE created_at IS NOT NULL
ORDER BY created_at DESC
LIMIT 10;


-- 4) Categories with 5+ records (HAVING)
SELECT
    category,
    COUNT(*) AS category_count
FROM example_table
WHERE category IS NOT NULL
  AND TRIM(category) <> ''
GROUP BY category
HAVING COUNT(*) > 5
ORDER BY category_count DESC, category ASC;
