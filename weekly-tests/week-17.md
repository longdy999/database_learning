# Week 17 Test

## Topics Covered
- PostgreSQL and MySQL installation and setup
- Data types in PostgreSQL/MySQL vs SQLite
- psql command-line interface
- Key differences between database systems
- Connection strings and configuration

---

## Section A: Multiple Choice (5 Questions)

**1. Which command connects to a PostgreSQL database from the terminal?**
- A) mysql -u root
- B) psql -U username -d dbname
- C) sqlite3 database.db
- D) mongo --host localhost

**2. What data type in PostgreSQL stores TRUE/FALSE values?**
- A) BIT
- B) BOOLEAN
- C) TINYINT(1)
- D) LOGICAL

**3. Which PostgreSQL data type is best for storing currency amounts?**
- A) FLOAT
- B) DOUBLE
- C) NUMERIC(10,2)
- D) MONEY_TEXT

**4. What is the default port for PostgreSQL?**
- A) 3306
- B) 5432
- C) 27017
- D) 1433

**5. Which psql meta-command lists all databases?**
- A) \lt
- B) \db
- C) \l
- D) SHOW DATABASES;

---

## Section B: Short Answer (5 Questions)

**6.** Name three differences between PostgreSQL and SQLite.

**7.** What does the psql command `\dt` do?

**8.** Explain what a connection string contains and why it matters.


**9.** What is the difference between VARCHAR and TEXT in PostgreSQL?

**10.** How do you create a new database in psql?

---

## Section C: SQL Writing (5 Questions)

**11.** Write the psql command to connect to a database called `company_db` as user `admin`:

```sql
-- Your answer here
```

**12.** Create a table using PostgreSQL-specific data types (SERIAL, BOOLEAN, TIMESTAMP):

```sql
-- Your answer here
```

**13.** Write a query that uses PostgreSQL's ILIKE for case-insensitive search:

```sql
-- Your answer here
```

**14.** Write a command to list all tables and their sizes in the current database:

```sql
-- Your answer here
```

**15.** Create a table with a UUID primary key (PostgreSQL feature):

```sql
-- Your answer here
```

---

## Section D: Speaking Challenge

**Scenario:** Your client asks: "Why should we use PostgreSQL instead of SQLite for our web application?"

Prepare a 1-minute explanation covering:
- Concurrent users
- Data types available
- Scalability
- Security features
- Network access

---


## Answer Key

### Section A: Multiple Choice
1. **B** — psql -U username -d dbname
2. **B** — BOOLEAN
3. **C** — NUMERIC(10,2) for precise decimal storage
4. **B** — 5432
5. **C** — \l lists all databases

### Section B: Short Answer
6. Three differences: (1) PostgreSQL supports concurrent users, SQLite does not handle concurrency well; (2) PostgreSQL runs as a server process, SQLite is a file-based embedded database; (3) PostgreSQL has advanced data types (JSONB, arrays, UUID), SQLite has limited types.
7. `\dt` lists all tables in the current schema (public by default).
8. A connection string contains: host, port, database name, username, password. Example: `postgresql://user:pass@localhost:5432/mydb`. It tells the application how to reach the database.
9. VARCHAR has a defined maximum length; TEXT has unlimited length. Both are stored the same in PostgreSQL, but VARCHAR enforces a limit.
10. `CREATE DATABASE company_db;` or from terminal: `createdb company_db`

### Section C: SQL Writing
11. `psql -U admin -d company_db`
12. `CREATE TABLE employees (id SERIAL PRIMARY KEY, name VARCHAR(100), active BOOLEAN DEFAULT TRUE, hired_at TIMESTAMP DEFAULT NOW());`
13. `SELECT * FROM employees WHERE name ILIKE '%smith%';`
14. `SELECT relname, pg_size_pretty(pg_total_relation_size(relid)) FROM pg_catalog.pg_statio_user_tables ORDER BY pg_total_relation_size(relid) DESC;`
15. `CREATE EXTENSION IF NOT EXISTS "uuid-ossp"; CREATE TABLE sessions (id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), user_id INT, created_at TIMESTAMP);`