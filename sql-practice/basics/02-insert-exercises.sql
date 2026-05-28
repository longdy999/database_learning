-- =====================================================
-- SQL Practice: INSERT Exercises
-- Level: Month 1 Basics
-- =====================================================

-- Setup: Create table for exercises
CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    department TEXT NOT NULL DEFAULT 'General',
    salary REAL NOT NULL CHECK(salary > 0),
    hire_date TEXT NOT NULL DEFAULT (date('now')),
    is_active INTEGER NOT NULL DEFAULT 1
);

-- Exercise 1: Insert one employee with all fields specified
INSERT INTO employees (full_name, email, department, salary, hire_date)
VALUES ('Sokha Keo', 'sokha@company.com', 'Engineering', 1500.00, '2024-01-15');

-- Exercise 2: Insert one employee using DEFAULT values
INSERT INTO employees (full_name, email, salary)
VALUES ('Dara Phan', 'dara@company.com', 1200.00);

-- Exercise 3: Insert multiple employees in one statement
INSERT INTO employees (full_name, email, department, salary) VALUES
    ('Bopha Kim', 'bopha@company.com', 'Marketing', 1100.00),
    ('Vanna Sok', 'vanna@company.com', 'Sales', 1300.00),
    ('Channa Ly', 'channa@company.com', 'HR', 1000.00);

-- Exercise 4: YOUR TURN - Insert 3 more employees using multi-row INSERT
-- Make one in Engineering, one in Finance, one in Marketing
-- Write your answer below:


-- Exercise 5: YOUR TURN - Insert an employee that will FAIL
-- Try to break a constraint (NOT NULL, UNIQUE, or CHECK)
-- Write the failing INSERT and explain WHY it fails in a comment:


-- Verify your inserts:
SELECT * FROM employees;
SELECT COUNT(*) AS total FROM employees;
