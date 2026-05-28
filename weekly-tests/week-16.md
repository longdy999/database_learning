# Week 16 Test — Transactions, ACID, and Stored Procedures

**Topics Covered:** BEGIN/COMMIT/ROLLBACK, ACID properties, isolation levels, SAVEPOINT, stored procedures basics

**Time Limit:** 45 minutes  
**Total Points:** 100

---

## Part A: Multiple Choice (5 questions × 4 points = 20 points)

**1. What does ACID stand for?**

a) Automatic, Consistent, Isolated, Durable  
b) Atomicity, Consistency, Isolation, Durability  
c) Available, Consistent, Independent, Distributed  
d) Atomic, Complete, Isolated, Dependent  

**2. If a transaction is rolled back, what happens to the changes?**

a) They are saved permanently  
b) They are undone — the database returns to its state before the transaction  
c) They are saved to a log file only  
d) They become read-only  

**3. Which isolation level allows dirty reads?**

a) SERIALIZABLE  
b) REPEATABLE READ  
c) READ COMMITTED  
d) READ UNCOMMITTED  

**4. What does SAVEPOINT allow you to do?**

a) Save the entire database  
b) Create a named point within a transaction to partially rollback to  
c) Commit part of a transaction permanently  
d) Lock a specific table  

**5. What is a stored procedure?**

a) A saved query result  
b) A precompiled set of SQL statements stored in the database  
c) A backup of table data  
d) A type of index  

---

## Part B: Short Answer (5 questions × 6 points = 30 points)

**6.** Explain the Atomicity property of ACID in simple English. Give a real-world analogy.


**7.** What is the difference between READ COMMITTED and REPEATABLE READ isolation levels?

**8.** Explain what a "dirty read" is and which isolation level prevents it.

**9.** Write the syntax for creating a SAVEPOINT and rolling back to it.

**10.** Name two advantages of stored procedures over writing queries directly in application code.

---

## Part C: SQL Writing (5 questions × 10 points = 50 points)

**11.** Write a complete transaction that transfers $500 from account_id 1 to account_id 2.

```sql
-- Your answer:

```

**12.** Write a transaction with a SAVEPOINT. Insert an order, set a savepoint, insert order items. If an item fails, rollback only to the savepoint.

```sql
-- Your answer:

```

**13.** Write a stored procedure called `process_refund` that takes order_id and amount as parameters, updates the order status and inserts a refund record.

```sql
-- Your answer:

```


**14.** Write a transaction that inserts a new order and reduces product stock. If stock would go below zero, rollback.

```sql
-- Your answer:

```

**15.** Write a simple stored procedure that accepts a customer_id and returns their total order count and total spending.

```sql
-- Your answer:

```

---

## Speaking Challenge

**Explain to a client (in simple English):**
"Why do we need transactions in a database? What could go wrong without them?"

Write your explanation (3-5 sentences):

> _______________________________________________

---

## Answer Key

### Part A: Multiple Choice
1. **b** — ACID = Atomicity, Consistency, Isolation, Durability
2. **b** — Rolled back changes are undone; database returns to pre-transaction state
3. **d** — READ UNCOMMITTED allows dirty reads
4. **b** — SAVEPOINT creates a named point to partially rollback to
5. **b** — A stored procedure is a precompiled set of SQL statements stored in the database


### Part B: Short Answer (Sample Answers)

6. **Atomicity:** "All or nothing." Either every operation in a transaction succeeds, or none of them do. Like transferring money — both the debit and credit must happen, or neither should.

7. **READ COMMITTED vs REPEATABLE READ:** READ COMMITTED sees only data committed before each statement. REPEATABLE READ sees a snapshot from the start of the transaction — data doesn't change even if other transactions commit.

8. **Dirty read:** Reading data that another transaction has written but not yet committed. If that transaction rolls back, you read data that never actually existed. READ COMMITTED prevents this.

9. **SAVEPOINT syntax:** `SAVEPOINT my_save; -- do some work... ROLLBACK TO SAVEPOINT my_save;`

10. **Stored procedure advantages:** (1) Reduce network round trips — one call executes multiple statements. (2) Security — grant EXECUTE permission without giving direct table access.

### Part C: SQL Writing (Sample Answers)

11. `BEGIN; UPDATE accounts SET balance = balance - 500 WHERE account_id = 1; UPDATE accounts SET balance = balance + 500 WHERE account_id = 2; COMMIT;`

12. `BEGIN; INSERT INTO orders (customer_id, order_date, status) VALUES (1, CURRENT_DATE, 'new'); SAVEPOINT after_order; INSERT INTO order_items (order_id, product_id, quantity) VALUES (currval('orders_order_id_seq'), 10, 2); -- If error: ROLLBACK TO SAVEPOINT after_order; COMMIT;`

13. `CREATE OR REPLACE PROCEDURE process_refund(p_order_id INT, p_amount DECIMAL) LANGUAGE plpgsql AS $$ BEGIN UPDATE orders SET status = 'refunded' WHERE order_id = p_order_id; INSERT INTO refunds (order_id, amount, refunded_at) VALUES (p_order_id, p_amount, NOW()); END; $$;`

14. `BEGIN; UPDATE products SET stock_quantity = stock_quantity - 1 WHERE product_id = 5 AND stock_quantity > 0; IF NOT FOUND THEN ROLLBACK; ELSE INSERT INTO orders (...) VALUES (...); COMMIT; END IF;`

15. `CREATE OR REPLACE PROCEDURE get_customer_stats(p_customer_id INT) LANGUAGE plpgsql AS $$ DECLARE v_count INT; v_total DECIMAL; BEGIN SELECT COUNT(*), COALESCE(SUM(total_amount),0) INTO v_count, v_total FROM orders WHERE customer_id = p_customer_id; RAISE NOTICE 'Orders: %, Total: %', v_count, v_total; END; $$;`
