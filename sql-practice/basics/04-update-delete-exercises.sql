-- =====================================================
-- SQL Practice: UPDATE and DELETE Exercises
-- Level: Month 1 Basics
-- =====================================================

-- Setup table
CREATE TABLE inventory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    quantity INTEGER NOT NULL DEFAULT 0,
    status TEXT NOT NULL DEFAULT 'active'
        CHECK(status IN ('active', 'discontinued', 'out_of_stock'))
);

INSERT INTO inventory (product_name, category, price, quantity, status) VALUES
    ('Laptop Pro', 'Electronics', 1299.99, 10, 'active'),
    ('Basic Mouse', 'Electronics', 9.99, 200, 'active'),
    ('Old Printer', 'Electronics', 89.99, 0, 'discontinued'),
    ('Wooden Desk', 'Furniture', 399.00, 5, 'active'),
    ('Plastic Chair', 'Furniture', 45.00, 0, 'out_of_stock'),
    ('Premium Pen', 'Stationery', 24.99, 50, 'active'),
    ('Fax Machine', 'Electronics', 199.99, 0, 'discontinued'),
    ('LED Monitor', 'Electronics', 249.99, 12, 'active');

-- =====================================================
-- UPDATE Exercises
-- =====================================================

-- Exercise 1: Increase price of Laptop Pro by 10%
-- SAFE: Verify first
SELECT * FROM inventory WHERE id = 1;
UPDATE inventory SET price = price * 1.10 WHERE id = 1;

-- Exercise 2: Change status to 'out_of_stock' where quantity = 0
SELECT * FROM inventory WHERE quantity = 0;
UPDATE inventory SET status = 'out_of_stock' WHERE quantity = 0;

-- Exercise 3: YOUR TURN - Give all Stationery items 20% price increase
-- Write SELECT first, then UPDATE:


-- Exercise 4: YOUR TURN - Update LED Monitor quantity to 20
-- Write SELECT first, then UPDATE:


-- =====================================================
-- DELETE Exercises
-- =====================================================

-- Exercise 5: Delete discontinued items with 0 quantity
-- SAFE PATTERN:
SELECT * FROM inventory WHERE status = 'discontinued' AND quantity = 0;
DELETE FROM inventory WHERE status = 'discontinued' AND quantity = 0;

-- Exercise 6: YOUR TURN - Delete the Plastic Chair (it's broken)
-- Write SELECT first, then DELETE:


-- Exercise 7: YOUR TURN - Soft delete instead of hard delete
-- Instead of DELETE, update status to 'discontinued' for Basic Mouse:


-- Final verification
SELECT * FROM inventory;
SELECT COUNT(*) AS remaining_items FROM inventory;
