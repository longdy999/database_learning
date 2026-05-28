# Common Mistakes to Avoid

## Month 1 Mistakes

### 1. Forgetting the semicolon
```sql
-- WRONG:
SELECT * FROM users
-- CORRECT:
SELECT * FROM users;
```

### 2. Spaces in table/column names
```sql
-- WRONG:
CREATE TABLE student grades (...)
-- CORRECT:
CREATE TABLE student_grades (...)
```

### 3. No primary key
Every table MUST have a primary key. No exceptions in professional work.

### 4. UPDATE without WHERE
```sql
-- DANGEROUS: Changes ALL rows!
UPDATE products SET price = 0;
-- SAFE: Changes only one row
UPDATE products SET price = 0 WHERE id = 5;
```

### 5. DELETE without WHERE
```sql
-- DANGEROUS: Deletes ALL rows!
DELETE FROM products;
-- SAFE: Deletes only matching rows
DELETE FROM products WHERE id = 5;
```

### 6. Using = NULL instead of IS NULL
```sql
-- WRONG: Returns nothing!
SELECT * FROM users WHERE email = NULL;
-- CORRECT:
SELECT * FROM users WHERE email IS NULL;
```

### 7. Wrong data types
Don't store numbers as TEXT. Don't store dates as random text formats.

### 8. Inconsistent naming
Pick one style and stick with it:
- Tables: lowercase_plural (users, products, orders)
- Columns: lowercase_underscore (first_name, created_date)

### 9. Not testing constraints
Always test your CHECK and UNIQUE constraints with invalid data to confirm they work.

### 10. Not using comments
```sql
-- GOOD: Explains the purpose
-- Find all active premium customers in Phnom Penh
SELECT * FROM customers
WHERE status = 'active' AND tier = 'premium' AND city = 'Phnom Penh';
```
