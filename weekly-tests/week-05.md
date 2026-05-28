# Week 5 Test: ORDER BY, LIMIT, OFFSET, LIKE, DISTINCT

**Topics Covered:** Sorting results, limiting output, pagination, pattern matching, removing duplicates

**Time Allowed:** 25 minutes

---

## Section A: Multiple Choice (5 Questions)

**1. What does ORDER BY do in SQL?**
- A) Filters rows based on a condition
- B) Sorts the result set by one or more columns
- C) Groups rows together
- D) Limits the number of rows returned

**2. Which clause is used to skip the first N rows in a result?**
- A) SKIP
- B) LIMIT
- C) OFFSET
- D) NEXT

**3. What does the LIKE pattern `'J%'` match?**
- A) Any value ending with J
- B) Any value containing J
- C) Any value starting with J
- D) Only the value "J"

**4. What does SELECT DISTINCT do?**
- A) Selects all rows including duplicates
- B) Removes duplicate rows from the result
- C) Selects only the first row
- D) Orders results uniquely

**5. What is the correct order of clauses in a SELECT statement?**
- A) SELECT, ORDER BY, WHERE, LIMIT
- B) SELECT, WHERE, ORDER BY, LIMIT
- C) SELECT, LIMIT, WHERE, ORDER BY
- D) WHERE, SELECT, ORDER BY, LIMIT

---

## Section B: Short Answer (5 Questions)

**6.** Write the ORDER BY clause to sort employees by salary from highest to lowest.

**7.** Explain the difference between `LIMIT 10` and `LIMIT 10 OFFSET 5`.

**8.** What wildcard character represents exactly one character in a LIKE pattern?

**9.** Can you use ORDER BY on a column that is not in the SELECT list? (Yes/No and explain)

**10.** What happens if you use DISTINCT with multiple columns?


---

## Section C: SQL Writing (5 Questions)

**11.** Write a query to find all customers whose name starts with "S" and ends with "n".

**12.** Write a query to get the top 5 highest-paid employees sorted by salary descending.

**13.** Write a query to get page 3 of products (10 items per page) sorted by product name.

**14.** Write a query to find all distinct cities from the customers table, sorted alphabetically.

**15.** Write a query to find all emails that contain "gmail" using LIKE.

---

## Section D: Speaking Challenge

**Scenario:** Your client asks: "I have 10,000 products. How can I show them 20 at a time on my website?"

Explain in simple English how LIMIT and OFFSET work for pagination. Include a concrete example.

**Khmer Context:** ពន្យល់ពីរបៀបដែល LIMIT និង OFFSET ដំណើរការសម្រាប់បង្ហាញទិន្នន័យជាទំព័រ។

---

## Answer Key

### Section A: Multiple Choice

1. **B** - ORDER BY sorts the result set by one or more columns
2. **C** - OFFSET skips the first N rows
3. **C** - 'J%' matches any value starting with J (% = any characters after)
4. **B** - DISTINCT removes duplicate rows from the result
5. **B** - SELECT, WHERE, ORDER BY, LIMIT (correct SQL clause order)


### Section B: Short Answer

6. `ORDER BY salary DESC`

7. `LIMIT 10` returns the first 10 rows. `LIMIT 10 OFFSET 5` skips the first 5 rows, then returns the next 10 rows (rows 6-15).

8. The underscore `_` represents exactly one character. Example: `'J_n'` matches "Jon", "Jan" but not "John".

9. **Yes.** You can ORDER BY any column in the table, even if it's not in the SELECT list (in most databases).

10. DISTINCT with multiple columns removes rows where the **combination** of all listed columns is duplicated. Each unique combination appears once.

### Section C: SQL Writing

**11.**
```sql
SELECT * FROM customers
WHERE name LIKE 'S%n';
```

**12.**
```sql
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;
```

**13.**
```sql
SELECT * FROM products
ORDER BY product_name
LIMIT 10 OFFSET 20;
```

**14.**
```sql
SELECT DISTINCT city FROM customers
ORDER BY city ASC;
```

**15.**
```sql
SELECT * FROM customers
WHERE email LIKE '%gmail%';
```

### Section D: Speaking Challenge - Sample Answer

"To show products 20 at a time, we use pagination with LIMIT and OFFSET. LIMIT controls how many items appear per page, and OFFSET controls which page we're on. For page 1, we use LIMIT 20 OFFSET 0. For page 2, LIMIT 20 OFFSET 20. For page 3, LIMIT 20 OFFSET 40. The formula is: OFFSET = (page_number - 1) × items_per_page."
