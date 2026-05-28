# Week 2 Test: Data Types, Keys, and CREATE TABLE

## Topics Covered
- Data types (INTEGER, TEXT, REAL, BOOLEAN)
- Primary keys and AUTOINCREMENT
- CREATE TABLE syntax
- Constraints: NOT NULL, UNIQUE, DEFAULT, CHECK
- Practice with multi-table design

---

## Part 1: Multiple Choice (5 questions)

**Q1.** Which data type stores decimal numbers?
- A) INTEGER
- B) TEXT
- C) REAL
- D) BLOB

**Q2.** What does a PRIMARY KEY guarantee?
- A) The column can be NULL
- B) Each row has a unique identifier
- C) The column stores only text
- D) The table has no constraints

**Q3.** What does NOT NULL mean?
- A) The column must always have a value
- B) The column can only store numbers
- C) The column is the primary key
- D) The column has a default value

**Q4.** What does CHECK(age > 0) do?
- A) Sets age to 0 by default
- B) Rejects any row where age is 0 or negative
- C) Makes age the primary key
- D) Counts the number of ages

**Q5.** What does DEFAULT 'pending' do?
- A) Makes the column required
- B) Rejects the value 'pending'
- C) Automatically uses 'pending' if no value is provided
- D) Creates a new table called pending


---

## Part 2: Short Answer (5 questions)

**Q6.** List 4 common data types in SQLite.

**Q7.** What are the 3 rules of a primary key?

**Q8.** What is the difference between UNIQUE and PRIMARY KEY?

**Q9.** Write a CHECK constraint that ensures price is greater than 0.

**Q10.** What happens if you try to INSERT a row with a duplicate email into a column marked UNIQUE?

---

## Part 3: SQL Writing (3 questions)

**Q11.** Write a CREATE TABLE for "students" with: id (primary key, autoincrement), name (text, not null), email (text, unique, not null), age (integer, check > 0), gpa (real).

**Q12.** Write a CREATE TABLE for "products" with: id (primary key), name (not null), price (real, not null, check > 0), stock (integer, default 0).

**Q13.** Write an INSERT that would FAIL on the students table from Q11 (explain why it fails).

---

## Part 4: Speaking Challenge

Explain to an imaginary client (in 3-4 sentences):
- What constraints are and why they matter
- Give one example of NOT NULL, UNIQUE, and CHECK

---

## Answer Key

### Part 1
1. **C** - REAL
2. **B** - Each row has a unique identifier
3. **A** - The column must always have a value
4. **B** - Rejects any row where age is 0 or negative
5. **C** - Automatically uses 'pending' if no value is provided

### Part 2
6. INTEGER, REAL, TEXT, BLOB (also NULL)
7. Must be unique, cannot be NULL, one per table
8. A table can have only one PRIMARY KEY but multiple UNIQUE columns. PK implies NOT NULL; UNIQUE allows NULL (in most databases).
9. `CHECK(price > 0)`
10. The INSERT fails with a "UNIQUE constraint failed" error.

### Part 3
11.
```sql
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    age INTEGER CHECK(age > 0),
    gpa REAL
);
```
12.
```sql
CREATE TABLE products (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    stock INTEGER DEFAULT 0
);
```
13. Example: `INSERT INTO students (email, age) VALUES ('test@email.com', 20);` — Fails because name is NOT NULL but no value was provided.

---

## Reflection
- [ ] Can I write CREATE TABLE from memory?
- [ ] Do I know all 5 constraint types?
- [ ] Can I predict which INSERTs will fail?
- [ ] Can I explain constraints to a non-technical person?
