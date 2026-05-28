# Week 6 Test: JOIN Types

**Topics Covered:** INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, table aliases, anti-join pattern

**Time Allowed:** 30 minutes

---

## Section A: Multiple Choice (5 Questions)

**1. What does an INNER JOIN return?**
- A) All rows from the left table
- B) All rows from both tables
- C) Only rows that have matching values in both tables
- D) All rows from the right table

**2. What does a LEFT JOIN return?**
- A) Only matching rows from both tables
- B) All rows from the left table, plus matching rows from the right table
- C) All rows from the right table only
- D) Only non-matching rows

**3. What is a table alias used for?**
- A) To rename the table permanently
- B) To give a short temporary name to a table in a query
- C) To create a backup of the table
- D) To delete the table

**4. What is an anti-join pattern?**
- A) A JOIN that returns all rows
- B) A pattern to find rows in one table that have NO match in another table
- C) A JOIN that combines three tables
- D) A special type of INNER JOIN

**5. In a LEFT JOIN, what appears in the right table's columns when there is no match?**
- A) 0
- B) Empty string
- C) NULL
- D) An error occurs

---

## Section B: Short Answer (5 Questions)

**6.** Explain the difference between INNER JOIN and LEFT JOIN in one sentence each.

**7.** Write a table alias example: give the table `employees` the alias `e`.

**8.** When would you use a FULL JOIN in a real business scenario?

**9.** How do you write an anti-join using LEFT JOIN and WHERE?

**10.** Can you JOIN a table to itself? What is this called?


---

## Section C: SQL Writing (5 Questions)

Use these tables for questions 11-15:
- `employees` (id, name, department_id)
- `departments` (id, department_name)
- `orders` (id, customer_id, amount)
- `customers` (id, name, email)

**11.** Write a query to show all employees with their department names using INNER JOIN.

**12.** Write a query to show ALL customers, even those who have never placed an order, with their order amounts.

**13.** Write a query to find customers who have NEVER placed an order (anti-join).

**14.** Write a query using table aliases to join employees and departments. Use `e` and `d` as aliases.

**15.** Write a FULL JOIN query to show all employees and all departments, including unmatched rows from both sides.

---

## Section D: Speaking Challenge

**Scenario:** A client says: "I want to see all our customers, and for each one, show their last order. But I also want to see customers who never ordered anything."

Explain which JOIN type you would use and why. Give a simple analogy.

**Khmer Context:** ពន្យល់ប្រភេទ JOIN ណាដែលអ្នកនឹងប្រើ ហើយហេតុអ្វី។ ប្រើការប្រៀបធៀបសាមញ្ញ។

---

## Answer Key

### Section A: Multiple Choice

1. **C** - INNER JOIN returns only rows with matching values in both tables
2. **B** - LEFT JOIN returns all rows from the left table plus matches from right
3. **B** - An alias gives a short temporary name to a table in a query
4. **B** - Anti-join finds rows in one table with NO match in another
5. **C** - NULL appears when there is no matching row in the right table


### Section B: Short Answer

6. **INNER JOIN** returns only rows where both tables have a match. **LEFT JOIN** returns all rows from the left table, filling in NULL where no match exists on the right.

7. `SELECT e.name FROM employees e` or `SELECT e.name FROM employees AS e`

8. A FULL JOIN is useful when reconciling two datasets, for example comparing a list of planned shipments with actual deliveries to find mismatches on both sides.

9. Anti-join pattern:
```sql
SELECT c.* FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
```

10. **Yes.** This is called a **self-join**. Example: finding employees and their managers when both are in the same table.

### Section C: SQL Writing

**11.**
```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;
```

**12.**
```sql
SELECT c.name, o.amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;
```

**13.**
```sql
SELECT c.name, c.email
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
```

**14.**
```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;
```

**15.**
```sql
SELECT e.name, d.department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.id;
```

### Section D: Speaking Challenge - Sample Answer

"For this case, I'd use a LEFT JOIN. Think of it like a class attendance list: the left side is your full customer list (everyone enrolled), and the right side is orders (who showed up). A LEFT JOIN keeps everyone on the list, even if they never placed an order. Those with no orders will just show NULL in the order columns. This way, you can easily see who's active and who might need a follow-up."
