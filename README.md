# Junior DBA SQL Practice

## Purpose of This Project
This repository demonstrates hands-on practice with SQL and relational database fundamentals commonly expected of a Junior DBA or entry-level data professional.

The focus is on understanding database structure, writing readable and maintainable queries, and working with a real SQLite database file rather than isolated SQL snippets.

---

## Project Context
This project was created to strengthen my understanding of how databases are structured, queried, validated, and maintained in support of analytics and reporting.  
It emphasizes practical SQL usage, data quality awareness, and clear organization aligned with real-world workflows.

---

## Skills Demonstrated
- Relational database design awareness
- SQL querying (SELECT, WHERE, GROUP BY, HAVING, JOIN)
- Working with SQLite databases
- Data quality validation and sanity checks
- Query organization and documentation
- Understanding table relationships and keys
- Basic database administration concepts
- Version control for database-related work

---

## Focus Areas
- Relational database fundamentals
- Writing clear, well-documented SQL queries
- Filtering, aggregations, and joins
- Data quality and integrity checks
- Query readability and maintainability
- Understanding analytics-supporting database workflows

---

## Technologies
- SQLite (local practice database)
- SQL (ANSI-style with SQLite compatibility)
- T-SQL concepts (applied conceptually)
- DB Browser for SQLite
- Git & GitHub for version control

---

## Repository Structure
This repository is organized by SQL concept and workflow stage.
`
sql/
├── 00_all_queries_ref.sql # Non-executable SQL reference & pattern library
├── 02_basic_selects.sql # Foundational SELECT queries and filters
├── 03_aggregations.sql # GROUP BY and aggregation examples
├── 04_joins.sql # INNER and LEFT JOIN examples
├── 05_data_quality_checks.sql # Data validation and integrity checks
├── 06_exploratory_patterns.sql # Sorting, LIMIT, and HAVING patterns
`

* Files `01–06` are intended to be runnable and self-contained.  
*`00_all_queries_ref.sql` is explicitly a reference-only file and not meant to be executed.

---

## How to Use This Repository
- Each SQL file is self-contained and focused on a specific concept.
- Queries include comments explaining intent and logic.
- Files are designed to be read independently or sequentially.
- The SQLite database (`practice.db`) is used locally for hands-on execution.

---

## Notes
All examples are intended for learning and demonstration purposes.  
Queries prioritize clarity and correctness over production optimization and are structured to reflect junior-level database and analytics readiness.


