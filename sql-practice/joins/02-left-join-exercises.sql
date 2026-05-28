-- ============================================
-- LEFT JOIN and Anti-Join Exercises
-- Database Learning Repository
-- Topic: LEFT JOIN, finding unmatched rows
-- ============================================

-- SETUP: Create sample tables for practice

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50),
    registered_date DATE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'pending'
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    unit_price DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO customers (name, email, city, registered_date) VALUES
('Sokha Meas', 'sokha@email.com', 'Phnom Penh', '2023-01-10'),
('Dara Pich', 'dara@email.com', 'Siem Reap', '2023-02-15'),
('Vanna Tep', 'vanna@email.com', 'Phnom Penh', '2023-03-20'),
('Bopha Keo', 'bopha@email.com', 'Battambang', '2023-04-01'),
('Rith Sorn', 'rith@email.com', 'Kampot', '2023-05-10'),
('Maly Chan', 'maly@email.com', 'Phnom Penh', '2023-06-15');


INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 899.99),
('Mouse', 'Electronics', 29.99),
('Desk Chair', 'Furniture', 249.99),
('Notebook', 'Stationery', 5.99),
('Monitor', 'Electronics', 399.99),
('Pen Set', 'Stationery', 12.99);

INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-01-15', 929.98, 'completed'),
(1, '2024-02-20', 249.99, 'completed'),
(2, '2024-01-25', 29.99, 'completed'),
(3, '2024-03-01', 899.99, 'pending'),
(3, '2024-03-15', 18.98, 'completed');
-- Note: Customers 4, 5, 6 have NO orders (for anti-join practice)

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 899.99), (1, 2, 1, 29.99),
(2, 3, 1, 249.99),
(3, 2, 1, 29.99),
(4, 1, 1, 899.99),
(5, 4, 2, 5.99), (5, 6, 1, 12.99);

-- ============================================
-- EXERCISES WITH ANSWERS (1-5)
-- ============================================

-- Exercise 1: Show ALL customers with their orders (include those with no orders)
-- ANSWER:
SELECT c.name, c.city, o.id AS order_id, o.total_amount, o.order_date
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;

-- Exercise 2: ANTI-JOIN - Find customers who have NEVER placed an order
-- ANSWER:
SELECT c.name, c.email, c.city
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;


-- Exercise 3: Show all products and how many times each has been ordered
-- Products never ordered should show 0
-- ANSWER:
SELECT p.product_name, p.category, COALESCE(SUM(oi.quantity), 0) AS times_ordered
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.product_name, p.category;

-- Exercise 4: ANTI-JOIN - Find products that have never been ordered
-- ANSWER:
SELECT p.product_name, p.category, p.price
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
WHERE oi.id IS NULL;

-- Exercise 5: Show all customers with their total spending (0 if no orders)
-- ANSWER:
SELECT c.name, c.city, COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name, c.city
ORDER BY total_spent DESC;

-- ============================================
-- EXERCISES FOR YOU TO COMPLETE (6-10)
-- ============================================

-- Exercise 6: Show ALL customers with their most recent order date
-- Customers with no orders should show NULL for the date
-- YOUR ANSWER:


-- Exercise 7: ANTI-JOIN - Find categories of products that have never been sold
-- YOUR ANSWER:


-- Exercise 8: Show all customers and count how many orders each has (0 if none)
-- YOUR ANSWER:


-- Exercise 9: Show ALL products with customer names who ordered them
-- Include products never ordered (they'll show NULL for customer)
-- YOUR ANSWER:


-- Exercise 10: Find customers who registered in 2023 but never placed an order
-- Combine anti-join with a WHERE filter on registration date
-- YOUR ANSWER:

