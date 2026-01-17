-- Foundational SQL examples supporting analytics and database fundamentals

-- Query 1: Basic Record Retrieval 

SELECT *
FROM example_table;

SELECT *
FROM example_table
WHERE status = 'active';

SELECT COUNT(*) AS total_records
FROM example_table;

SELECT category, COUNT(*) AS category_count
FROM example_table
GROUP BY category;


-- Query 2: Filtered Records

SELECT *
FROM example_table
WHERE status = 'active';


-- Query 3: Category-Level Aggregation

SELECT
    category,
    COUNT(*) AS category_count
FROM example_table
GROUP BY category;


-- Query 4: Sort Records by Date (Descending)

SELECT *
FROM example_table
ORDER BY created_date DESC;


-- Query 4: Sort Records by Category

SELECT *
FROM example_table
ORDER BY category ASC;


-- Query 5: LIMIT (Top-N Analysis)

SELECT
FROM example_table
ORDER BY created_date DESC
LIMIT 10;


-- Query 6: HAVING (Filtering Aggregations)

SELECT
    category
    COUNT(*) AS category_count
FROM example_table
GROUP BY category
HAVING COUNT(*) > 5;
