# Week 15 Test — Indexes and Query Optimization

**Topics Covered:** B-tree indexes, composite indexes, partial indexes, EXPLAIN output, query optimization strategies

**Time Limit:** 45 minutes  
**Total Points:** 100

---

## Part A: Multiple Choice (5 questions × 4 points = 20 points)

**1. What is the primary purpose of a database index?**

a) To enforce constraints  
b) To speed up data retrieval  
c) To save storage space  
d) To encrypt data  

**2. A composite index on (last_name, first_name) is most useful for:**

a) Queries filtering only by first_name  
b) Queries filtering by last_name, or by last_name AND first_name  
c) Queries filtering only by first_name AND email  
d) All queries on the table  

**3. What is a partial index?**

a) An index on only some columns  
b) An index that covers only rows matching a WHERE condition  
c) An index that is half-built  
d) An index without a B-tree structure  

**4. In EXPLAIN output, which scan type is generally fastest?**

a) Seq Scan  
b) Index Scan  
c) Index Only Scan  
d) Bitmap Scan  

**5. What is the main downside of adding too many indexes?**

a) SELECT queries become slower  
b) INSERT, UPDATE, DELETE operations become slower and storage increases  
c) The database becomes read-only  
d) Queries return incorrect results  

---

## Part B: Short Answer (5 questions × 6 points = 30 points)

**6.** Explain how a B-tree index works in simple terms (use an analogy if helpful).


**7.** Why does column order matter in a composite index? Give an example.

**8.** What is the difference between an Index Scan and an Index Only Scan?

**9.** When might adding an index actually hurt performance?

**10.** Explain what "Seq Scan" means in EXPLAIN output and when it might be acceptable.

---

## Part C: SQL Writing (5 questions × 10 points = 50 points)

**11.** Create a B-tree index on the `orders` table for queries that filter by `customer_id`.

```sql
-- Your answer:

```

**12.** Create a composite index for queries that filter by `status` AND sort by `order_date`.

```sql
-- Your answer:

```

**13.** Create a partial index on `orders` for only rows where status = 'pending'.

```sql
-- Your answer:

```


**14.** Given this slow query, add an appropriate index and rewrite if needed:
```sql
SELECT * FROM products WHERE category = 'Electronics' AND price > 100 ORDER BY price;
```

```sql
-- Your index:
-- Your optimized query (if different):

```

**15.** Write EXPLAIN ANALYZE for a query, then create an index and show the expected improvement.

```sql
-- Step 1: EXPLAIN ANALYZE (before index)
-- Step 2: CREATE INDEX
-- Step 3: EXPLAIN ANALYZE (after index)

```

---

## Speaking Challenge

**Explain to a client (in simple English):**
"Why can't we just add indexes to every column? What are the tradeoffs?"

Write your explanation (3-5 sentences):

> _______________________________________________

---

## Answer Key

### Part A: Multiple Choice
1. **b** — Indexes speed up data retrieval
2. **b** — Composite index (last_name, first_name) helps queries filtering by last_name or both
3. **b** — A partial index covers only rows matching a WHERE condition
4. **c** — Index Only Scan is fastest (reads only from the index)
5. **b** — Too many indexes slow INSERT/UPDATE/DELETE and increase storage


### Part B: Short Answer (Sample Answers)

6. **B-tree index:** Like a phone book organized alphabetically. Instead of reading every page, you jump to the right section quickly. A B-tree keeps data sorted in a balanced tree structure so the database can find any value in O(log n) steps.

7. **Column order in composite index:** The index is sorted by the first column, then by the second within each first-column value. Queries must use the leftmost column(s) to benefit from the index.

8. **Index Scan vs Index Only Scan:** Index Scan finds row locations in the index, then fetches full rows from the table. Index Only Scan gets all needed data from the index itself — no table access needed.

9. **When indexes hurt:** On tables with heavy INSERT/UPDATE/DELETE operations, because each write must also update all indexes. Also on very small tables where a full table scan is faster anyway.

10. **Seq Scan:** Sequential Scan reads every row in the table from beginning to end. It's acceptable for small tables or when you actually need most/all rows.

### Part C: SQL Writing (Sample Answers)

11. `CREATE INDEX idx_orders_customer_id ON orders(customer_id);`

12. `CREATE INDEX idx_orders_status_date ON orders(status, order_date);`

13. `CREATE INDEX idx_orders_pending ON orders(order_id, customer_id, order_date) WHERE status = 'pending';`

14. Index: `CREATE INDEX idx_products_cat_price ON products(category, price);` The query can remain the same — the composite index covers the WHERE and ORDER BY.

15. Before: `EXPLAIN ANALYZE SELECT * FROM orders WHERE customer_id = 100;` → shows Seq Scan. After: `CREATE INDEX idx_orders_cust ON orders(customer_id);` then same EXPLAIN shows Index Scan with lower cost.
