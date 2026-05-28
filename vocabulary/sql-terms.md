# SQL Terms - Command Reference

## Month 1 SQL Commands

| Command | Purpose | Example |
|---------|---------|---------|
| CREATE TABLE | Build a new table | `CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT);` |
| INSERT INTO | Add new records | `INSERT INTO users (name) VALUES ('Sokha');` |
| SELECT | Read/retrieve data | `SELECT * FROM users;` |
| UPDATE | Change existing data | `UPDATE users SET name = 'Dara' WHERE id = 1;` |
| DELETE | Remove records | `DELETE FROM users WHERE id = 1;` |
| WHERE | Filter rows by condition | `SELECT * FROM users WHERE age > 18;` |
| AND | Both conditions must be true | `WHERE age > 18 AND city = 'PP';` |
| OR | At least one condition true | `WHERE city = 'PP' OR city = 'SR';` |
| IN | Match any value in a list | `WHERE city IN ('PP', 'SR', 'BB');` |
| BETWEEN | Match a range (inclusive) | `WHERE price BETWEEN 10 AND 50;` |
| IS NULL | Check for missing data | `WHERE email IS NULL;` |
| IS NOT NULL | Check data exists | `WHERE phone IS NOT NULL;` |
| AS | Create column alias | `SELECT name AS "Full Name" FROM users;` |
| PRIMARY KEY | Unique row identifier | `id INTEGER PRIMARY KEY` |
| AUTOINCREMENT | Auto-assign next number | `id INTEGER PRIMARY KEY AUTOINCREMENT` |
| NOT NULL | Prevent empty values | `name TEXT NOT NULL` |
| UNIQUE | Prevent duplicates | `email TEXT UNIQUE` |
| DEFAULT | Set automatic value | `status TEXT DEFAULT 'active'` |
| CHECK | Custom validation | `CHECK(age > 0)` |

---

## SQL Syntax Patterns to Memorize

```sql
-- Pattern 1: Create
CREATE TABLE table_name (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    column_name DATA_TYPE CONSTRAINT
);

-- Pattern 2: Insert
INSERT INTO table_name (col1, col2) VALUES (val1, val2);

-- Pattern 3: Read
SELECT col1, col2 FROM table_name WHERE condition;

-- Pattern 4: Update (always use WHERE!)
UPDATE table_name SET col = value WHERE condition;

-- Pattern 5: Delete (always use WHERE!)
DELETE FROM table_name WHERE condition;
```
