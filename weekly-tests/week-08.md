# Week 8 Test: Multi-Table Joins, Query Planning, and Business Patterns

**Topics Covered:** Multi-table joins, query planning strategy, debugging queries, common business query patterns

**Time Allowed:** 30 minutes

---

## Section A: Multiple Choice (5 Questions)

**1. When joining 3 tables, how many JOIN clauses do you need?**
- A) 1
- B) 2
- C) 3
- D) It depends on the database

**2. What is the first step in planning a complex query?**
- A) Write the SELECT clause
- B) Identify which tables contain the data you need
- C) Add ORDER BY
- D) Run the query immediately

**3. If a JOIN query returns more rows than expected, what is the most likely cause?**
- A) The WHERE clause is wrong
- B) A many-to-many relationship is creating duplicate combinations
- C) The table has too many columns
- D) The database is broken

**4. What is a "bridge table" (junction table)?**
- A) A table that stores backups
- B) A table that connects two tables in a many-to-many relationship
- C) A temporary table
- D) A table with no primary key

**5. Which business pattern requires joining orders, order_items, and products tables together?**
- A) Customer login report
- B) Inventory count
- C) Sales report with product details
- D) Employee attendance

---

## Section B: Short Answer (5 Questions)

**6.** Describe the 4-step process for planning a multi-table query.

**7.** You write a JOIN query and get 0 rows. List two possible reasons.

**8.** What is the difference between joining on the wrong column vs. a correct column with no matches?

**9.** Give an example of when you need 3 tables in one query for a real business report.

**10.** How do you debug a query that returns unexpected NULL values?


---

## Section C: SQL Writing (5 Questions)

Use these tables:
- `customers` (id, name, email, city)
- `orders` (id, customer_id, order_date, status)
- `order_items` (id, order_id, product_id, quantity, unit_price)
- `products` (id, product_name, category, price)

**11.** Write a query to show each customer's name with their total number of orders and total spending.

**12.** Write a query to show all products that have never been ordered (anti-join across multiple tables).

**13.** Write a query to find the top 3 best-selling products by total quantity sold.

**14.** Write a query to show a monthly sales report: month, total orders, and total revenue.

**15.** Write a query to find customers in "Phnom Penh" who have ordered products in the "Electronics" category.

---

## Section D: Speaking Challenge

**Scenario:** A client asks: "I want a report showing each customer, what they bought, how much they spent, and what city they're from. Can you build that?"

Explain your query plan step by step. Identify which tables you need, how they connect, and what the final output looks like.

**Khmer Context:** ពន្យល់ផែនការសំណួររបស់អ្នកជាជំហានៗ។ កំណត់តារាងណាខ្លះដែលអ្នកត្រូវការ។

---

## Answer Key

### Section A: Multiple Choice

1. **B** - Joining 3 tables requires 2 JOIN clauses (each JOIN connects one additional table)
2. **B** - First identify which tables contain the data you need
3. **B** - Many-to-many relationships create duplicate row combinations
4. **B** - A bridge/junction table connects two tables in a many-to-many relationship
5. **C** - Sales report with product details needs orders + order_items + products


### Section B: Short Answer

6. Four steps: (1) Identify what data/columns you need in the output. (2) Identify which tables contain those columns. (3) Determine how the tables connect (foreign keys). (4) Write the query starting with FROM, adding JOINs, then SELECT, WHERE, GROUP BY.

7. Two reasons for 0 rows: (1) The ON condition uses mismatched columns or wrong data types. (2) The data simply has no matching records between the tables for the given conditions.

8. Wrong column: the query runs but produces nonsensical results (usually too many or too few rows with wrong data). No matches on correct column: the query logic is correct but the data simply has no overlapping values.

9. Example: A sales report showing customer name, product name, and quantity requires: customers → orders → order_items → products (at least 3 joins for 4 tables).

10. Debug unexpected NULLs: (1) Check if you're using LEFT JOIN (NULLs are expected for non-matches). (2) Verify the JOIN condition matches the correct columns. (3) Check if the source data actually contains NULLs. (4) Run each JOIN separately to isolate which one introduces the NULLs.

### Section C: SQL Writing

**11.**
```sql
SELECT c.name,
       COUNT(o.id) AS total_orders,
       COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id, c.name;
```

**12.**
```sql
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
WHERE oi.id IS NULL;
```

**13.**
```sql
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
INNER JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 3;
```

**14.**
```sql
SELECT DATE_TRUNC('month', o.order_date) AS month,
       COUNT(DISTINCT o.id) AS total_orders,
       SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
INNER JOIN order_items oi ON o.id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;
```

**15.**
```sql
SELECT DISTINCT c.name, c.email
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
INNER JOIN order_items oi ON o.id = oi.order_id
INNER JOIN products p ON oi.product_id = p.id
WHERE c.city = 'Phnom Penh'
  AND p.category = 'Electronics';
```

### Section D: Speaking Challenge - Sample Answer

"To build this report, I need to connect 4 tables. Think of it like a chain: Customer → their Orders → Items in each order → Product details. I start with the customers table (that has their city), then JOIN orders to see what they bought, then JOIN order_items to see quantities and prices, then JOIN products to get product names. The final report will have columns: customer name, city, product name, quantity, and amount spent. I'll use LEFT JOIN from customers so we include everyone, even those who haven't ordered yet."
