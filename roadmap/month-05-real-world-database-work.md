# Month 5: Real-World Database Work

## Theme
Using databases like a professional in real projects.

## Duration
**Days 121-150** (30 days)

---

## Monthly Goals

By the end of Month 5, you will be able to:

1. **Set up and use PostgreSQL or MySQL** for real-world projects
2. **Perform database backups and restores** using professional tools
3. **Implement database security** with users, roles, and permissions
4. **Connect databases to APIs** and understand connection pooling
5. **Write reporting queries** that produce business-ready data
6. **Clean and transform messy data** using SQL techniques

---

## Skills to Master

| Skill | Description | Priority |
|-------|-------------|----------|
| PostgreSQL/MySQL Setup | Install, configure, and connect to production databases | High |
| psql/mysql CLI | Navigate and manage databases from the command line | High |
| Data Type Differences | Understand how types differ between SQLite, PostgreSQL, MySQL | Medium |
| Backup & Restore | Use pg_dump, mysqldump, and restore commands | High |
| Import/Export (CSV) | Load and export data in various formats | High |
| Data Migration | Move data between database systems safely | Medium |
| Data Cleaning | Handle NULLs, duplicates, inconsistent formats | High |
| User Management | Create users, assign roles, grant/revoke permissions | High |
| SQL Injection Prevention | Write safe queries using parameterized statements | Critical |
| Encryption Basics | Understand data-at-rest and data-in-transit encryption | Medium |
| Reporting Queries | Write complex queries for dashboards and reports | High |
| Dashboard Data Preparation | Format query results for visualization tools | Medium |
| API Database Patterns | Understand CRUD operations, pagination, filtering | High |
| Connection Pooling | Manage database connections efficiently | Medium |

---

## Week-by-Week Plan

---


### Week 17: PostgreSQL/MySQL Fundamentals (Days 121-127)

**Focus:** Setting up and working with production-grade databases

| Day | Topic | Key Activity |
|-----|-------|--------------|
| 121 | Introduction to PostgreSQL & MySQL | Compare features, use cases, and popularity |
| 122 | Installing PostgreSQL | Set up PostgreSQL locally, create first database |
| 123 | Installing MySQL | Set up MySQL locally, compare with PostgreSQL |
| 124 | Differences from SQLite | Side-by-side comparison of syntax, types, features |
| 125 | psql CLI Mastery | Navigate databases, run queries, use shortcuts |
| 126 | mysql CLI Mastery | Connect, query, manage databases from terminal |
| 127 | Data Types Comparison | Map SQLite types to PostgreSQL/MySQL equivalents |

**Week 17 Outcomes:**
- PostgreSQL and MySQL installed and running
- Comfortable using psql and mysql command-line tools
- Understand key differences between SQLite, PostgreSQL, and MySQL
- Can create databases, tables, and run queries in all three systems

**Key Commands to Learn:**
```bash
# PostgreSQL
psql -U username -d database_name
\l          -- list databases
\dt         -- list tables
\d table    -- describe table
\q          -- quit

# MySQL
mysql -u username -p
SHOW DATABASES;
SHOW TABLES;
DESCRIBE table_name;
EXIT;
```


**Data Types Comparison Table:**

| Concept | SQLite | PostgreSQL | MySQL |
|---------|--------|------------|-------|
| Integer | INTEGER | INTEGER, BIGINT | INT, BIGINT |
| Decimal | REAL | NUMERIC, DECIMAL | DECIMAL, FLOAT |
| Text | TEXT | VARCHAR, TEXT | VARCHAR, TEXT |
| Boolean | INTEGER (0/1) | BOOLEAN | TINYINT(1) |
| Date | TEXT | DATE, TIMESTAMP | DATE, DATETIME |
| Auto ID | INTEGER PRIMARY KEY | SERIAL, BIGSERIAL | AUTO_INCREMENT |
| JSON | TEXT | JSONB | JSON |

---

### Week 18: Backup, Import/Export & Data Cleaning (Days 128-134)

**Focus:** Professional data management and maintenance

| Day | Topic | Key Activity |
|-----|-------|--------------|
| 128 | Database Backup Concepts | Full vs incremental, scheduling, storage |
| 129 | pg_dump & pg_restore | Back up and restore PostgreSQL databases |
| 130 | mysqldump & Restore | Back up and restore MySQL databases |
| 131 | CSV Import/Export | Load CSV data, export query results |
| 132 | Data Migration Between Systems | Move data from SQLite to PostgreSQL |
| 133 | Data Cleaning: NULLs & Duplicates | Find and fix missing/duplicate data |
| 134 | Data Cleaning: Formatting & Validation | Standardize dates, names, phone numbers |

**Week 18 Outcomes:**
- Can perform full database backups and restores
- Comfortable importing/exporting CSV data
- Can migrate data between different database systems
- Know how to identify and fix common data quality issues


**Key Backup Commands:**
```bash
# PostgreSQL backup and restore
pg_dump -U username database_name > backup.sql
pg_dump -Fc -U username database_name > backup.dump
pg_restore -U username -d database_name backup.dump

# MySQL backup and restore
mysqldump -u username -p database_name > backup.sql
mysql -u username -p database_name < backup.sql
```

**Data Cleaning SQL Patterns:**
```sql
-- Find duplicates
SELECT email, COUNT(*) FROM users
GROUP BY email HAVING COUNT(*) > 1;

-- Handle NULLs
UPDATE customers SET phone = 'N/A' WHERE phone IS NULL;

-- Standardize formats
UPDATE orders SET order_date = DATE(order_date)
WHERE order_date IS NOT NULL;

-- Remove extra whitespace
UPDATE products SET name = TRIM(name);
```

---

### Week 19: Database Security (Days 135-141)

**Focus:** Protecting data with users, roles, permissions, and safe coding

| Day | Topic | Key Activity |
|-----|-------|--------------|
| 135 | Database Security Overview | Threats, layers of protection, best practices |
| 136 | Creating Users & Roles | PostgreSQL/MySQL user and role management |
| 137 | Granting & Revoking Permissions | GRANT, REVOKE, privilege levels |
| 138 | Row-Level Security Basics | Restrict data access by user context |
| 139 | SQL Injection: How It Works | Understand attack vectors and examples |
| 140 | SQL Injection Prevention | Parameterized queries, prepared statements |
| 141 | Encryption Basics | Data-at-rest, data-in-transit, hashing passwords |


**Week 19 Outcomes:**
- Can create users and assign appropriate permissions
- Understand the principle of least privilege
- Can identify and prevent SQL injection attacks
- Understand basic encryption concepts for databases

**Security SQL Examples:**
```sql
-- Create a user (PostgreSQL)
CREATE USER app_reader WITH PASSWORD 'secure_password';
CREATE ROLE reporting_team;

-- Grant permissions
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_reader;
GRANT reporting_team TO app_reader;

-- Revoke permissions
REVOKE DELETE ON customers FROM app_reader;

-- SQL Injection: DANGEROUS (never do this)
-- query = "SELECT * FROM users WHERE name = '" + user_input + "'"

-- SQL Injection: SAFE (always do this)
-- query = "SELECT * FROM users WHERE name = $1"
-- parameters = [user_input]
```

---

### Week 20: Reporting, APIs & Connection Management (Days 142-148)

**Focus:** Using databases in real applications and business reporting

| Day | Topic | Key Activity |
|-----|-------|--------------|
| 142 | Reporting Query Patterns | Summaries, trends, KPIs, date ranges |
| 143 | Dashboard Data Queries | Format data for charts and visualizations |
| 144 | API Database Patterns: CRUD | Map HTTP methods to SQL operations |
| 145 | API Pagination & Filtering | LIMIT, OFFSET, dynamic WHERE clauses |
| 146 | Connection Pooling Basics | Why pooling matters, how it works |
| 147 | Database in Application Architecture | Where the database fits in full-stack apps |
| 148 | Performance in Production | Monitoring slow queries, connection limits |


**Week 20 Outcomes:**
- Can write complex reporting queries for business use
- Understand how APIs interact with databases
- Know what connection pooling is and why it matters
- Can explain database architecture to non-technical people

**Reporting Query Examples:**
```sql
-- Monthly revenue report
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(total_amount) AS revenue,
       COUNT(*) AS order_count
FROM orders
WHERE order_date >= '2024-01-01'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- Top customers by lifetime value
SELECT c.name, COUNT(o.id) AS orders,
       SUM(o.total_amount) AS lifetime_value
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY lifetime_value DESC
LIMIT 10;

-- API pagination pattern
SELECT * FROM products
WHERE category = 'electronics'
ORDER BY created_at DESC
LIMIT 20 OFFSET 40;  -- Page 3, 20 items per page
```

---

### Days 149-150: Review & Mini-Project

**Day 149:** Comprehensive review of all Month 5 topics
- Review PostgreSQL/MySQL differences
- Practice backup and restore procedures
- Review security best practices
- Test reporting query skills


**Day 150:** Mini-Project - Build a complete reporting database
- Design a sales reporting system in PostgreSQL
- Create users with appropriate permissions
- Write 5 reporting queries for a business dashboard
- Document backup procedures
- Export sample reports to CSV

---

## Common Mistakes to Avoid

1. **Using root/admin accounts for application connections** - Always create dedicated users with minimal permissions for each application or service.

2. **Storing passwords in plain text** - Never store raw passwords in your database. Always use hashing algorithms (bcrypt, argon2) for password storage.

3. **Skipping backups or never testing restores** - A backup you have never tested restoring is not a real backup. Schedule regular backup tests.

4. **Building queries with string concatenation** - This creates SQL injection vulnerabilities. Always use parameterized queries or prepared statements.

5. **Ignoring connection limits** - Every database has a maximum number of connections. Without pooling, your application can exhaust connections and crash.

6. **Not cleaning data before importing** - Importing dirty data (duplicates, wrong formats, NULLs) creates problems that compound over time. Always validate first.

7. **Granting excessive permissions** - Follow the principle of least privilege. Give users only the exact permissions they need, nothing more.

---


## Professional Habits to Build

- [ ] Always use version control for database migration scripts
- [ ] Write backup scripts and schedule them (don't rely on memory)
- [ ] Test restore procedures at least once per month
- [ ] Use environment variables for database credentials (never hardcode)
- [ ] Create separate database users for different applications
- [ ] Review and audit permissions quarterly
- [ ] Log all database schema changes
- [ ] Use parameterized queries in every application
- [ ] Monitor slow query logs weekly
- [ ] Document your database architecture and access patterns
- [ ] Practice writing reporting queries that non-technical people can understand
- [ ] Keep a runbook for common database maintenance tasks

---

## End-of-Month Checklist

Before moving to Month 6, confirm you can:

- [ ] Install and configure PostgreSQL or MySQL from scratch
- [ ] Use psql or mysql CLI to manage databases confidently
- [ ] Explain differences between SQLite, PostgreSQL, and MySQL
- [ ] Perform a full backup and successful restore
- [ ] Import and export data using CSV and dump files
- [ ] Migrate data between different database systems
- [ ] Clean messy data (NULLs, duplicates, formatting issues)
- [ ] Create database users and assign appropriate roles
- [ ] Explain SQL injection and demonstrate prevention
- [ ] Write reporting queries with date ranges, aggregations, and rankings
- [ ] Describe how a database connects to an API
- [ ] Explain connection pooling and why it matters
- [ ] Complete the Month 5 mini-project successfully
- [ ] Explain all Month 5 concepts to a non-technical person

---

*Next: [Month 6 - Professional Readiness](month-06-professional-readiness.md)*