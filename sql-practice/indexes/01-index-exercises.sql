-- ============================================================
-- 01-index-exercises.sql
-- Index Creation and Performance Analysis Exercises
-- ============================================================
-- Goal: Learn to create indexes, analyze queries with EXPLAIN,
-- and measure performance improvements.
-- ============================================================

-- ============================================================
-- SETUP: Create sample tables
-- ============================================================

CREATE TABLE IF NOT EXISTS products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INTEGER,
    supplier_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(12,2),
    status VARCHAR(50) DEFAULT 'pending',
    shipping_city VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id),
    product_id INTEGER REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Insert sample data (10,000 products, 50,000 orders)
-- In real practice, use generate_series or a data generator
INSERT INTO products (product_name, category, price, stock_quantity, supplier_id)
SELECT
    'Product ' || i,
    CASE (i % 5)

        WHEN 0 THEN 'Electronics'
        WHEN 1 THEN 'Clothing'
        WHEN 2 THEN 'Food'
        WHEN 3 THEN 'Books'
        WHEN 4 THEN 'Sports'
    END,
    (random() * 500 + 1)::DECIMAL(10,2),
    (random() * 1000)::INTEGER,
    (random() * 50 + 1)::INTEGER
FROM generate_series(1, 10000) AS i;

INSERT INTO orders (customer_id, order_date, total_amount, status, shipping_city)
SELECT
    (random() * 5000 + 1)::INTEGER,
    CURRENT_DATE - (random() * 365)::INTEGER,
    (random() * 1000 + 10)::DECIMAL(12,2),
    CASE (i % 4)
        WHEN 0 THEN 'pending'
        WHEN 1 THEN 'shipped'
        WHEN 2 THEN 'delivered'
        WHEN 3 THEN 'cancelled'
    END,
    CASE (i % 5)
        WHEN 0 THEN 'Phnom Penh'
        WHEN 1 THEN 'Siem Reap'
        WHEN 2 THEN 'Battambang'
        WHEN 3 THEN 'Sihanoukville'
        WHEN 4 THEN 'Kampong Cham'
    END
FROM generate_series(1, 50000) AS i;

-- ============================================================
-- DEMONSTRATION 1: Query WITHOUT index
-- ============================================================

-- Step 1: Run EXPLAIN ANALYZE before adding any index
EXPLAIN ANALYZE
SELECT * FROM orders WHERE customer_id = 2500;
-- Expected: Seq Scan (sequential scan of all 50,000 rows)
-- Note the cost and actual time


-- Step 2: Create index
CREATE INDEX idx_orders_customer_id ON orders(customer_id);

-- Step 3: Run EXPLAIN ANALYZE after adding index
EXPLAIN ANALYZE
SELECT * FROM orders WHERE customer_id = 2500;
-- Expected: Index Scan using idx_orders_customer_id
-- Compare the cost and time — should be dramatically lower!

-- ============================================================
-- DEMONSTRATION 2: Composite index
-- ============================================================

EXPLAIN ANALYZE
SELECT * FROM orders WHERE status = 'pending' AND shipping_city = 'Phnom Penh';
-- Before: Seq Scan with two filters

CREATE INDEX idx_orders_status_city ON orders(status, shipping_city);

EXPLAIN ANALYZE
SELECT * FROM orders WHERE status = 'pending' AND shipping_city = 'Phnom Penh';
-- After: Index Scan — much faster!

-- ============================================================
-- DEMONSTRATION 3: Partial index
-- ============================================================

EXPLAIN ANALYZE
SELECT * FROM orders WHERE status = 'pending' ORDER BY order_date;
-- Before: Seq Scan + Sort

CREATE INDEX idx_orders_pending ON orders(order_date) WHERE status = 'pending';

EXPLAIN ANALYZE
SELECT * FROM orders WHERE status = 'pending' ORDER BY order_date;
-- After: Index Scan (smaller index, very fast)


-- ============================================================
-- DEMONSTRATION 4: Index on JOIN columns
-- ============================================================

EXPLAIN ANALYZE
SELECT o.order_id, o.order_date, p.product_name
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.customer_id = 1000;
-- Before: May show Hash Join with Seq Scans

CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

EXPLAIN ANALYZE
SELECT o.order_id, o.order_date, p.product_name
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.customer_id = 1000;
-- After: Nested Loop with Index Scans — much faster!

-- ============================================================
-- DEMONSTRATION 5: Covering index (Index Only Scan)
-- ============================================================

-- When the index contains ALL columns needed by the query:
CREATE INDEX idx_orders_cust_date ON orders(customer_id, order_date);

EXPLAIN ANALYZE
SELECT customer_id, order_date FROM orders WHERE customer_id = 3000;
-- Expected: Index Only Scan (no table access needed!)


-- ============================================================
-- YOUR TURN: Exercises (Complete these yourself)
-- ============================================================

-- EXERCISE 1:
-- The following query is slow. Run EXPLAIN, create an appropriate index,
-- then verify the improvement.
-- Query: SELECT * FROM products WHERE category = 'Electronics' AND price > 200;

-- Step 1: EXPLAIN ANALYZE (write it here)

-- Step 2: CREATE INDEX (design the best index)

-- Step 3: EXPLAIN ANALYZE again (paste result)

-- EXERCISE 2:
-- Optimize this query with an index:
-- SELECT shipping_city, COUNT(*) FROM orders GROUP BY shipping_city;

-- Your index:

-- EXERCISE 3:
-- Create a partial index that helps ONLY queries about delivered orders:
-- SELECT * FROM orders WHERE status = 'delivered' AND order_date > '2024-06-01';

-- Your partial index:

-- EXERCISE 4:
-- This query needs a covering index for Index Only Scan:
-- SELECT product_name, price FROM products WHERE category = 'Books';

-- Your covering index:

-- EXERCISE 5:
-- Design the best index strategy for this complex query:
-- SELECT customer_id, SUM(total_amount)
-- FROM orders
-- WHERE status IN ('shipped', 'delivered')
--   AND order_date BETWEEN '2024-01-01' AND '2024-12-31'
-- GROUP BY customer_id
-- ORDER BY SUM(total_amount) DESC;

-- Your index (explain your reasoning in a comment):
