# Week 14 Test — Views, CTEs, and Temporary Tables

**Topics Covered:** CREATE VIEW, updatable views, Common Table Expressions (WITH), recursive CTEs, temporary tables

**Time Limit:** 45 minutes  
**Total Points:** 100

---

## Part A: Multiple Choice (5 questions × 4 points = 20 points)

**1. What is a view in a database?**

a) A copy of a table stored on disk  
b) A saved query that acts like a virtual table  
c) A temporary table that disappears after the session  
d) An index on a table  

**2. Which statement about updatable views is TRUE?**

a) All views are updatable  
b) Views with GROUP BY can be updated  
c) Simple views based on one table without aggregation are usually updatable  
d) Views cannot be used in INSERT statements  

**3. What does the WITH keyword introduce in SQL?**

a) A temporary table  
b) A Common Table Expression (CTE)  
c) A view definition  
d) A stored procedure  

**4. A recursive CTE must contain:**

a) A JOIN and a WHERE clause  
b) An anchor member and a recursive member connected by UNION ALL  
c) A GROUP BY clause  
d) A LIMIT clause  

**5. When does a temporary table get destroyed?**

a) When the transaction commits  
b) When the database restarts  
c) When the session ends (or explicitly dropped)  
d) After 24 hours  

---

## Part B: Short Answer (5 questions × 6 points = 30 points)

**6.** Explain the difference between a view and a CTE in simple English.


**7.** What are the advantages of using views for security? Give an example.

**8.** Write the basic syntax for a recursive CTE. What are the two required parts?

**9.** When would you choose a temporary table over a CTE?

**10.** Can you INSERT data through a view? Under what conditions?

---

## Part C: SQL Writing (5 questions × 10 points = 50 points)

**11.** Create a view called `v_active_employees` that shows only employees with status = 'active'.

```sql
-- Your answer:

```

**12.** Write a CTE that calculates total sales per department, then selects departments with sales above $100,000.

```sql
-- Your answer:

```

**13.** Write a recursive CTE to display an employee hierarchy (manager → employee chain).

```sql
-- Your answer:

```


**14.** Create a temporary table to store monthly revenue, insert data into it, then query it.

```sql
-- Your answer:

```

**15.** Write a CTE using WITH that finds customers who have not placed an order in the last 90 days.

```sql
-- Your answer:

```

---

## Speaking Challenge

**Explain to a client (in simple English):**
"What is a view and why would we use views instead of letting everyone write their own queries?"

Write your explanation (3-5 sentences):

> _______________________________________________

---

## Answer Key

### Part A: Multiple Choice
1. **b** — A view is a saved query that acts like a virtual table
2. **c** — Simple views on one table without aggregation are usually updatable
3. **b** — WITH introduces a Common Table Expression (CTE)
4. **b** — A recursive CTE needs an anchor member and recursive member with UNION ALL
5. **c** — Temporary tables are destroyed when the session ends (or explicitly dropped)


### Part B: Short Answer (Sample Answers)

6. **View vs CTE:** A view is permanently saved in the database and can be reused anytime. A CTE exists only within a single query — once the query finishes, the CTE is gone.

7. **Views for security:** You can create a view that shows only non-sensitive columns (e.g., hide salary or SSN). Then give users access only to the view, not the base table.

8. **Recursive CTE syntax:** `WITH RECURSIVE cte AS (SELECT ... -- anchor member UNION ALL SELECT ... FROM cte WHERE ... -- recursive member) SELECT * FROM cte;`

9. **Temp table vs CTE:** Use a temp table when you need to reference the results multiple times in different queries, or when you need to add indexes on the temp data for performance.

10. **INSERT through a view:** Yes, if the view is based on a single table, has no aggregation, GROUP BY, DISTINCT, or computed columns, and includes all NOT NULL columns.

### Part C: SQL Writing (Sample Answers)

11. `CREATE VIEW v_active_employees AS SELECT employee_id, name, email, department_id FROM employees WHERE status = 'active';`

12. `WITH dept_sales AS (SELECT department_id, SUM(amount) AS total FROM sales GROUP BY department_id) SELECT * FROM dept_sales WHERE total > 100000;`

13. `WITH RECURSIVE emp_hierarchy AS (SELECT id, name, manager_id, 1 AS level FROM employees WHERE manager_id IS NULL UNION ALL SELECT e.id, e.name, e.manager_id, h.level + 1 FROM employees e JOIN emp_hierarchy h ON e.manager_id = h.id) SELECT * FROM emp_hierarchy ORDER BY level;`

14. `CREATE TEMP TABLE monthly_revenue AS SELECT DATE_TRUNC('month', order_date) AS month, SUM(total_amount) AS revenue FROM orders GROUP BY 1; SELECT * FROM monthly_revenue ORDER BY month;`

15. `WITH recent_buyers AS (SELECT DISTINCT customer_id FROM orders WHERE order_date > CURRENT_DATE - INTERVAL '90 days') SELECT * FROM customers WHERE customer_id NOT IN (SELECT customer_id FROM recent_buyers);`
