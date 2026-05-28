-- =====================================================
-- SQL Practice: SELECT and WHERE Exercises
-- Level: Month 1 Basics
-- =====================================================

-- Setup: Create and populate a practice table
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    price REAL NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    supplier TEXT,
    is_active INTEGER NOT NULL DEFAULT 1
);

INSERT INTO products (name, category, price, stock, supplier) VALUES
    ('Wireless Mouse', 'Electronics', 29.99, 50, 'TechSupply'),
    ('USB Keyboard', 'Electronics', 45.00, 30, 'TechSupply'),
    ('Desk Lamp', 'Furniture', 35.50, 20, 'HomeGoods'),
    ('Monitor 24"', 'Electronics', 299.99, 8, 'TechSupply'),
    ('Notebook A5', 'Stationery', 4.99, 200, NULL),
    ('Pen Pack', 'Stationery', 7.50, 150, 'OfficePro'),
    ('Standing Desk', 'Furniture', 450.00, 5, 'HomeGoods'),
    ('Webcam HD', 'Electronics', 89.99, 15, NULL),
    ('Ergo Chair', 'Furniture', 350.00, 3, 'HomeGoods'),
    ('Sticky Notes', 'Stationery', 2.99, 500, 'OfficePro');

-- Exercise 1: Select all products
SELECT * FROM products;

-- Exercise 2: Select only name and price
SELECT name, price FROM products;

-- Exercise 3: Find products in Electronics category
SELECT * FROM products WHERE category = 'Electronics';

-- Exercise 4: Find products priced over $50
SELECT name, price FROM products WHERE price > 50;

-- Exercise 5: Find products with stock less than 10
SELECT name, stock FROM products WHERE stock < 10;

-- Exercise 6: Find products NOT in Stationery
SELECT name, category FROM products WHERE category != 'Stationery';

-- Exercise 7: Find Electronics OR Furniture products under $100
SELECT name, category, price FROM products
WHERE (category = 'Electronics' OR category = 'Furniture') AND price < 100;

-- Exercise 8: Find products with no supplier (NULL)
SELECT name, category FROM products WHERE supplier IS NULL;

-- Exercise 9: Find products priced BETWEEN $10 and $100
SELECT name, price FROM products WHERE price BETWEEN 10 AND 100;

-- Exercise 10: Find products from TechSupply OR OfficePro
SELECT name, supplier FROM products WHERE supplier IN ('TechSupply', 'OfficePro');

-- YOUR TURN - Write 5 more queries:
-- 11. Find products with stock >= 50
-- 12. Find Furniture products with price > 300
-- 13. Find products where supplier IS NOT NULL and price < 50
-- 14. Find products NOT in Electronics using NOT IN
-- 15. Find the most expensive product (hint: ORDER BY ... LIMIT 1)
