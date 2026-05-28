# Week 13 Test — Subqueries

**Topics Covered:** Scalar subqueries, IN subqueries, EXISTS subqueries, correlated subqueries, derived tables (inline views)

**Time Limit:** 45 minutes  
**Total Points:** 100

---

## Part A: Multiple Choice (5 questions × 4 points = 20 points)

**1. What is a scalar subquery?**

a) A subquery that returns multiple rows  
b) A subquery that returns exactly one value (one row, one column)  
c) A subquery that references the outer query  
d) A subquery used in the FROM clause  

**2. Which keyword checks if a subquery returns at least one row?**

a) IN  
b) ANY  
c) EXISTS  
d) HAVING  

**3. What makes a subquery "correlated"?**

a) It uses JOIN syntax  
b) It references a column from the outer query  
c) It returns multiple columns  
d) It is placed in the SELECT clause  

**4. A derived table is a subquery placed in which clause?**

a) WHERE  
b) SELECT  
c) FROM  
d) HAVING  

**5. Which subquery type is re-executed for each row of the outer query?**

a) Scalar subquery  
b) Inline view  
c) Correlated subquery  
d) Non-correlated subquery  

---

## Part B: Short Answer (5 questions × 6 points = 30 points)

**6.** Explain the difference between a correlated and a non-correlated subquery in simple English.


**7.** When would you use EXISTS instead of IN? Give one advantage.

**8.** What is a derived table? Write a simple example scenario where you would use one.

**9.** Can a scalar subquery return more than one row? What happens if it does?

**10.** Explain what happens step-by-step when this query executes:
```sql
SELECT name FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'Phnom Penh');
```

---

## Part C: SQL Writing (5 questions × 10 points = 50 points)

**11.** Write a scalar subquery to show each product name and the average price of all products.

```sql
-- Your answer:
SELECT product_name,
       price,
       (______) AS avg_all_products
FROM products;
```

**12.** Using IN subquery: Find all customers who have placed at least one order.

```sql
-- Your answer:

```

**13.** Using EXISTS: Find all departments that have at least one employee earning over $80,000.

```sql
-- Your answer:

```


**14.** Using a correlated subquery: Find employees who earn more than the average salary in their own department.

```sql
-- Your answer:

```

**15.** Using a derived table: Find the top 3 departments by total salary expense.

```sql
-- Your answer:

```

---

## Speaking Challenge

**Explain to a client (in simple English):**
"Why would we use a subquery instead of a JOIN? When is each approach better?"

Write your explanation (3-5 sentences):

> _______________________________________________

---

## Answer Key

### Part A: Multiple Choice
1. **b** — A scalar subquery returns exactly one value (one row, one column)
2. **c** — EXISTS checks if a subquery returns at least one row
3. **b** — A correlated subquery references a column from the outer query
4. **c** — A derived table is a subquery in the FROM clause
5. **c** — A correlated subquery is re-executed for each row of the outer query


### Part B: Short Answer (Sample Answers)

6. **Correlated vs Non-correlated:** A non-correlated subquery runs independently — it executes once and the outer query uses the result. A correlated subquery references the outer query, so it runs once for each row in the outer query.

7. **EXISTS vs IN:** EXISTS stops as soon as it finds one matching row (short-circuits). It's faster when the subquery table is large and most rows match.

8. **Derived table:** A subquery in the FROM clause that creates a temporary result set you can query. Example: getting the max salary per department, then filtering departments over $100K.

9. **Scalar subquery multiple rows:** No, a scalar subquery cannot return more than one row. If it does, the database raises an error: "subquery must return only one row."

10. **Step-by-step:** First the inner query finds department_ids where location is Phnom Penh. Then the outer query returns names of employees whose department_id is in that list.

### Part C: SQL Writing (Sample Answers)

11. `SELECT product_name, price, (SELECT AVG(price) FROM products) AS avg_all_products FROM products;`

12. `SELECT * FROM customers WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);`

13. `SELECT * FROM departments d WHERE EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id AND e.salary > 80000);`

14. `SELECT * FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e2.department_id = e.department_id);`

15. `SELECT * FROM (SELECT department_id, SUM(salary) AS total_salary FROM employees GROUP BY department_id) AS dept_costs ORDER BY total_salary DESC LIMIT 3;`
