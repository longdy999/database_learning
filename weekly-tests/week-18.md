# Week 18 Test

## Topics Covered
- Database backup with pg_dump and mysqldump
- Database restore procedures
- CSV import and export
- Data migration between systems
- Data cleaning techniques

---

## Section A: Multiple Choice (5 Questions)

**1. Which command creates a full backup of a PostgreSQL database?**
- A) pg_backup mydb > backup.sql
- B) pg_dump mydb > backup.sql
- C) psql --backup mydb
- D) BACKUP DATABASE mydb

**2. What does the `--format=custom` flag do in pg_dump?**
- A) Creates a plain text backup
- B) Creates a compressed binary backup that supports selective restore
- C) Creates a CSV export
- D) Creates an XML backup

**3. Which PostgreSQL command imports data from a CSV file?**
- A) LOAD DATA INFILE
- B) IMPORT CSV
- C) \copy table FROM 'file.csv' WITH CSV HEADER
- D) INSERT FROM FILE

**4. What is the correct order for data migration?**
- A) Transfer data → Create schema → Validate
- B) Create schema → Transfer data → Validate
- C) Validate → Create schema → Transfer data
- D) Transfer data → Validate → Create schema

**5. Which SQL function helps clean whitespace from data?**
- A) CLEAN()
- B) TRIM()
- C) STRIP()
- D) REMOVE_SPACE()

---

## Section B: Short Answer (5 Questions)

**6.** What is the difference between pg_dump and pg_dumpall?

**7.** Describe two ways to handle NULL values during data cleaning.


**8.** What is the purpose of the `--clean` flag when restoring a backup?

**9.** Explain the difference between logical and physical backups.

**10.** What steps would you take to clean duplicate records from a table?

---

## Section C: SQL Writing (5 Questions)

**11.** Write a pg_dump command to backup only the `customers` table:

```bash
# Your answer here
```

**12.** Write a COPY command to export query results to CSV:

```sql
-- Your answer here
```

**13.** Write a query to find and remove duplicate email records (keep lowest ID):

```sql
-- Your answer here
```

**14.** Write a query to replace NULL values with defaults during data cleaning:

```sql
-- Your answer here
```

**15.** Write the command to restore a database from a custom-format backup:

```bash
# Your answer here
```

---

## Section D: Speaking Challenge

**Scenario:** A client asks: "How often should we back up our database, and what strategy do you recommend?"

Prepare a 1-minute explanation covering:
- Full vs incremental backups
- Backup frequency recommendations
- Testing restore procedures
- Off-site storage
- Recovery time objectives (RTO)

---


## Answer Key

### Section A: Multiple Choice
1. **B** — pg_dump mydb > backup.sql
2. **B** — Creates a compressed binary backup with selective restore
3. **C** — \copy table FROM 'file.csv' WITH CSV HEADER
4. **B** — Create schema → Transfer data → Validate
5. **B** — TRIM()

### Section B: Short Answer
6. `pg_dump` backs up a single database; `pg_dumpall` backs up all databases on the server including roles and tablespaces.
7. (1) Use COALESCE to replace NULLs with default values: `COALESCE(phone, 'N/A')`; (2) Use UPDATE to fill NULLs: `UPDATE customers SET phone = 'Unknown' WHERE phone IS NULL;`
8. The `--clean` flag drops existing database objects before recreating them, ensuring a clean restore without conflicts.
9. Logical backups export SQL statements (pg_dump); physical backups copy actual data files (pg_basebackup). Logical are portable but slower; physical are faster but less flexible.
10. Steps: (1) Identify duplicates with GROUP BY/HAVING; (2) Keep the row with lowest ID; (3) DELETE using a subquery or CTE that targets higher IDs.

### Section C: SQL Writing
11. `pg_dump -t customers mydb > customers_backup.sql`
12. `COPY (SELECT * FROM orders WHERE status = 'completed') TO '/tmp/orders.csv' WITH CSV HEADER;`
13. `DELETE FROM customers WHERE customer_id NOT IN (SELECT MIN(customer_id) FROM customers GROUP BY email);`
14. `UPDATE products SET description = COALESCE(description, 'No description'), price = COALESCE(price, 0.00);`
15. `pg_restore -d mydb --clean backup.dump`