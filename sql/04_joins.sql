-- File: 04_joins.sql
-- JOIN operations across tables
-- practice.db


CREATE TABLE IF NOT EXISTS orders (
  order_id   INTEGER PRIMARY KEY AUTOINCREMENT,
  category   TEXT NOT NULL,
  amount     REAL NOT NULL,
  created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Seeding orders 

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




