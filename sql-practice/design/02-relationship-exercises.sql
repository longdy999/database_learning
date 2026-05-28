-- ============================================================
-- RELATIONSHIP DESIGN EXERCISES
-- Practice creating 5 different relationship types
-- with sample data and verification queries
-- ============================================================

-- ============================================================
-- EXERCISE 1: One-to-One (1:1) — User and User Profile
-- Each user has exactly one profile, each profile belongs to one user
-- ============================================================

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE user_profiles (
    profile_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE NOT NULL,
    full_name VARCHAR(100),
    bio TEXT,
    avatar_url VARCHAR(255),
    date_of_birth DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Sample Data:
INSERT INTO users (username, email, password_hash) VALUES
('john_dev', 'john@example.com', 'hashed_pw_1'),
('sarah_dba', 'sarah@example.com', 'hashed_pw_2'),
('mike_analyst', 'mike@example.com', 'hashed_pw_3');

INSERT INTO user_profiles (user_id, full_name, bio, date_of_birth) VALUES
(1, 'John Smith', 'Full-stack developer', '1990-05-15'),
(2, 'Sarah Johnson', 'Database administrator', '1988-11-22'),
(3, 'Mike Chen', 'Data analyst', '1995-03-08');

-- Verification Query: Show users with their profiles
SELECT u.username, u.email, p.full_name, p.bio
FROM users u
JOIN user_profiles p ON u.user_id = p.user_id;


-- ============================================================
-- EXERCISE 2: One-to-Many (1:N) — Department and Employees
-- One department has many employees, each employee belongs to one dept
-- ============================================================

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    budget DECIMAL(12,2) DEFAULT 0
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    salary DECIMAL(10,2) CHECK (salary > 0),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL
);

-- Sample Data:
INSERT INTO departments (dept_name, location, budget) VALUES
('Engineering', 'Building A', 500000.00),
('Marketing', 'Building B', 300000.00),
('Human Resources', 'Building A', 200000.00);

INSERT INTO employees (first_name, last_name, email, hire_date, salary, dept_id) VALUES
('Alice', 'Wong', 'alice@company.com', '2022-01-15', 85000, 1),
('Bob', 'Martin', 'bob@company.com', '2021-06-01', 92000, 1),
('Carol', 'Davis', 'carol@company.com', '2023-03-10', 78000, 2),
('David', 'Lee', 'david@company.com', '2020-09-20', 65000, 3),
('Eva', 'Garcia', 'eva@company.com', '2022-11-05', 88000, 1);

-- Verification Queries:
-- Count employees per department
SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- List all employees with their department name
SELECT e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
ORDER BY d.dept_name, e.last_name;


-- ============================================================
-- EXERCISE 3: Many-to-Many (M:N) — Students and Courses
-- Many students can enroll in many courses
-- Junction table: enrollments
-- ============================================================

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_year INT NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3 CHECK (credits > 0),
    max_students INT DEFAULT 30
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT (CURRENT_DATE),
    grade CHAR(2),
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('active','completed','dropped')),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

-- Sample Data:
INSERT INTO students (first_name, last_name, email, enrollment_year) VALUES
('Sophea', 'Kim', 'sophea@university.edu', 2023),
('Dara', 'Sok', 'dara@university.edu', 2023),
('Chanthy', 'Phan', 'chanthy@university.edu', 2022),
('Virak', 'Heng', 'virak@university.edu', 2024);

INSERT INTO courses (course_code, course_name, credits) VALUES
('CS101', 'Intro to Computer Science', 3),
('DB201', 'Database Systems', 4),
('WEB301', 'Web Development', 3),
('MATH101', 'Calculus I', 4);


INSERT INTO enrollments (student_id, course_id, grade, status) VALUES
(1, 1, 'A', 'completed'),
(1, 2, 'B+', 'active'),
(2, 1, 'A-', 'completed'),
(2, 2, NULL, 'active'),
(2, 3, NULL, 'active'),
(3, 2, 'A', 'completed'),
(3, 4, 'B', 'completed'),
(4, 1, NULL, 'active'),
(4, 3, NULL, 'active');

-- Verification Queries:
-- Show all students with their courses
SELECT s.first_name, s.last_name, c.course_code, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.last_name, c.course_code;

-- Count students per course
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- ============================================================
-- EXERCISE 4: One-to-Many (1:N) with CASCADE — Blog Posts & Comments
-- One post has many comments; deleting a post removes its comments
-- ============================================================

CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    author_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'draft',
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);


CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT NOT NULL,
    commenter_name VARCHAR(100) NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE
);

-- Sample Data:
INSERT INTO authors (author_name, email) VALUES
('Tech Writer', 'writer@blog.com'),
('DB Expert', 'expert@blog.com');

INSERT INTO posts (author_id, title, content, status) VALUES
(1, 'Getting Started with SQL', 'SQL is the language...', 'published'),
(1, 'Understanding JOINs', 'JOINs combine rows...', 'published'),
(2, 'Database Design Tips', 'Good design starts...', 'draft');

INSERT INTO comments (post_id, commenter_name, comment_text) VALUES
(1, 'Student1', 'Very helpful, thank you!'),
(1, 'Student2', 'Can you explain more about WHERE?'),
(2, 'DBA_Fan', 'Great explanation of INNER JOIN');

-- Verification: Posts with comment count
SELECT p.title, a.author_name, COUNT(c.comment_id) AS comment_count
FROM posts p
JOIN authors a ON p.author_id = a.author_id
LEFT JOIN comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.title, a.author_name;

-- ============================================================
-- EXERCISE 5: M:N with Extra Attributes — Products and Orders
-- Junction table stores quantity and price at time of order
-- ============================================================

CREATE TABLE product_catalog (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    current_price DECIMAL(10,2) NOT NULL CHECK (current_price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0)
);


CREATE TABLE customer_orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'pending'
        CHECK (status IN ('pending','processing','shipped','delivered','cancelled'))
);

-- Junction table with extra attributes (quantity, price_at_order)
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    price_at_order DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES customer_orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product_catalog(product_id)
);

-- Sample Data:
INSERT INTO product_catalog (product_name, category, current_price, stock_quantity) VALUES
('Laptop Pro', 'Electronics', 1299.99, 50),
('Wireless Mouse', 'Accessories', 29.99, 200),
('USB-C Hub', 'Accessories', 49.99, 150),
('Monitor 27"', 'Electronics', 399.99, 75);

INSERT INTO customer_orders (customer_name, customer_email, status) VALUES
('Sokha Meas', 'sokha@email.com', 'delivered'),
('Bopha Chan', 'bopha@email.com', 'processing');

INSERT INTO order_items (order_id, product_id, quantity, price_at_order) VALUES
(1, 1, 1, 1299.99),
(1, 2, 2, 29.99),
(1, 3, 1, 49.99),
(2, 4, 2, 399.99),
(2, 2, 1, 29.99);


-- Verification Queries:
-- Order summary with total per order
SELECT o.order_id, o.customer_name, o.status,
    SUM(oi.quantity * oi.price_at_order) AS order_total
FROM customer_orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_name, o.status;

-- Detailed order breakdown
SELECT o.customer_name, p.product_name, oi.quantity,
    oi.price_at_order, (oi.quantity * oi.price_at_order) AS line_total
FROM customer_orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN product_catalog p ON oi.product_id = p.product_id
ORDER BY o.order_id, p.product_name;

-- Most popular products by quantity ordered
SELECT p.product_name, SUM(oi.quantity) AS total_ordered
FROM product_catalog p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_ordered DESC;

-- ============================================================
-- SUMMARY OF RELATIONSHIP TYPES
-- ============================================================
-- 1:1 → UNIQUE FK on child table (user_profiles.user_id UNIQUE)
-- 1:N → FK on the "many" side (employees.dept_id)
-- M:N → Junction table with composite PK (enrollments)
-- CASCADE → ON DELETE CASCADE removes children automatically
-- Extra attributes → Junction table can have additional columns
