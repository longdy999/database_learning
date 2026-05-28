-- ============================================
-- GROUP BY and Aggregate Functions Exercises
-- Database Learning Repository
-- Topics: COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING
-- ============================================

-- SETUP: Create sample tables

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    salesperson VARCHAR(50) NOT NULL,
    region VARCHAR(30),
    product_category VARCHAR(30),
    sale_amount DECIMAL(10,2),
    sale_date DATE,
    units_sold INT
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    course VARCHAR(50),
    grade DECIMAL(4,1),
    enrollment_year INT
);

-- Insert sales data
INSERT INTO sales (salesperson, region, product_category, sale_amount, sale_date, units_sold) VALUES
('Sokha', 'North', 'Electronics', 1500.00, '2024-01-15', 3),
('Sokha', 'North', 'Furniture', 800.00, '2024-01-20', 2),
('Dara', 'South', 'Electronics', 2200.00, '2024-01-18', 5),
('Dara', 'South', 'Stationery', 150.00, '2024-02-01', 10),
('Vanna', 'East', 'Electronics', 1800.00, '2024-02-10', 4),
('Vanna', 'East', 'Furniture', 3200.00, '2024-02-15', 8),
('Bopha', 'West', 'Stationery', 300.00, '2024-02-20', 15),
('Bopha', 'West', 'Electronics', 900.00, '2024-03-01', 2),
('Sokha', 'North', 'Electronics', 2000.00, '2024-03-05', 4),
('Dara', 'South', 'Furniture', 1500.00, '2024-03-10', 3),
('Rith', 'North', 'Electronics', 1100.00, '2024-03-15', 2),
('Rith', 'North', 'Stationery', 200.00, '2024-03-20', 8);


-- Insert student data
INSERT INTO students (name, course, grade, enrollment_year) VALUES
('Ary', 'Database', 85.5, 2022),
('Bora', 'Database', 92.0, 2022),
('Chea', 'Web Dev', 78.0, 2023),
('Dany', 'Web Dev', 88.5, 2023),
('Eva', 'Database', 71.0, 2023),
('Fay', 'Networking', 90.0, 2022),
('Gina', 'Networking', 65.0, 2023),
('Hak', 'Web Dev', 95.0, 2022),
('Ith', 'Database', 80.0, 2023),
('Jay', 'Networking', 82.0, 2023);

-- ============================================
-- EXERCISES WITH ANSWERS (1-5)
-- ============================================

-- Exercise 1: Count total sales and total revenue across all records
-- ANSWER:
SELECT COUNT(*) AS total_sales,
       SUM(sale_amount) AS total_revenue,
       AVG(sale_amount) AS avg_sale
FROM sales;

-- Exercise 2: Find total revenue and average sale amount per salesperson
-- ANSWER:
SELECT salesperson,
       COUNT(*) AS num_sales,
       SUM(sale_amount) AS total_revenue,
       ROUND(AVG(sale_amount), 2) AS avg_sale
FROM sales
GROUP BY salesperson
ORDER BY total_revenue DESC;

-- Exercise 3: Find the region with the highest total units sold
-- ANSWER:
SELECT region, SUM(units_sold) AS total_units
FROM sales
GROUP BY region
ORDER BY total_units DESC
LIMIT 1;


-- Exercise 4: Show product categories with total revenue over $2000 (using HAVING)
-- ANSWER:
SELECT product_category,
       SUM(sale_amount) AS category_revenue
FROM sales
GROUP BY product_category
HAVING SUM(sale_amount) > 2000
ORDER BY category_revenue DESC;

-- Exercise 5: Find MIN, MAX, and AVG grade per course
-- ANSWER:
SELECT course,
       MIN(grade) AS lowest_grade,
       MAX(grade) AS highest_grade,
       ROUND(AVG(grade), 1) AS avg_grade,
       COUNT(*) AS num_students
FROM students
GROUP BY course;

-- ============================================
-- EXERCISES FOR YOU TO COMPLETE (6-10)
-- ============================================

-- Exercise 6: Find the total revenue per region per product category
-- (GROUP BY two columns)
-- YOUR ANSWER:


-- Exercise 7: Find salespersons who have made more than 2 sales (use HAVING)
-- Show their name and number of sales
-- YOUR ANSWER:


-- Exercise 8: Find the average grade per enrollment year
-- Only include years where the average grade is above 80
-- YOUR ANSWER:


-- Exercise 9: Show monthly sales totals (group by month of sale_date)
-- Include month, total revenue, and number of transactions
-- Hint: Use EXTRACT(MONTH FROM sale_date) or DATE_TRUNC
-- YOUR ANSWER:


-- Exercise 10: Find the top-performing salesperson in each region
-- Show region, salesperson, and their total revenue
-- Hint: This is advanced - you may need a subquery or window function
-- YOUR ANSWER:

