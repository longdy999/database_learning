-- ============================================
-- SQL Practice: Real-World Reporting Exercises
-- ============================================
-- These exercises simulate real business reporting
-- queries you would write in a professional role.

-- ============================================
-- SETUP: Create Sample Tables
-- ============================================

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    segment VARCHAR(50) DEFAULT 'Standard',
    created_at DATE NOT NULL,
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'completed',
    category VARCHAR(50)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10,2),
    cost NUMERIC(10,2)
);

CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL
);

-- ============================================
-- INSERT SAMPLE DATA
-- ============================================


INSERT INTO customers (name, email, segment, created_at, country) VALUES
('Alice Johnson', 'alice@example.com', 'Premium', '2022-01-15', 'USA'),
('Bob Smith', 'bob@example.com', 'Standard', '2022-03-20', 'Canada'),
('Clara Wong', 'clara@example.com', 'Premium', '2022-06-10', 'USA'),
('David Lee', 'david@example.com', 'Enterprise', '2021-11-01', 'UK'),
('Eve Martinez', 'eve@example.com', 'Standard', '2023-01-05', 'USA'),
('Frank Brown', 'frank@example.com', 'Premium', '2022-09-12', 'Canada'),
('Grace Kim', 'grace@example.com', 'Enterprise', '2021-05-20', 'UK'),
('Henry Chen', 'henry@example.com', 'Standard', '2023-04-18', 'USA');

INSERT INTO orders (customer_id, order_date, amount, status, category) VALUES
(1, '2023-01-15', 250.00, 'completed', 'Electronics'),
(1, '2023-02-20', 180.00, 'completed', 'Books'),
(2, '2023-01-10', 95.00, 'completed', 'Clothing'),
(3, '2023-03-05', 420.00, 'completed', 'Electronics'),
(4, '2023-01-22', 1200.00, 'completed', 'Software'),
(4, '2023-02-14', 800.00, 'completed', 'Software'),
(5, '2023-03-30', 65.00, 'completed', 'Books'),
(6, '2023-02-28', 310.00, 'completed', 'Electronics'),
(7, '2023-01-05', 2500.00, 'completed', 'Software'),
(7, '2023-03-15', 1800.00, 'completed', 'Software'),
(1, '2024-01-20', 275.00, 'completed', 'Electronics'),
(2, '2024-01-15', 120.00, 'completed', 'Clothing'),
(3, '2024-02-10', 380.00, 'completed', 'Electronics'),
(4, '2024-01-30', 1500.00, 'completed', 'Software'),
(5, '2024-02-20', 90.00, 'completed', 'Books'),
(6, '2024-03-05', 440.00, 'completed', 'Electronics'),
(7, '2024-02-18', 2200.00, 'completed', 'Software'),
(8, '2024-03-10', 75.00, 'completed', 'Books');

-- ============================================
-- EXERCISE 1: Monthly Revenue Report (WITH ANSWER)
-- ============================================
-- Task: Calculate total revenue per month for 2024

SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders,
    SUM(amount) AS monthly_revenue,
    ROUND(AVG(amount), 2) AS avg_order_value
FROM orders
WHERE order_date >= '2024-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;


-- ============================================
-- EXERCISE 2: Customer Segmentation (WITH ANSWER)
-- ============================================
-- Task: Classify customers by total spending

SELECT
    c.name,
    c.segment,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_spent,
    CASE
        WHEN SUM(o.amount) >= 2000 THEN 'High Value'
        WHEN SUM(o.amount) >= 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS spending_tier
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.segment
ORDER BY total_spent DESC;

-- ============================================
-- EXERCISE 3: Year-over-Year Growth (WITH ANSWER)
-- ============================================
-- Task: Compare 2024 revenue to 2023 by category

SELECT
    category,
    SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2023 THEN amount ELSE 0 END) AS revenue_2023,
    SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2024 THEN amount ELSE 0 END) AS revenue_2024,
    ROUND(
        (SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2024 THEN amount ELSE 0 END) -
         SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2023 THEN amount ELSE 0 END)) /
        NULLIF(SUM(CASE WHEN EXTRACT(YEAR FROM order_date) = 2023 THEN amount ELSE 0 END), 0) * 100
    , 1) AS growth_percent
FROM orders
GROUP BY category
ORDER BY growth_percent DESC;


-- ============================================
-- EXERCISE 4: KPI Dashboard Query (WITH ANSWER)
-- ============================================
-- Task: Generate key performance indicators for executive dashboard

SELECT
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS total_revenue,
    ROUND(AVG(o.amount), 2) AS avg_order_value,
    ROUND(SUM(o.amount) / COUNT(DISTINCT c.customer_id), 2) AS revenue_per_customer
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= '2024-01-01';

-- ============================================
-- EXERCISE 5: Date-Based Aggregation (WITH ANSWER)
-- ============================================
-- Task: Show weekly order trends for Q1 2024

SELECT
    DATE_TRUNC('week', order_date) AS week_start,
    COUNT(*) AS orders_count,
    SUM(amount) AS weekly_revenue,
    ROUND(AVG(amount), 2) AS avg_amount
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY DATE_TRUNC('week', order_date)
ORDER BY week_start;


-- ============================================
-- EXERCISE 6: Top Products by Revenue (YOUR TURN)
-- ============================================
-- Task: Find the top 5 product categories by total revenue
-- Include: category name, total orders, total revenue, percentage of overall revenue
-- Hint: Use a subquery or window function for percentage

-- Write your query here:


-- ============================================
-- EXERCISE 7: Customer Retention Analysis (YOUR TURN)
-- ============================================
-- Task: Find customers who ordered in both 2023 and 2024
-- Show: customer name, 2023 total, 2024 total, change percentage
-- Hint: Use HAVING with conditional aggregation

-- Write your query here:


-- ============================================
-- EXERCISE 8: Moving Average Revenue (YOUR TURN)
-- ============================================
-- Task: Calculate a 3-month moving average of revenue
-- Show: month, monthly revenue, 3-month moving average
-- Hint: Use window function with ROWS BETWEEN

-- Write your query here:


-- ============================================
-- EXERCISE 9: Country Performance Report (YOUR TURN)
-- ============================================
-- Task: Compare revenue and customer count by country
-- Show: country, customer count, total revenue, avg revenue per customer
-- Rank countries by total revenue
-- Hint: Use JOIN, GROUP BY, and RANK()

-- Write your query here:


-- ============================================
-- EXERCISE 10: Executive Summary Query (YOUR TURN)
-- ============================================
-- Task: Create a single query that returns a full executive summary
-- Include: total customers, new customers this year, total revenue,
--          best month, worst month, top segment
-- Hint: You may use CTEs (WITH clause) to organize subqueries

-- Write your query here:
