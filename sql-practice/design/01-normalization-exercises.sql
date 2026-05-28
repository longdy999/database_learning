-- ============================================================
-- NORMALIZATION EXERCISES
-- Practice normalizing denormalized tables step by step to 3NF
-- ============================================================

-- ============================================================
-- EXERCISE 1: Online Store Orders (Denormalized)
-- ============================================================

-- BAD TABLE: Everything in one table (violates 1NF, 2NF, 3NF)
CREATE TABLE bad_store_orders (
    order_id INT,
    order_date DATE,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_city VARCHAR(50),
    customer_country VARCHAR(50),
    products VARCHAR(500),        -- "Laptop, Mouse, Keyboard" (NOT atomic!)
    quantities VARCHAR(100),      -- "1, 2, 1" (NOT atomic!)
    prices VARCHAR(100),          -- "999.99, 25.00, 75.00" (NOT atomic!)
    total_amount DECIMAL(10,2),
    shipping_address TEXT
);

-- PROBLEMS:
-- 1. products, quantities, prices are NOT atomic (violates 1NF)
-- 2. customer info repeats for every order (redundancy)
-- 3. Cannot easily query "all orders containing Laptop"
-- 4. Update anomaly: changing customer email requires updating many rows

-- ============================================================
-- STEP 1: Convert to 1NF (atomic values, no repeating groups)
-- ============================================================

-- Split multi-value columns into separate rows
CREATE TABLE store_orders_1nf (
    order_id INT,
    order_date DATE,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_city VARCHAR(50),
    customer_country VARCHAR(50),
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    shipping_address TEXT,
    PRIMARY KEY (order_id, product_name)
);


-- Now each cell has ONE value (atomic) ✓
-- But we still have partial and transitive dependencies

-- ============================================================
-- STEP 2: Convert to 2NF (remove partial dependencies)
-- ============================================================

-- Partial dependency: customer_name depends only on order_id,
-- not on (order_id, product_name)

-- Extract order-level info:
CREATE TABLE orders_2nf (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    customer_city VARCHAR(50),
    customer_country VARCHAR(50),
    total_amount DECIMAL(10,2),
    shipping_address TEXT
);

-- Keep only what depends on FULL composite key:
CREATE TABLE order_items_2nf (
    order_id INT,
    product_name VARCHAR(100),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_name),
    FOREIGN KEY (order_id) REFERENCES orders_2nf(order_id)
);

-- ============================================================
-- STEP 3: Convert to 3NF (remove transitive dependencies)
-- ============================================================

-- Transitive dependency: customer_city depends on customer_name,
-- not directly on order_id

-- Final 3NF design:
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) UNIQUE NOT NULL,
    customer_city VARCHAR(50),
    customer_country VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price > 0)
);

CREATE TABLE orders_3nf (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    total_amount DECIMAL(10,2),
    shipping_address TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items_3nf (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    line_total DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders_3nf(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
-- EXERCISE 2: Employee Training Records (Denormalized)
-- ============================================================

-- BAD TABLE:
CREATE TABLE bad_employee_training (
    emp_id INT,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    dept_manager VARCHAR(100),
    dept_location VARCHAR(50),
    training_name VARCHAR(100),
    training_date DATE,
    trainer_name VARCHAR(100),
    trainer_email VARCHAR(100),
    score INT,
    certificate_issued BOOLEAN
);

-- PROBLEMS:
-- dept_manager depends on department (transitive)
-- trainer_email depends on trainer_name (transitive)
-- emp_name repeats for each training record


-- STEP 1 → 1NF: Already atomic (no multi-value cells), so 1NF is satisfied.

-- STEP 2 → 2NF: Composite key would be (emp_id, training_name).
-- emp_name, department depend only on emp_id (partial dependency).

-- STEP 3 → 3NF: Remove transitive dependencies.

-- FINAL 3NF SOLUTION:
CREATE TABLE departments_ex2 (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    dept_manager VARCHAR(100),
    dept_location VARCHAR(50)
);

CREATE TABLE employees_ex2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_ex2(dept_id)
);

CREATE TABLE trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_name VARCHAR(100) NOT NULL,
    trainer_email VARCHAR(100) UNIQUE
);

CREATE TABLE training_courses (
    training_id INT PRIMARY KEY AUTO_INCREMENT,
    training_name VARCHAR(100) NOT NULL,
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id)
);

CREATE TABLE training_records (
    emp_id INT,
    training_id INT,
    training_date DATE NOT NULL,
    score INT CHECK (score >= 0 AND score <= 100),
    certificate_issued BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (emp_id, training_id),
    FOREIGN KEY (emp_id) REFERENCES employees_ex2(emp_id),
    FOREIGN KEY (training_id) REFERENCES training_courses(training_id)
);


-- ============================================================
-- EXERCISE 3: Hospital Patient Records (Denormalized)
-- ============================================================

-- BAD TABLE:
CREATE TABLE bad_hospital_records (
    patient_id INT,
    patient_name VARCHAR(100),
    patient_phone VARCHAR(20),
    patient_address TEXT,
    doctor_name VARCHAR(100),
    doctor_specialty VARCHAR(50),
    doctor_phone VARCHAR(20),
    appointment_date DATE,
    diagnosis VARCHAR(200),
    medications VARCHAR(500),    -- "Aspirin, Amoxicillin" (NOT atomic!)
    room_number VARCHAR(10),
    room_type VARCHAR(30),
    room_daily_rate DECIMAL(8,2)
);

-- PROBLEMS:
-- 1. medications is not atomic (violates 1NF)
-- 2. doctor_specialty depends on doctor_name (transitive)
-- 3. room_type, room_daily_rate depend on room_number (transitive)
-- 4. patient info repeats for each appointment

-- FINAL 3NF SOLUTION:
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    patient_phone VARCHAR(20),
    patient_address TEXT
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100) NOT NULL,
    doctor_specialty VARCHAR(50),
    doctor_phone VARCHAR(20)
);

CREATE TABLE rooms (
    room_number VARCHAR(10) PRIMARY KEY,
    room_type VARCHAR(30) NOT NULL,
    daily_rate DECIMAL(8,2) NOT NULL CHECK (daily_rate > 0)
);


CREATE TABLE medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    medication_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    diagnosis VARCHAR(200),
    room_number VARCHAR(10),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (room_number) REFERENCES rooms(room_number)
);

CREATE TABLE appointment_medications (
    appointment_id INT,
    medication_id INT,
    dosage VARCHAR(50),
    frequency VARCHAR(50),
    PRIMARY KEY (appointment_id, medication_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

-- ============================================================
-- VERIFICATION: Check your normalized tables
-- ============================================================
-- For each final table, verify:
-- ✓ Every cell contains atomic (single) values → 1NF
-- ✓ No partial dependencies (all columns depend on full PK) → 2NF
-- ✓ No transitive dependencies (no non-key → non-key) → 3NF
-- ✓ Foreign keys maintain referential integrity
-- ✓ Appropriate constraints are applied (NOT NULL, CHECK, UNIQUE)
