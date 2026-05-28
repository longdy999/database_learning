# Week 3 Test: INSERT and Basic SELECT with WHERE

## Topics Covered
- INSERT INTO (single and multiple rows)
- SELECT * and SELECT specific columns
- WHERE clause with = and !=
- WHERE with numeric operators (>, <, >=, <=)
- Week 3 review

---

## Part 1: Multiple Choice (5 questions)

**Q1.** Which INSERT syntax is preferred in professional work?
- A) INSERT INTO table VALUES (...)
- B) INSERT INTO table (col1, col2) VALUES (...)
- C) INSERT table SET col1 = val1
- D) ADD INTO table VALUES (...)

**Q2.** What does WHERE price > 100 return?
- A) All rows where price is exactly 100
- B) All rows where price is 100 or more
- C) All rows where price is more than 100
- D) All rows where price is less than 100

**Q3.** What is the difference between > and >=?
- A) No difference
- B) > includes the boundary value, >= does not
- C) >= includes the boundary value, > does not
- D) They work only with text

**Q4.** How do you insert 5 rows in one statement?
- A) Write 5 separate INSERT statements
- B) INSERT INTO table VALUES (...), (...), (...), (...), (...);
- C) INSERT 5 INTO table VALUES (...)
- D) INSERT MULTIPLE INTO table VALUES (...)

**Q5.** What does SELECT name AS "Full Name" do?
- A) Renames the column permanently
- B) Creates a new column called Full Name
- C) Shows the name column with header "Full Name" in output
- D) Filters rows where name equals "Full Name"


---

## Part 2: Short Answer (5 questions)

**Q6.** Why is named-column INSERT better than full-row INSERT?

**Q7.** Write a query that finds employees with salary exactly equal to 1500.

**Q8.** Write a query that finds products NOT in the "Electronics" category.

**Q9.** What is the difference between SELECT * and SELECT name, price?

**Q10.** If a product costs exactly $100, will `WHERE price > 100` include it? Why?

---

## Part 3: SQL Writing (5 questions)

**Q11.** Write a multi-row INSERT to add 3 products (name, price, category) to a products table.

**Q12.** Write a SELECT that shows employee names and salaries where salary is greater than or equal to 2000.

**Q13.** Write a SELECT with an alias that shows price as "Unit Price" for all products under $50.

**Q14.** Write a query to find all orders where status is not equal to 'cancelled'.

**Q15.** Write a query to find students whose age is less than 25.

---

## Part 4: Speaking Challenge

Explain to a client:
- How you would insert their product data into the database
- How you would find all products priced over $50
- Why filtering with WHERE is useful for their business

---

## Answer Key

### Part 1
1. **B** - Named columns (clearer, safer, order-independent)
2. **C** - All rows where price is more than 100
3. **C** - >= includes the boundary value, > does not
4. **B** - VALUES (...), (...), (...), (...), (...);
5. **C** - Shows the name column with header "Full Name" in output

### Part 2
6. Clearer to read, column order doesn't matter, can skip DEFAULT columns, works if table structure changes.
7. `SELECT * FROM employees WHERE salary = 1500;`
8. `SELECT * FROM products WHERE category != 'Electronics';`
9. SELECT * returns all columns; SELECT name, price returns only those two.
10. No. `> 100` means "greater than 100" not "equal to 100." Need `>= 100` to include it.

### Part 3
11.
```sql
INSERT INTO products (name, price, category) VALUES
    ('Laptop', 899.99, 'Electronics'),
    ('Notebook', 3.50, 'Stationery'),
    ('Desk Chair', 249.00, 'Furniture');
```
12. `SELECT name, salary FROM employees WHERE salary >= 2000;`
13. `SELECT name, price AS "Unit Price" FROM products WHERE price < 50;`
14. `SELECT * FROM orders WHERE status != 'cancelled';`
15. `SELECT * FROM students WHERE age < 25;`

---

## Reflection
- [ ] Can I write INSERT with named columns from memory?
- [ ] Can I write WHERE with all 6 operators (=, !=, >, <, >=, <=)?
- [ ] Do I understand the difference between > and >=?
- [ ] Can I use aliases effectively?
