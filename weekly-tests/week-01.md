# Week 1 Test: Database Fundamentals

## Topics Covered
- What is a database
- Tables, rows, columns
- Real-world database examples
- Introduction to SQL
- SQLite setup
- Basic SELECT statements

---

## Part 1: Multiple Choice (5 questions)

**Q1.** What is a database?
- A) A programming language
- B) An organized collection of data stored electronically
- C) A type of computer hardware
- D) A website builder

**Q2.** What does a "row" in a database table represent?
- A) A column header
- B) A data type
- C) One complete record
- D) The table name

**Q3.** What does SQL stand for?
- A) Simple Query Logic
- B) Structured Query Language
- C) System Query Language
- D) Standard Question Language

**Q4.** What does CRUD stand for?
- A) Create, Read, Update, Delete
- B) Copy, Run, Upload, Download
- C) Connect, Retrieve, Use, Deliver
- D) Create, Remove, Update, Distribute

**Q5.** What does SELECT * FROM students; do?
- A) Deletes all students
- B) Creates a new table
- C) Returns all columns and rows from students table
- D) Counts the number of students


---

## Part 2: Short Answer (5 questions)

**Q6.** Name the three main parts of a database table.

**Q7.** Give 2 real-world examples of systems that use databases.

**Q8.** What is the difference between SELECT * and SELECT name, age?

**Q9.** What command do you use to open SQLite in the terminal?

**Q10.** Write a SELECT statement that gets only the name and email columns from a customers table.

---

## Part 3: SQL Writing (3 questions)

**Q11.** Write a SQL query to select all columns from a table called "products".

**Q12.** Write a SQL query to select only the title and price from a table called "books".

**Q13.** Write a SQL query using an alias to rename the "salary" column to "Monthly Pay".

---

## Part 4: Speaking Challenge

Explain to an imaginary client (in 3-4 sentences):
- What a database is
- Why their business needs one
- How data is organized in tables

---

## Answer Key

### Part 1
1. **B** - An organized collection of data stored electronically
2. **C** - One complete record
3. **B** - Structured Query Language
4. **A** - Create, Read, Update, Delete
5. **C** - Returns all columns and rows from students table

### Part 2
6. Table, Row (record), Column (field)
7. Any 2: Facebook, banks, hospitals, schools, online shops, etc.
8. SELECT * gets all columns; SELECT name, age gets only those two columns
9. `sqlite3 database_name.db`
10. `SELECT name, email FROM customers;`

### Part 3
11. `SELECT * FROM products;`
12. `SELECT title, price FROM books;`
13. `SELECT salary AS "Monthly Pay" FROM employees;`

---

## Reflection
Before moving to Week 2, can you:
- [ ] Explain what a database is without notes?
- [ ] Name the parts of a table?
- [ ] Write basic SELECT statements from memory?
- [ ] Explain CRUD operations?

If any answer is "no," review that day's lesson before continuing.
