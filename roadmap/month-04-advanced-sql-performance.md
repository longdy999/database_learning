# Month 4: Advanced SQL & Performance

## Theme
Writing powerful queries and understanding database performance.

## Duration
**Days 91–120** (4 weeks + 2 review days)

---

## Monthly Goals

By the end of Month 4, you will:

1. Write subqueries confidently (nested SELECT, correlated, EXISTS, IN)
2. Create and manage views for reusable query logic
3. Use Common Table Expressions (CTEs) for readable complex queries
4. Understand indexes and how they improve query performance
5. Use transactions to ensure data integrity (ACID principles)
6. Read and interpret EXPLAIN output to diagnose slow queries
7. Write stored procedures for basic automation
8. Communicate performance concepts clearly to clients

---

## Skills to Master

| Skill | Level Before | Level After | Priority |
|-------|-------------|-------------|----------|
| Subqueries (nested SELECT) | Beginner | Intermediate | High |
| Correlated subqueries | None | Intermediate | High |
| EXISTS and IN operators | Beginner | Intermediate | High |
| Views (CREATE VIEW) | None | Intermediate | High |
| Common Table Expressions (CTEs) | None | Intermediate | High |
| Temporary tables | None | Intermediate | Medium |
| Indexes (CREATE INDEX) | None | Intermediate | High |
| Query performance (EXPLAIN) | None | Intermediate | High |
| Transactions (BEGIN, COMMIT, ROLLBACK) | None | Intermediate | High |
| ACID principles | None | Intermediate | High |
| Stored procedures basics | None | Beginner+ | Medium |
| Query optimization thinking | None | Intermediate | High |

---

## Week-by-Week Plan

---

### Week 13 (Days 91–97): Subqueries

**Focus:** Nested SELECT statements, EXISTS, IN subqueries, and correlated subqueries


| Day | Topic | Focus |
|-----|-------|-------|
| 91 | Introduction to subqueries | What is a subquery, WHERE clause subqueries |
| 92 | Scalar subqueries | Subqueries that return a single value |
| 93 | IN subqueries | Filtering with subquery result sets |
| 94 | EXISTS subqueries | Checking for existence of related rows |
| 95 | Correlated subqueries | Subqueries that reference the outer query |
| 96 | Subquery vs JOIN comparison | When to use each approach |
| 97 | Weekly review & test | Checkpoint + mini test for Week 13 |

**Key SQL Examples:**

```sql
-- Nested SELECT in WHERE clause
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- IN subquery
SELECT product_name
FROM products
WHERE category_id IN (SELECT id FROM categories WHERE active = true);

-- EXISTS subquery
SELECT c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.id
);

-- Correlated subquery
SELECT e.name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary) FROM employees
    WHERE department_id = e.department_id
);
```

**Khmer Explanation:**
សាប់ឃ្វេរី (Subquery) គឺជា SELECT statement មួយដែលស្ថិតនៅក្នុង SELECT statement មួយទៀត។
វាអនុញ្ញាតឱ្យអ្នកប្រើលទ្ធផលនៃ query មួយជា input សម្រាប់ query មួយទៀត។


---

### Week 14 (Days 98–104): Views, CTEs, and Temporary Tables

**Focus:** Creating reusable query logic with views, writing readable complex queries with CTEs, and using temporary tables for intermediate results.

| Day | Topic | Focus |
|-----|-------|-------|
| 98 | Introduction to Views | CREATE VIEW, using views like tables |
| 99 | Updating and managing views | ALTER VIEW, DROP VIEW, updatable views |
| 100 | Introduction to CTEs | WITH clause, recursive vs non-recursive |
| 101 | Multiple CTEs | Chaining CTEs, CTE vs subquery comparison |
| 102 | Recursive CTEs | Hierarchical data, org charts, category trees |
| 103 | Temporary tables | CREATE TEMP TABLE, session scope, use cases |
| 104 | Weekly review & test | Checkpoint + mini test for Week 14 |

**Key SQL Examples:**

```sql
-- Creating a View
CREATE VIEW active_customers AS
SELECT c.id, c.name, c.email, COUNT(o.id) AS total_orders
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE c.status = 'active'
GROUP BY c.id, c.name, c.email;

-- Using the View
SELECT * FROM active_customers WHERE total_orders > 5;

-- Common Table Expression (CTE)
WITH monthly_sales AS (
    SELECT DATE_TRUNC('month', order_date) AS month,
           SUM(total_amount) AS revenue
    FROM orders
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT month, revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue
FROM monthly_sales;
```


```sql
-- Recursive CTE (org chart example)
WITH RECURSIVE org_tree AS (
    SELECT id, name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.id, e.name, e.manager_id, ot.level + 1
    FROM employees e
    JOIN org_tree ot ON e.manager_id = ot.id
)
SELECT * FROM org_tree ORDER BY level, name;

-- Temporary Table
CREATE TEMPORARY TABLE temp_high_value_orders AS
SELECT * FROM orders WHERE total_amount > 1000;
```

**Khmer Explanation:**
View គឺជា query ដែលរក្សាទុកដូចជា table និម្មិត។ CTE គឺជាវិធីសរសេរ query ស្មុគស្មាញឱ្យងាយអាន។
Temporary table គឺជា table បណ្តោះអាសន្នដែលមានអាយុកាលតែក្នុង session បច្ចុប្បន្ន។

---

### Week 15 (Days 105–111): Indexes, Query Performance, and EXPLAIN

**Focus:** Understanding how indexes work, creating effective indexes, reading EXPLAIN plans, and optimizing slow queries.

| Day | Topic | Focus |
|-----|-------|-------|
| 105 | Introduction to indexes | What indexes are, B-tree basics, why they matter |
| 106 | Creating indexes | CREATE INDEX, single vs composite indexes |
| 107 | Index types | B-tree, Hash, GIN, GiST (overview) |
| 108 | EXPLAIN and EXPLAIN ANALYZE | Reading query execution plans |
| 109 | Identifying slow queries | Sequential scan vs index scan, common bottlenecks |
| 110 | Query optimization techniques | Rewriting queries, avoiding full table scans |
| 111 | Weekly review & test | Checkpoint + mini test for Week 15 |


**Key SQL Examples:**

```sql
-- Creating a single-column index
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Creating a composite index
CREATE INDEX idx_orders_date_status ON orders(order_date, status);

-- Unique index
CREATE UNIQUE INDEX idx_users_email ON users(email);

-- Using EXPLAIN to see query plan
EXPLAIN SELECT * FROM orders WHERE customer_id = 42;

-- EXPLAIN ANALYZE (actually runs the query)
EXPLAIN ANALYZE
SELECT c.name, COUNT(o.id)
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.order_date > '2024-01-01'
GROUP BY c.name;

-- Dropping an index
DROP INDEX idx_orders_customer_id;
```

**Khmer Explanation:**
Index គឺជារចនាសម org ទិន្នន័យពិសេសដែលជួយឱ្យ database រកទិន្នន័យបានលឿន។
EXPLAIN បង្ហាញផែនការដែល database ប្រើដើម្បីដំណើរការ query របស់អ្នក។
បើគ្មាន index ទេ database ត្រូវស្កេន row ទាំងអស់ (sequential scan) ដែលយឺតណាស់។

---

### Week 16 (Days 112–118): Transactions, ACID, and Stored Procedures Basics

**Focus:** Ensuring data integrity with transactions, understanding ACID properties, and writing basic stored procedures.


| Day | Topic | Focus |
|-----|-------|-------|
| 112 | Introduction to transactions | BEGIN, COMMIT, ROLLBACK basics |
| 113 | ACID properties | Atomicity, Consistency, Isolation, Durability |
| 114 | Transaction isolation levels | READ COMMITTED, REPEATABLE READ, SERIALIZABLE |
| 115 | Error handling in transactions | SAVEPOINT, handling failures gracefully |
| 116 | Introduction to stored procedures | CREATE PROCEDURE, parameters, basic logic |
| 117 | Stored procedures with control flow | IF/ELSE, loops, variables in procedures |
| 118 | Weekly review & test | Checkpoint + mini test for Week 16 |

**Key SQL Examples:**

```sql
-- Basic transaction
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;

-- Transaction with ROLLBACK on error
BEGIN;
UPDATE inventory SET quantity = quantity - 5 WHERE product_id = 101;
-- If something goes wrong:
ROLLBACK;

-- SAVEPOINT usage
BEGIN;
UPDATE orders SET status = 'processing' WHERE id = 500;
SAVEPOINT before_payment;
UPDATE payments SET status = 'charged' WHERE order_id = 500;
-- If payment fails, rollback only to savepoint:
ROLLBACK TO SAVEPOINT before_payment;
COMMIT;
```


```sql
-- Basic stored procedure (PostgreSQL syntax)
CREATE OR REPLACE PROCEDURE transfer_funds(
    sender_id INT,
    receiver_id INT,
    amount DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accounts SET balance = balance - amount WHERE id = sender_id;
    UPDATE accounts SET balance = balance + amount WHERE id = receiver_id;
    COMMIT;
END;
$$;

-- Calling the stored procedure
CALL transfer_funds(1, 2, 100.00);
```

**Khmer Explanation:**
Transaction គឺជាក្រុមនៃ SQL statements ដែលត្រូវដំណើរការទាំងអស់ ឬមិនដំណើរការអ្វីទាំងអស់។
ACID គឺជាគោលការណ៍ ៤ យ៉ាងដែលធានាថាទិន្នន័យមានសុវត្ថិភាពនិងត្រឹមត្រូវ។
Stored procedure គឺជា SQL code ដែលរក្សាទុកក្នុង database ហើយអាចហៅប្រើម្តងហើយម្តងទៀត។

---

### Days 119–120: Review and Mini-Project

| Day | Activity |
|-----|----------|
| 119 | Comprehensive Month 4 review: revisit subqueries, views, CTEs, indexes, transactions |
| 120 | Mini-project: Build a reporting system with views, optimized indexes, and transaction-safe operations |

**Mini-Project: E-Commerce Reporting & Performance System**
- Create views for daily sales reports, top customers, and inventory alerts
- Add indexes to optimize the most common queries
- Write transactions for order processing (deduct inventory + create order + charge payment)
- Use CTEs for complex monthly trend reports
- Run EXPLAIN on queries before and after adding indexes


---

## Common Mistakes to Avoid

1. **Using subqueries when a JOIN is more efficient** — Subqueries in SELECT or WHERE can cause row-by-row execution. Always consider if a JOIN achieves the same result faster.

2. **Creating too many indexes** — Every index speeds up reads but slows down writes (INSERT, UPDATE, DELETE). Only index columns that are frequently used in WHERE, JOIN, or ORDER BY clauses.

3. **Forgetting to COMMIT or ROLLBACK transactions** — Leaving transactions open locks rows and can cause deadlocks or block other users.

4. **Not using EXPLAIN before optimizing** — Never guess why a query is slow. Always run EXPLAIN first to see the actual execution plan.

5. **Writing overly complex nested subqueries** — If your subquery is 3+ levels deep, refactor it into CTEs for readability and maintainability.

6. **Ignoring transaction isolation levels** — Using the wrong isolation level can lead to dirty reads, phantom reads, or unnecessary locking that kills performance.

7. **Creating indexes on low-cardinality columns** — Indexing a column with very few distinct values (like a boolean or status with 2-3 options) usually does not help and wastes space.

---

## Professional Habits to Build

- [ ] Always run EXPLAIN before and after adding an index
- [ ] Name indexes clearly (e.g., `idx_tablename_columnname`)
- [ ] Keep transactions as short as possible
- [ ] Use CTEs instead of deeply nested subqueries
- [ ] Comment complex views explaining their business purpose
- [ ] Test stored procedures with edge cases before deploying
- [ ] Monitor query performance regularly, not just when things break
- [ ] Document which indexes exist and why they were created
- [ ] Practice explaining performance concepts in simple English to non-technical people


---

## End-of-Month Checklist

Before moving to Month 5, confirm you can:

- [ ] Write subqueries in WHERE, FROM, and SELECT clauses
- [ ] Explain the difference between correlated and non-correlated subqueries
- [ ] Use EXISTS and IN operators with subqueries correctly
- [ ] Create and query views for reusable business logic
- [ ] Write CTEs (including recursive CTEs) for complex queries
- [ ] Create appropriate indexes for common query patterns
- [ ] Read and interpret EXPLAIN output (seq scan vs index scan, cost, rows)
- [ ] Write transactions with BEGIN, COMMIT, and ROLLBACK
- [ ] Explain ACID properties in simple English and Khmer
- [ ] Use SAVEPOINTs for partial rollbacks
- [ ] Write a basic stored procedure with parameters
- [ ] Identify and fix at least 3 common performance problems
- [ ] Explain to a client why a query is slow and how you fixed it
- [ ] Complete the Month 4 mini-project successfully

---

**Next:** [Month 5 — Real-World Database Work](month-05-real-world-database-work.md)
