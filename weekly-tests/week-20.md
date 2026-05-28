# Week 20 Test

## Topics Covered
- Reporting queries and business intelligence
- Dashboard data preparation
- API query patterns (pagination, filtering)
- Connection pooling
- Job scheduling and automation
- Database monitoring

---

## Section A: Multiple Choice (5 Questions)

**1. Which clause is essential for pagination in API queries?**
- A) GROUP BY
- B) HAVING
- C) LIMIT and OFFSET
- D) DISTINCT

**2. What is connection pooling?**
- A) Creating a new connection for every query
- B) Reusing a set of pre-established database connections
- C) Pooling multiple databases into one
- D) Connecting multiple users to the same session

**3. Which query pattern is best for a monthly revenue dashboard?**
- A) SELECT * FROM orders;
- B) SELECT DATE_TRUNC('month', order_date), SUM(amount) FROM orders GROUP BY 1;
- C) SELECT order_date FROM orders LIMIT 10;
- D) DELETE FROM orders WHERE amount < 0;

**4. What tool can schedule recurring database tasks in PostgreSQL?**
- A) pg_cron
- B) pg_timer
- C) AUTO_RUN
- D) sql_schedule

**5. Which metric is MOST important to monitor for database health?**
- A) Number of tables
- B) Query response time and active connections
- C) Number of columns per table
- D) Total number of indexes

---

## Section B: Short Answer (5 Questions)

**6.** Explain the difference between LIMIT/OFFSET and cursor-based pagination.

**7.** Why is connection pooling important for web applications?


**8.** What is the difference between a report query and a transactional query?

**9.** Name three things you should monitor on a production database.

**10.** How does pg_cron differ from application-level scheduling?

---

## Section C: SQL Writing (5 Questions)

**11.** Write a query for a monthly revenue report with year-over-year comparison:

```sql
-- Your answer here
```

**12.** Write an API-style query with pagination (page 3, 20 items per page):

```sql
-- Your answer here
```

**13.** Write a query that prepares data for a "top 5 customers" dashboard widget:

```sql
-- Your answer here
```

**14.** Write a query to find slow-performing queries using pg_stat_statements:

```sql
-- Your answer here
```

**15.** Write a scheduled job setup using pg_cron to vacuum a table daily:

```sql
-- Your answer here
```

---

## Section D: Speaking Challenge

**Scenario:** A client asks: "We need a dashboard showing sales performance. What database queries do we need?"

Prepare a 1-minute explanation covering:
- Types of metrics (revenue, growth, top items)
- Aggregation and time grouping
- Caching considerations
- Real-time vs batch reporting
- API endpoint patterns

---


## Answer Key

### Section A: Multiple Choice
1. **C** — LIMIT and OFFSET
2. **B** — Reusing a set of pre-established database connections
3. **B** — SELECT DATE_TRUNC('month', order_date), SUM(amount) FROM orders GROUP BY 1;
4. **A** — pg_cron
5. **B** — Query response time and active connections

### Section B: Short Answer
6. LIMIT/OFFSET skips rows (slow for deep pages). Cursor-based uses a WHERE clause on a unique column (e.g., WHERE id > last_seen_id LIMIT 20), which is faster for large datasets.
7. Without pooling, each request opens a new connection (expensive). Pooling reuses connections, reducing overhead, improving response times, and preventing connection exhaustion under load.
8. Report queries aggregate data for analysis (GROUP BY, SUM, trends). Transactional queries handle individual operations (INSERT one order, UPDATE one record). Reports can be slow; transactions must be fast.
9. Monitor: (1) Active connections count, (2) Query response time / slow queries, (3) Disk usage and table bloat.
10. pg_cron runs inside PostgreSQL (no external scheduler needed). App-level scheduling depends on the application being running. pg_cron is more reliable for database maintenance tasks.

### Section C: SQL Writing
11. `SELECT DATE_TRUNC('month', order_date) AS month, SUM(amount) AS revenue, LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', order_date)) AS prev_month FROM orders GROUP BY 1 ORDER BY 1;`
12. `SELECT * FROM products ORDER BY created_at DESC LIMIT 20 OFFSET 40;`
13. `SELECT c.name, SUM(o.amount) AS total_spent FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.name ORDER BY total_spent DESC LIMIT 5;`
14. `SELECT query, calls, mean_exec_time, total_exec_time FROM pg_stat_statements ORDER BY mean_exec_time DESC LIMIT 10;`
15. `SELECT cron.schedule('nightly-vacuum', '0 3 * * *', 'VACUUM ANALYZE orders;');`