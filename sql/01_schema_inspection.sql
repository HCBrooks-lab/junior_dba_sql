-- File: 01_schema_inspection.sql
-- Inspecting database schema and table structure
-- practice.db

-- Tables in database
SELECT name
FROM sqlite_master
WHERE type = 'table';
