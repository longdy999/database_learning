# Week 19 Test

## Topics Covered
- Database users, roles, and permissions
- SQL injection prevention
- Data encryption (at rest and in transit)
- Audit logs and tracking changes
- Network security for databases

---

## Section A: Multiple Choice (5 Questions)

**1. Which SQL command creates a new database user in PostgreSQL?**
- A) ADD USER 'analyst';
- B) CREATE USER analyst WITH PASSWORD 'secure123';
- C) INSERT INTO users VALUES ('analyst');
- D) NEW USER analyst;

**2. What is the LEAST privilege principle in database security?**
- A) Give all users admin access for convenience
- B) Give users only the minimum permissions they need
- C) Remove all permissions after each session
- D) Only allow one user at a time

**3. Which technique prevents SQL injection attacks?**
- A) Using string concatenation for queries
- B) Using parameterized queries / prepared statements
- C) Storing passwords in plain text
- D) Disabling all WHERE clauses

**4. What does GRANT SELECT ON customers TO analyst; do?**
- A) Gives analyst full control over customers table
- B) Allows analyst to only read data from customers table
- C) Removes analyst access to customers table
- D) Creates a new table called analyst

**5. Which PostgreSQL extension helps with auditing changes?**
- A) pg_stat
- B) pg_audit
- C) pg_monitor
- D) pg_history

---

## Section B: Short Answer (5 Questions)

**6.** What is the difference between authentication and authorization?

**7.** Give an example of a SQL injection attack and how to prevent it.


**8.** What is encryption at rest vs encryption in transit?

**9.** Why should database ports not be exposed to the public internet?

**10.** What information should an audit log capture?

---

## Section C: SQL Writing (5 Questions)

**11.** Write SQL to create a read-only role and grant it SELECT on all tables in a schema:

```sql
-- Your answer here
```

**12.** Write SQL to revoke DELETE permission from a user on the `orders` table:

```sql
-- Your answer here
```

**13.** Write a trigger that logs changes to an audit table:

```sql
-- Your answer here
```

**14.** Write a parameterized query (using placeholder) to prevent SQL injection:

```sql
-- Your answer here (use $1 or ? placeholder syntax)
```

**15.** Write SQL to enable row-level security on a table:

```sql
-- Your answer here
```

---

## Section D: Speaking Challenge

**Scenario:** Your manager asks: "What steps should we take to secure our production database before going live?"

Prepare a 1-minute explanation covering:
- User access control
- Network restrictions
- Encryption
- SQL injection prevention
- Monitoring and audit logs

---


## Answer Key

### Section A: Multiple Choice
1. **B** — CREATE USER analyst WITH PASSWORD 'secure123';
2. **B** — Give users only the minimum permissions they need
3. **B** — Using parameterized queries / prepared statements
4. **B** — Allows analyst to only read data from customers table
5. **B** — pg_audit

### Section B: Short Answer
6. Authentication verifies WHO you are (login credentials). Authorization determines WHAT you can do (permissions/roles). Authentication comes first.
7. Attack example: `SELECT * FROM users WHERE name = '' OR '1'='1';` Prevention: Use parameterized queries: `SELECT * FROM users WHERE name = $1;` and pass the value separately.
8. At rest: data encrypted on disk (protects against stolen drives). In transit: data encrypted during transfer (SSL/TLS protects against network interception).
9. Exposed ports allow anyone to attempt connections. Use firewalls, VPNs, or allow-lists to restrict access to known IPs only.
10. An audit log should capture: WHO (user), WHAT (action: INSERT/UPDATE/DELETE), WHEN (timestamp), WHERE (table/row), and the old/new values.

### Section C: SQL Writing
11. `CREATE ROLE readonly_role; GRANT USAGE ON SCHEMA public TO readonly_role; GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_role;`
12. `REVOKE DELETE ON orders FROM analyst;`
13. `CREATE TABLE audit_log (id SERIAL, table_name TEXT, action TEXT, old_data JSONB, new_data JSONB, changed_by TEXT, changed_at TIMESTAMP DEFAULT NOW()); CREATE OR REPLACE FUNCTION log_changes() RETURNS TRIGGER AS $$ BEGIN INSERT INTO audit_log(table_name, action, old_data, new_data, changed_by) VALUES (TG_TABLE_NAME, TG_OP, row_to_json(OLD)::jsonb, row_to_json(NEW)::jsonb, current_user); RETURN NEW; END; $$ LANGUAGE plpgsql;`
14. `PREPARE get_user(text) AS SELECT * FROM users WHERE username = $1; EXECUTE get_user('admin');`
15. `ALTER TABLE orders ENABLE ROW LEVEL SECURITY; CREATE POLICY user_orders ON orders FOR SELECT USING (user_id = current_setting('app.user_id')::int);`