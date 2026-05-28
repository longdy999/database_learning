-- ============================================
-- INNER JOIN Exercises
-- Database Learning Repository
-- Topic: INNER JOIN fundamentals
-- ============================================

-- SETUP: Create sample tables for practice
-- Run this section first to create your practice data.

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    department_id INT REFERENCES departments(id),
    salary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    department_id INT REFERENCES departments(id),
    budget DECIMAL(12,2),
    start_date DATE
);

-- Insert sample data
INSERT INTO departments (name, location) VALUES
('Engineering', 'Building A'),
('Marketing', 'Building B'),
('Sales', 'Building C'),
('HR', 'Building A'),
('Finance', 'Building D');


INSERT INTO employees (first_name, last_name, email, department_id, salary, hire_date) VALUES
('Sokha', 'Chan', 'sokha@company.com', 1, 75000, '2022-01-15'),
('Dara', 'Kim', 'dara@company.com', 1, 82000, '2021-06-01'),
('Vanna', 'Sok', 'vanna@company.com', 2, 65000, '2023-03-10'),
('Bopha', 'Lim', 'bopha@company.com', 3, 70000, '2022-08-20'),
('Rith', 'Phan', 'rith@company.com', 3, 68000, '2023-01-05'),
('Maly', 'Heng', 'maly@company.com', 4, 60000, '2021-11-15'),
('Chenda', 'Rath', 'chenda@company.com', NULL, 55000, '2023-06-01'),
('Pisey', 'Noun', 'pisey@company.com', 1, 90000, '2020-04-10');

INSERT INTO projects (project_name, department_id, budget, start_date) VALUES
('Website Redesign', 1, 50000, '2024-01-01'),
('Social Media Campaign', 2, 30000, '2024-02-15'),
('Sales Dashboard', 3, 25000, '2024-03-01'),
('Employee Portal', 4, 40000, '2024-01-20'),
('Mobile App', 1, 80000, '2024-04-01');

-- ============================================
-- EXERCISES WITH ANSWERS (1-5)
-- Practice these, then check your answers below
-- ============================================

-- Exercise 1: List all employees with their department names
-- Expected: Shows employee name and department name (excludes Chenda who has no dept)
-- ANSWER:
SELECT e.first_name, e.last_name, d.name AS department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

-- Exercise 2: Show all projects with the department name and location
-- ANSWER:
SELECT p.project_name, d.name AS department, d.location
FROM projects p
INNER JOIN departments d ON p.department_id = d.id;


-- Exercise 3: Find all employees in the Engineering department
-- ANSWER:
SELECT e.first_name, e.last_name, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
WHERE d.name = 'Engineering';

-- Exercise 4: Show projects with a budget over 35000 and their department location
-- ANSWER:
SELECT p.project_name, p.budget, d.location
FROM projects p
INNER JOIN departments d ON p.department_id = d.id
WHERE p.budget > 35000;

-- Exercise 5: List employees and the projects in their department
-- ANSWER:
SELECT e.first_name, e.last_name, p.project_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN projects p ON d.id = p.department_id;

-- ============================================
-- EXERCISES FOR YOU TO COMPLETE (6-10)
-- Write the SQL query for each exercise
-- ============================================

-- Exercise 6: Find all employees hired after 2022-01-01 with their department names
-- YOUR ANSWER:


-- Exercise 7: Show departments that have projects with a budget over 40000
-- YOUR ANSWER:


-- Exercise 8: List employees with salary above 70000 and their department location
-- YOUR ANSWER:


-- Exercise 9: Find all employees in departments located in 'Building A'
-- YOUR ANSWER:


-- Exercise 10: Show project name, department name, and count of employees in that dept
-- Hint: You'll need GROUP BY
-- YOUR ANSWER:

