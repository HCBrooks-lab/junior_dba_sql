-- File: 03_exploratory_patterns.sql
-- Exploration + common SQL patterns (sorting, top-N, HAVING)

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
