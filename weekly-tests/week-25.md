# Week 25 — Final Exam Practice: 30 Mixed Questions

## Overview
This is a comprehensive practice exam covering all 6 months of material. It includes multiple choice, SQL writing, and database design questions.

**Time Limit:** 90 minutes
**Total Points:** 30 (1 point each)
**Passing Score:** 24/30 (80%)

---

## Section A: Multiple Choice (Questions 1-10)

### Question 1
Which normal form eliminates repeating groups?
- A) 1NF
- B) 2NF
- C) 3NF
- D) BCNF

### Question 2
What type of JOIN returns all rows from the left table and matching rows from the right table?
- A) INNER JOIN
- B) LEFT JOIN
- C) RIGHT JOIN
- D) CROSS JOIN

### Question 3
Which clause is used to filter groups created by GROUP BY?
- A) WHERE
- B) HAVING
- C) FILTER
- D) GROUP FILTER

### Question 4
What does an INDEX primarily improve?
- A) INSERT speed
- B) SELECT speed
- C) DELETE speed
- D) UPDATE speed

### Question 5
Which keyword prevents duplicate rows in query results?
- A) UNIQUE
- B) DISTINCT
- C) DIFFERENT
- D) SINGLE


### Question 6
Which constraint ensures a column cannot have NULL values?
- A) UNIQUE
- B) NOT NULL
- C) CHECK
- D) DEFAULT

### Question 7
In a one-to-many relationship, where is the foreign key placed?
- A) In the "one" side table
- B) In the "many" side table
- C) In both tables
- D) In a junction table

### Question 8
What does ACID stand for in database transactions?
- A) Add, Create, Insert, Delete
- B) Atomicity, Consistency, Isolation, Durability
- C) Access, Control, Identity, Data
- D) Aggregate, Count, Index, Design

### Question 9
Which aggregate function counts only non-NULL values?
- A) COUNT(*)
- B) COUNT(column_name)
- C) SUM(column_name)
- D) TOTAL(column_name)

### Question 10
What is the purpose of a VIEW?
- A) To store data permanently
- B) To create a virtual table from a query
- C) To speed up INSERT operations
- D) To replace indexes

---

## Section B: SQL Writing (Questions 11-20)

### Question 11
Write a query to find all customers who have never placed an order (use LEFT JOIN).

### Question 12
Write a query using GROUP BY to show total revenue per month for 2024.

### Question 13
Create a CTE that ranks products by sales volume, then select only the top 10.

### Question 14
Write an UPDATE statement that increases the price of all books in the 'Fiction' category by 10%.

### Question 15
Write a query with a subquery to find departments where average salary exceeds company average.


### Question 16
Create a VIEW that shows a customer order summary: customer name, total orders, total spent.

### Question 17
Write a transaction that inserts a new order and its order items atomically.

### Question 18
Write a query using window functions (ROW_NUMBER or RANK) to rank customers by total spending.

### Question 19
Write a DELETE statement that removes all orders older than 2 years, ensuring referential integrity.

### Question 20
Create an index to optimize this query: `SELECT * FROM orders WHERE customer_id = 5 AND order_date > '2024-01-01';`

---

## Section C: Database Design (Questions 21-30)

### Question 21
Design a schema for a hotel booking system. Include at least 4 tables with relationships.

### Question 22
Normalize this table to 3NF:
```
student_courses(student_name, student_email, course_name, instructor_name, instructor_email, grade)
```

### Question 23
Write CHECK constraints for: (a) age must be 18+, (b) email must contain '@', (c) status must be 'active' or 'inactive'.

### Question 24
Design a many-to-many relationship between Products and Tags. Write the CREATE TABLE statements.

### Question 25
What is database denormalization? Give one scenario where it would be appropriate.

### Question 26
Write an ERD description (tables and relationships) for an e-commerce system with users, products, orders, and reviews.

### Question 27
Create a stored procedure that accepts a customer_id and returns their order history.

### Question 28
Write a backup strategy document outline for a production database (3-5 key points).

### Question 29
Explain the CAP theorem in 2-3 sentences. Which two properties would you choose for a banking system?

### Question 30
Design an audit table that logs all changes (INSERT, UPDATE, DELETE) to the customers table.


---

## Answer Key

### Section A (Multiple Choice)
1. **A** — 1NF eliminates repeating groups
2. **B** — LEFT JOIN returns all left rows
3. **B** — HAVING filters groups
4. **B** — Indexes primarily improve SELECT speed
5. **B** — DISTINCT prevents duplicates
6. **B** — NOT NULL prevents null values
7. **B** — Foreign key goes on the "many" side
8. **B** — Atomicity, Consistency, Isolation, Durability
9. **B** — COUNT(column_name) skips NULLs
10. **B** — A VIEW is a virtual table from a query

### Section B (SQL Writing — Key Answers)
11. `SELECT c.* FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.order_id IS NULL;`
12. `SELECT DATE_TRUNC('month', order_date) AS month, SUM(total) AS revenue FROM orders WHERE order_date >= '2024-01-01' GROUP BY DATE_TRUNC('month', order_date) ORDER BY month;`
13. `WITH ranked AS (SELECT product_name, SUM(quantity) as total_sold, RANK() OVER (ORDER BY SUM(quantity) DESC) as rank FROM order_items GROUP BY product_name) SELECT * FROM ranked WHERE rank <= 10;`
14. `UPDATE books SET price = price * 1.10 WHERE category = 'Fiction';`
15. `SELECT department FROM employees GROUP BY department HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);`
16. `CREATE VIEW v_customer_summary AS SELECT c.customer_name, COUNT(o.order_id) AS total_orders, COALESCE(SUM(o.total), 0) AS total_spent FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_name;`
17. `BEGIN; INSERT INTO orders (customer_id, order_date, total) VALUES (1, CURRENT_DATE, 99.99); INSERT INTO order_items (order_id, product_id, quantity) VALUES (currval('orders_id_seq'), 5, 2); COMMIT;`
18. `SELECT customer_name, SUM(total) AS total_spent, RANK() OVER (ORDER BY SUM(total) DESC) AS spending_rank FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY customer_name;`
19. `DELETE FROM order_items WHERE order_id IN (SELECT order_id FROM orders WHERE order_date < CURRENT_DATE - INTERVAL '2 years'); DELETE FROM orders WHERE order_date < CURRENT_DATE - INTERVAL '2 years';`
20. `CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);`

### Section C (Design — Key Points)
21. Hotel: `rooms(room_id, type, price)`, `guests(guest_id, name)`, `bookings(booking_id, room_id, guest_id, check_in, check_out)`, `payments(payment_id, booking_id, amount)`
22. Split into: `students(student_id, name, email)`, `courses(course_id, name)`, `instructors(instructor_id, name, email)`, `enrollments(student_id, course_id, instructor_id, grade)`
23. `CHECK (age >= 18)`, `CHECK (email LIKE '%@%')`, `CHECK (status IN ('active', 'inactive'))`
24. `products(product_id, name)`, `tags(tag_id, name)`, `product_tags(product_id, tag_id, PRIMARY KEY(product_id, tag_id))`
25. Denormalization adds redundancy for read performance. Example: storing `total_orders` in customers table to avoid counting every time.
26-30. See detailed design guidelines in course materials.
