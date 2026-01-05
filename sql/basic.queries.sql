-- Foundational SQL examples supporting analytics and database fundamentals

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
