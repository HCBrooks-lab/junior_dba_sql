-- File: 02_basic_selects.sql
-- Practice basic SELECT queries and filtering
-- practice.db



-- Basic Record Retrieval 

SELECT *
FROM example_table;

SELECT *
FROM example_table
WHERE status = 'active';

SELECT COUNT(*) AS total_records
FROM example_table;


