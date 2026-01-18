-- File: 03_aggregations.sql
-- aggregate functions and GROUP BY
-- practice.db

-- Category-Level Aggregation

SELECT
    category,
    COUNT(*) AS category_count
FROM example_table
GROUP BY category;

