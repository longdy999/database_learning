# Week 22 — Exam Review Test: Design, Normalization, Advanced SQL, Performance

## Overview
This test covers Months 3-4 material: database design, normalization, advanced SQL techniques, and performance optimization. Use this for exam preparation.

**Time Limit:** 45 minutes
**Total Points:** 15 (1 point each)
**Passing Score:** 12/15 (80%)

---

## Section A: Database Design & Normalization (Questions 1-5)

### Question 1
Explain First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF) in simple terms. Give one example of a violation for each.

### Question 2
Given this table, identify the normalization problems and redesign it:

```
orders(order_id, customer_name, customer_email, customer_phone, product_name, product_price, quantity, order_date)
```

### Question 3
Draw or describe an ERD for a simple library system with: Books, Authors, Members, and Loans. Include cardinality.

### Question 4
What is referential integrity? What happens if you try to delete a parent record that has child records?

### Question 5
Explain the difference between one-to-many and many-to-many relationships. How do you implement a many-to-many relationship in SQL?

---

## Section B: Advanced SQL (Questions 6-10)

### Question 6
Write a subquery that finds all employees who earn more than the average salary in their department.

### Question 7
Create a VIEW called `active_customers` that shows customers who placed an order in the last 30 days.

### Question 8
Write a query using a CTE (Common Table Expression) to find the top 3 departments by total revenue.

### Question 9
Explain the difference between UNION and UNION ALL. When would you use each?

### Question 10
Write a CASE statement that categorizes orders as 'Small' (under $50), 'Medium' ($50-$200), or 'Large' (over $200).


---

## Section C: Performance & Optimization (Questions 11-15)

### Question 11
What is an index? Create an index on the `email` column of the `customers` table. When would this index be useful?

### Question 12
Explain what EXPLAIN does. Write a query with EXPLAIN and describe what you would look for in the output.

### Question 13
What is a database transaction? Write a transaction that transfers $100 from one bank account to another, including error handling with ROLLBACK.

### Question 14
You have a query that takes 30 seconds. List 5 steps you would take to diagnose and fix the performance issue.

### Question 15
Explain the difference between a clustered index and a non-clustered index. When would you use each?

---

## Answer Key

### Section A
1. **1NF:** No repeating groups, atomic values. Violation: storing multiple phone numbers in one column. **2NF:** No partial dependencies (all non-key columns depend on entire PK). Violation: in a composite key table, a column depends on only part of the key. **3NF:** No transitive dependencies. Violation: storing city AND zip code (city depends on zip, not directly on PK).
2. Separate into: `customers(customer_id, name, email, phone)` and `orders(order_id, customer_id, product_id, quantity, order_date)` and `products(product_id, name, price)`.
3. Books(book_id, title, ISBN), Authors(author_id, name), Members(member_id, name), Loans(loan_id, book_id, member_id, loan_date, return_date). Books-Authors: many-to-many. Members-Loans: one-to-many.
4. Referential integrity ensures foreign keys reference valid primary keys. Attempting to delete a parent with children raises an error (or cascades, depending on ON DELETE setting).
5. One-to-many: one customer has many orders. Many-to-many: students and courses (use junction table `student_courses`).

### Section B
6. `SELECT * FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e2.department_id = e.department_id);`
7. `CREATE VIEW active_customers AS SELECT DISTINCT c.* FROM customers c JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_date >= CURRENT_DATE - INTERVAL '30 days';`
8. `WITH dept_revenue AS (SELECT department, SUM(revenue) as total FROM sales GROUP BY department) SELECT * FROM dept_revenue ORDER BY total DESC LIMIT 3;`
9. UNION removes duplicates (slower). UNION ALL keeps all rows (faster). Use UNION ALL when you know there are no duplicates.
10. `SELECT order_id, total, CASE WHEN total < 50 THEN 'Small' WHEN total BETWEEN 50 AND 200 THEN 'Medium' ELSE 'Large' END AS order_size FROM orders;`

### Section C
11. An index is a data structure that speeds up data retrieval. `CREATE INDEX idx_customers_email ON customers(email);` Useful for WHERE, JOIN, and ORDER BY on email.
12. EXPLAIN shows query execution plan. Look for: Seq Scan (slow) vs Index Scan (fast), estimated rows, cost, join methods.
13. `BEGIN; UPDATE accounts SET balance = balance - 100 WHERE id = 1; UPDATE accounts SET balance = balance + 100 WHERE id = 2; COMMIT;` (ROLLBACK on error)
14. Run EXPLAIN ANALYZE, check for missing indexes, optimize JOIN order, reduce SELECT columns, add appropriate indexes.
15. Clustered: physically reorders table data (one per table, usually PK). Non-clustered: separate structure pointing to data (multiple per table, for frequently searched columns).
