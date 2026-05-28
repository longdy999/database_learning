-- =====================================================
-- SQL Practice: CREATE TABLE Exercises
-- Level: Month 1 Basics
-- =====================================================

-- Exercise 1: Create a simple students table
-- Requirements: id (PK), name (not null), age (check > 0), email (unique)
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL CHECK(age > 0),
    email TEXT UNIQUE NOT NULL
);

-- Exercise 2: Create a products table with defaults
-- Requirements: id (PK), name, price (>0), category (default 'General'), stock (default 0)
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    category TEXT NOT NULL DEFAULT 'General',
    stock INTEGER NOT NULL DEFAULT 0 CHECK(stock >= 0)
);

-- Exercise 3: Create an orders table
-- Requirements: id (PK), customer_name, total (>0), status (default 'pending'), order_date
CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_name TEXT NOT NULL,
    total REAL NOT NULL CHECK(total > 0),
    status TEXT NOT NULL DEFAULT 'pending'
        CHECK(status IN ('pending', 'confirmed', 'shipped', 'delivered', 'cancelled')),
    order_date TEXT NOT NULL DEFAULT (date('now'))
);

-- Exercise 4: YOUR TURN - Create an employees table
-- Requirements: id (PK), full_name (not null), email (unique, not null),
-- department (not null), salary (>0), hire_date (not null, default today)
-- Write your answer below:


-- Exercise 5: YOUR TURN - Create a library books table
-- Requirements: id (PK), isbn (unique, not null), title (not null),
-- author (not null), year (check > 1800), available (default 1)
-- Write your answer below:
