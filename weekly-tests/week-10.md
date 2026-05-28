# Week 10 Test — Normalization

## Topics Covered
- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)
- Data anomalies (insert, update, delete)
- Denormalization and when to use it

---

## Part A: Multiple Choice (5 Questions)

**1. What does 1NF require?**
- A) No partial dependencies
- B) No transitive dependencies
- C) Atomic values and no repeating groups
- D) All columns depend on the primary key

**2. A table has a composite key (student_id, course_id) and a column `student_name` that depends only on student_id. This violates which normal form?**
- A) 1NF
- B) 2NF
- C) 3NF
- D) BCNF

**3. What is a transitive dependency?**
- A) Column A depends on Column B which depends on Column C
- B) A non-key column depends on another non-key column
- C) A column depends on part of the primary key
- D) Two columns have the same values

**4. Which data anomaly occurs when you cannot add data without adding unrelated data?**
- A) Delete anomaly
- B) Update anomaly
- C) Insert anomaly
- D) Read anomaly

**5. When might denormalization be acceptable?**
- A) When you want to break referential integrity
- B) When read performance is critical and data rarely changes
- C) When you have too many tables
- D) Always, because normalization is outdated


---

## Part B: Short Answer (5 Questions)

**6.** Explain 1NF, 2NF, and 3NF in simple terms. Use one sentence for each.

**7.** Give an example of an update anomaly. Why is it a problem?

**8.** A table stores: order_id, product_name, product_category, customer_name, customer_city. Identify the normalization issues.

**9.** What is the difference between a partial dependency and a transitive dependency?

**10.** When would you choose to denormalize a database? Give one real-world scenario.

---

## Part C: SQL Writing (5 Questions)

**11.** Given this unnormalized table, write the 1NF version:
```
students(id, name, phone_numbers)
-- phone_numbers contains: "012345,067890,011222"
```

**12.** Normalize this table to 2NF:
```
order_items(order_id, product_id, product_name, quantity, price)
-- PK: (order_id, product_id)
-- product_name depends only on product_id
```

**13.** Normalize this table to 3NF:
```
employees(emp_id, emp_name, dept_id, dept_name, dept_location)
-- dept_name and dept_location depend on dept_id, not emp_id
```

**14.** Write CREATE TABLE statements for a fully normalized (3NF) version of a school registration system with: student info, course info, and enrollment.

**15.** Write a denormalized reporting table that combines order, customer, and product data for fast dashboard queries.


---

## Speaking Challenge

Explain to a non-technical client:
> "Why do we split one big table into multiple smaller tables?
> What problems does this solve, and are there any tradeoffs?"

Practice explaining in 90 seconds using simple language.

---

## Answer Key

### Part A: Multiple Choice
1. **C** — 1NF requires atomic values, no repeating groups
2. **B** — Partial dependency violates 2NF
3. **B** — Non-key column depends on another non-key column
4. **C** — Insert anomaly: cannot add data independently
5. **B** — Denormalization is acceptable for read-heavy, rarely-changing data

### Part B: Short Answer

**6.**
- 1NF: Every cell has one value (atomic), no repeating groups.
- 2NF: No partial dependencies (all non-key columns depend on the full PK).
- 3NF: No transitive dependencies (non-key columns don't depend on other non-key columns).

**7.** If `dept_name` is stored in every employee row, changing a department name requires updating many rows. Missing one creates inconsistency.

**8.** Issues: product_category depends on product_name (transitive); customer_city depends on customer_name (transitive). Should split into orders, products, and customers tables.

**9.** Partial dependency: a column depends on part of a composite key. Transitive dependency: a non-key column depends on another non-key column.

**10.** Reporting dashboards that need fast reads across many tables. Pre-joining data into a summary table avoids expensive JOINs at query time.


### Part C: SQL Writing

**11.** 1NF — separate table for phone numbers:
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
CREATE TABLE student_phones (
    phone_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
```

**12.** 2NF — extract product_name:
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL
);
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
```

**13.** 3NF — extract department:
```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    dept_location VARCHAR(100)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```


**14.** Fully normalized school registration:
```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3
);
CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade CHAR(2),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

**15.** Denormalized reporting table:
```sql
CREATE TABLE sales_report (
    report_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    customer_city VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);
```

---

## Scoring
- Part A: 2 points each = 10 points
- Part B: 4 points each = 20 points
- Part C: 6 points each = 30 points
- Speaking Challenge: 10 points
- **Total: 70 points** | Pass: 49+ points
