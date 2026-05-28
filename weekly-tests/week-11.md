# Week 11 Test — ERD & Constraints

## Topics Covered
- ERD (Entity-Relationship Diagram) notation
- Drawing ERDs from requirements
- CHECK constraints
- UNIQUE constraints
- DEFAULT constraints
- Composite keys

---

## Part A: Multiple Choice (5 Questions)

**1. In an ERD, what does a diamond shape represent?**
- A) An entity
- B) An attribute
- C) A relationship
- D) A primary key

**2. What does a CHECK constraint do?**
- A) Checks if the table exists
- B) Validates that values meet a specified condition
- C) Checks for duplicate values
- D) Verifies foreign key references

**3. Which constraint ensures no two rows have the same email?**
- A) PRIMARY KEY
- B) NOT NULL
- C) UNIQUE
- D) CHECK

**4. A composite key is:**
- A) A key that uses encryption
- B) A primary key made of two or more columns
- C) A foreign key that references multiple tables
- D) A key with a default value

**5. In ERD notation, a double line between entities indicates:**
- A) Optional participation
- B) Total (mandatory) participation
- C) Many-to-many relationship
- D) Weak entity


---

## Part B: Short Answer (5 Questions)

**6.** List 5 components of an ERD and explain what each represents.

**7.** What is the difference between UNIQUE and PRIMARY KEY constraints?

**8.** Give two real-world examples where a composite key is appropriate.

**9.** Explain what a DEFAULT constraint does. When is it useful?

**10.** You receive this requirement: "Employees must be at least 18 years old and salary must be positive." What constraints would you use?

---

## Part C: SQL Writing (5 Questions)

**11.** Write a CREATE TABLE with a CHECK constraint ensuring `age >= 18` and `salary > 0`.

**12.** Create a table with a UNIQUE constraint on the combination of `first_name` and `last_name`.

**13.** Write a table with DEFAULT values: `status` defaults to 'active', `created_at` defaults to current timestamp.

**14.** Create a table using a composite primary key for an `exam_results` table (student_id, exam_id) with a CHECK on score (0-100).

**15.** Based on this requirement, draw the ERD as SQL CREATE statements:
- A library has books and members
- Members can borrow many books
- Each borrow record has borrow_date and return_date
- Books have ISBN (unique), title, and author

---

## Speaking Challenge

Explain to a client:
> "What is an ERD and why do we create one before building the database?
> How does it help prevent problems later?"

Practice explaining clearly in 60 seconds.


---

## Answer Key

### Part A: Multiple Choice
1. **C** — Diamond represents a relationship
2. **B** — CHECK validates values against a condition
3. **C** — UNIQUE prevents duplicate values
4. **B** — Composite key uses two or more columns as PK
5. **B** — Double line means total/mandatory participation

### Part B: Short Answer

**6.** Five ERD components:
- Entity (rectangle): a real-world object (e.g., Student)
- Attribute (oval): a property of an entity (e.g., name)
- Relationship (diamond): connection between entities (e.g., enrolls)
- Primary Key (underlined attribute): unique identifier
- Cardinality lines: show 1:1, 1:N, M:N ratios

**7.** PRIMARY KEY: uniquely identifies each row, only one per table, cannot be NULL. UNIQUE: ensures no duplicates, can have multiple per table, allows one NULL (in most RDBMS).

**8.** Composite key examples:
- `enrollments(student_id, course_id)` — one enrollment per student per course
- `order_items(order_id, product_id)` — one line item per product per order

**9.** DEFAULT provides an automatic value when no value is specified during INSERT. Useful for timestamps (created_at), status fields ('active'), or counters (0).

**10.** Use `CHECK (age >= 18)` and `CHECK (salary > 0)`. Could also add `NOT NULL` to both columns to prevent missing data.


### Part C: SQL Writing

**11.**
```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age >= 18),
    salary DECIMAL(10,2) NOT NULL CHECK (salary > 0)
);
```

**12.**
```sql
CREATE TABLE people (
    person_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    UNIQUE (first_name, last_name)
);
```

**13.**
```sql
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**14.**
```sql
CREATE TABLE exam_results (
    student_id INT,
    exam_id INT,
    score INT NOT NULL CHECK (score >= 0 AND score <= 100),
    taken_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, exam_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);
```


**15.**
```sql
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    isbn VARCHAR(13) UNIQUE NOT NULL,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL
);
CREATE TABLE borrows (
    borrow_id INT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
```

---

## Scoring
- Part A: 2 points each = 10 points
- Part B: 4 points each = 20 points
- Part C: 6 points each = 30 points
- Speaking Challenge: 10 points
- **Total: 70 points** | Pass: 49+ points
