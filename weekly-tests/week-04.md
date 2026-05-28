# Week 4 Test: UPDATE, DELETE, AND/OR, IN/BETWEEN, NULL

## Topics Covered
- UPDATE with SET and WHERE
- DELETE with WHERE (safe patterns)
- AND, OR operators
- IN and BETWEEN operators
- NULL values: IS NULL, IS NOT NULL
- Full CRUD practice

---

## Part 1: Multiple Choice (5 questions)

**Q1.** What happens if you run `UPDATE products SET price = 0;` without WHERE?
- A) Nothing happens
- B) Only the first row changes
- C) ALL rows get price set to 0
- D) The table is deleted

**Q2.** What does `WHERE city IN ('Phnom Penh', 'Siem Reap')` do?
- A) Excludes those two cities
- B) Returns rows where city is either Phnom Penh or Siem Reap
- C) Creates two new cities
- D) Counts cities

**Q3.** What does `BETWEEN 10 AND 50` include?
- A) Only values from 11 to 49
- B) Values from 10 to 50 (inclusive)
- C) Only values from 10 to 49
- D) Only the value 10 and 50

**Q4.** How do you check for missing data (NULL)?
- A) WHERE column = NULL
- B) WHERE column == NULL
- C) WHERE column IS NULL
- D) WHERE column EQUALS NULL

**Q5.** What is the safe pattern before DELETE?
- A) Just run DELETE immediately
- B) Run SELECT with the same WHERE first, verify, then DELETE
- C) Drop the table and recreate it
- D) Use UPDATE instead of DELETE


---

## Part 2: Short Answer (5 questions)

**Q6.** Why is UPDATE without WHERE dangerous?

**Q7.** What is the difference between AND and OR in a WHERE clause?

**Q8.** Rewrite this using IN: `WHERE dept = 'Sales' OR dept = 'Marketing' OR dept = 'HR'`

**Q9.** What is the difference between "hard delete" and "soft delete"?

**Q10.** Why does `WHERE email = NULL` not work?

---

## Part 3: SQL Writing (5 questions)

**Q11.** Write an UPDATE that changes the status to 'inactive' for all customers who have not logged in since 2023-01-01.

**Q12.** Write a safe DELETE sequence (SELECT first, then DELETE) for products with stock = 0.

**Q13.** Write a query using AND and OR with parentheses: Find employees in IT or Sales department who earn more than $1500.

**Q14.** Write a query using BETWEEN to find orders placed between March 1 and June 30, 2024.

**Q15.** Write a query to find all customers who have a phone number but no email address.

---

## Part 4: Speaking Challenge

Explain to a client:
- Why you always use WHERE with UPDATE and DELETE
- What "soft delete" means and why it's safer
- How NULL values work (they are not the same as zero or empty)

---

## Answer Key

### Part 1
1. **C** - ALL rows get price set to 0
2. **B** - Returns rows where city is either Phnom Penh or Siem Reap
3. **B** - Values from 10 to 50 (inclusive)
4. **C** - WHERE column IS NULL
5. **B** - Run SELECT with same WHERE first, verify, then DELETE

### Part 2
6. It changes EVERY row in the table, not just one record. This can destroy all your data.
7. AND requires ALL conditions to be true; OR requires at least ONE to be true.
8. `WHERE dept IN ('Sales', 'Marketing', 'HR')`
9. Hard delete removes the data permanently; soft delete marks it as deleted (e.g., status = 'deleted') but keeps the data.
10. NULL is not a value — it means "unknown." You cannot compare something to unknown with =. Must use IS NULL.

### Part 3
11. `UPDATE customers SET status = 'inactive' WHERE last_login < '2023-01-01';`
12.
```sql
-- Step 1: Verify
SELECT * FROM products WHERE stock = 0;
-- Step 2: Delete
DELETE FROM products WHERE stock = 0;
```
13. `SELECT * FROM employees WHERE (department = 'IT' OR department = 'Sales') AND salary > 1500;`
14. `SELECT * FROM orders WHERE order_date BETWEEN '2024-03-01' AND '2024-06-30';`
15. `SELECT * FROM customers WHERE phone IS NOT NULL AND email IS NULL;`

---

## Reflection
- [ ] Can I UPDATE and DELETE safely with WHERE?
- [ ] Do I understand AND vs OR and use parentheses correctly?
- [ ] Can I use IN and BETWEEN to simplify queries?
- [ ] Do I handle NULL correctly with IS NULL / IS NOT NULL?
- [ ] Am I confident with all CRUD operations?

## Month 1 Complete!
If you passed all 4 weekly tests, you have a solid database foundation. You are ready for Month 2: SQL Querying (filtering, joins, grouping, aggregation).
