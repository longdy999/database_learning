# Week 21 — Exam Review Test: Fundamentals, SELECT, JOINs, Aggregation

## Overview
This test covers Months 1-2 material: database fundamentals, basic SELECT queries, JOIN operations, and aggregate functions. Use this as exam preparation.

**Time Limit:** 45 minutes
**Total Points:** 15 (1 point each)
**Passing Score:** 12/15 (80%)

---

## Section A: Database Fundamentals (Questions 1-5)

### Question 1
What is the difference between a primary key and a foreign key? Give one example of each.

### Question 2
Name three common data types used in SQL and explain when you would use each one.

### Question 3
What does NULL mean in a database? Is NULL the same as zero or an empty string? Explain why or why not.

### Question 4
Explain the difference between DELETE and TRUNCATE. When would you use each?

### Question 5
What are constraints in a database? Name at least three types and explain their purpose.

---

## Section B: SELECT Queries (Questions 6-10)

### Question 6
Write a SELECT statement that retrieves all customers from Cambodia who registered after January 1, 2024, ordered by registration date (newest first).

### Question 7
Write a query using LIKE to find all products whose name contains the word "Premium".

### Question 8
What is the difference between WHERE and HAVING? Write one example of each.

### Question 9
Write a query that returns the top 5 most expensive products, showing only product_name and price.

### Question 10
Explain what DISTINCT does. Write a query that finds all unique cities from a customers table.


---

## Section C: JOINs and Aggregation (Questions 11-15)

### Question 11
Write a query using INNER JOIN to show all orders with customer names, joining the `orders` and `customers` tables.

### Question 12
Write a LEFT JOIN query that shows ALL customers and their orders (including customers with no orders).

### Question 13
Write a query using GROUP BY and COUNT to find how many orders each customer has placed. Include customers with zero orders.

### Question 14
Write a query that finds the total revenue per product category using SUM and GROUP BY. Only show categories with total revenue over $1000.

### Question 15
Explain the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN. Draw or describe what each returns.

---

## Answer Key

### Section A
1. **Primary key** uniquely identifies each row (e.g., `customer_id`). **Foreign key** references a primary key in another table (e.g., `orders.customer_id` → `customers.customer_id`).
2. INTEGER (whole numbers, IDs), VARCHAR (variable text, names), DATE (dates, registration_date).
3. NULL means "unknown/no value." It is NOT zero or empty string. NULL = NULL is false in SQL.
4. DELETE removes specific rows (can use WHERE, logged, can rollback). TRUNCATE removes ALL rows (faster, less logging, resets identity).
5. Constraints enforce data rules: NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT.

### Section B
6. `SELECT * FROM customers WHERE country = 'Cambodia' AND registration_date > '2024-01-01' ORDER BY registration_date DESC;`
7. `SELECT * FROM products WHERE product_name LIKE '%Premium%';`
8. WHERE filters rows before grouping. HAVING filters groups after GROUP BY.
9. `SELECT product_name, price FROM products ORDER BY price DESC LIMIT 5;`
10. DISTINCT removes duplicates: `SELECT DISTINCT city FROM customers;`

### Section C
11. `SELECT o.*, c.customer_name FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;`
12. `SELECT c.customer_name, o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;`
13. `SELECT c.customer_name, COUNT(o.order_id) FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_name;`
14. `SELECT category, SUM(price * quantity) AS total_revenue FROM order_items oi JOIN products p ON oi.product_id = p.product_id GROUP BY category HAVING SUM(price * quantity) > 1000;`
15. INNER: only matching rows. LEFT: all left + matching right. RIGHT: all right + matching left. FULL OUTER: all rows from both tables.
