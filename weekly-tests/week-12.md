# Week 12 Test — Design Patterns & Review

## Topics Covered
- Soft delete pattern
- Audit trail pattern
- Real-world system design
- Naming conventions
- Design review process

---

## Part A: Multiple Choice (5 Questions)

**1. What is a "soft delete"?**
- A) Deleting a table permanently
- B) Marking a record as deleted without removing it from the database
- C) Deleting only the primary key
- D) Using DROP TABLE with IF EXISTS

**2. An audit trail table typically records:**
- A) Only error messages
- B) Who changed what, when, and the old/new values
- C) Only login attempts
- D) Database backup schedules

**3. Which naming convention is most recommended for database tables?**
- A) camelCase (orderItems)
- B) PascalCase (OrderItems)
- C) snake_case (order_items)
- D) UPPERCASE (ORDER_ITEMS)

**4. During a design review, which is the FIRST thing to check?**
- A) Index performance
- B) That requirements are correctly mapped to tables and relationships
- C) Color of the ERD diagram
- D) Number of stored procedures

**5. What column is commonly added for soft delete?**
- A) is_active BOOLEAN
- B) password VARCHAR
- C) row_number INT
- D) table_name VARCHAR


---

## Part B: Short Answer (5 Questions)

**6.** Explain the soft delete pattern. What are its advantages and disadvantages?

**7.** What information should an audit trail table store? Design the columns.

**8.** List 5 naming convention rules for a professional database.

**9.** Describe the steps of a database design review. What do you check?

**10.** A client says: "Just put everything in one big table, it's simpler." How do you explain why that's a bad idea?

---

## Part C: SQL Writing (5 Questions)

**11.** Write a CREATE TABLE for a `products` table with soft delete support (is_deleted flag and deleted_at timestamp).

**12.** Create an `audit_log` table that records: table_name, record_id, action (INSERT/UPDATE/DELETE), old_values, new_values, changed_by, changed_at.

**13.** Write a query that selects only active (non-deleted) products from a soft-delete table.

**14.** Design a `users` table following professional naming conventions. Include: id, name, email, status, timestamps for created/updated.

**15.** Write a trigger (or explain the logic) that automatically inserts a record into `audit_log` when a row in `employees` is updated.

---

## Speaking Challenge

A client asks: "Why do we need to keep deleted records? Can't we just remove them?"

Explain in simple terms:
> Why soft delete is important for business data, legal compliance,
> and data recovery. Give a real example.

Practice for 90 seconds.


---

## Answer Key

### Part A: Multiple Choice
1. **B** — Marking as deleted without physically removing
2. **B** — Who, what, when, old/new values
3. **C** — snake_case is the standard convention
4. **B** — First verify requirements map to design correctly
5. **A** — is_active or is_deleted BOOLEAN flag

### Part B: Short Answer

**6.** Soft delete marks records as deleted (using a flag like `is_deleted = TRUE`) instead of removing them. Advantages: data recovery, audit compliance, historical reporting. Disadvantages: queries need WHERE filters, storage grows, complexity increases.

**7.** Audit trail columns:
- `audit_id` (PK), `table_name`, `record_id`, `action_type` (INSERT/UPDATE/DELETE), `old_values` (JSON/TEXT), `new_values` (JSON/TEXT), `performed_by` (user_id), `performed_at` (timestamp), `ip_address` (optional).

**8.** Five naming rules:
1. Use snake_case for tables and columns
2. Use plural nouns for tables (users, orders)
3. Use singular descriptive names for columns (first_name, not fn)
4. Prefix foreign keys with referenced table (user_id, order_id)
5. Use consistent suffixes (_at for timestamps, _id for keys)

**9.** Design review steps:
1. Verify all requirements are represented
2. Check relationships and cardinality
3. Confirm normalization level is appropriate
4. Validate constraints (PK, FK, NOT NULL, CHECK)
5. Review naming conventions
6. Check for missing indexes on search/join columns
7. Verify data types are appropriate

**10.** One big table causes: duplicate data, update anomalies, wasted storage, slow queries, and makes future changes difficult. Splitting into related tables keeps data clean, consistent, and maintainable.


### Part C: SQL Writing

**11.**
```sql
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**12.**
```sql
CREATE TABLE audit_log (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    table_name VARCHAR(50) NOT NULL,
    record_id INT NOT NULL,
    action_type VARCHAR(10) NOT NULL CHECK (action_type IN ('INSERT','UPDATE','DELETE')),
    old_values TEXT,
    new_values TEXT,
    changed_by INT NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**13.**
```sql
SELECT product_id, product_name, price
FROM products
WHERE is_deleted = FALSE
ORDER BY product_name;
```

**14.**
```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```


**15.** Trigger logic (MySQL syntax):
```sql
CREATE TRIGGER trg_employees_audit
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (table_name, record_id, action_type,
        old_values, new_values, changed_by, changed_at)
    VALUES (
        'employees',
        OLD.emp_id,
        'UPDATE',
        CONCAT('name:', OLD.emp_name, ',salary:', OLD.salary),
        CONCAT('name:', NEW.emp_name, ',salary:', NEW.salary),
        CURRENT_USER(),
        NOW()
    );
END;
```

---

## Scoring
- Part A: 2 points each = 10 points
- Part B: 4 points each = 20 points
- Part C: 6 points each = 30 points
- Speaking Challenge: 10 points
- **Total: 70 points** | Pass: 49+ points
