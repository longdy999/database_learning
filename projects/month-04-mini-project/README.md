# Month 4 Mini-Project: E-Commerce Reporting & Performance System

## Overview

Build a complete e-commerce reporting system that demonstrates your mastery of Month 4 topics: views, indexes, transactions, CTEs, and query optimization.

You will create a database that handles order processing safely (transactions), provides fast reporting (indexes + views), and generates monthly business trends (CTEs).

---

## Learning Objectives

By completing this project, you will:

1. **Create views** for common business reports (daily sales, top products, customer summaries)
2. **Add strategic indexes** to optimize slow queries
3. **Write transaction-safe order processing** (atomic operations with ROLLBACK on failure)
4. **Use CTEs** to calculate monthly revenue trends and growth percentages
5. **Run EXPLAIN before/after** index additions to prove performance improvement
6. **Design stored procedures** for repeatable business operations

---

## Project Requirements

### Part 1: Database Schema (provided)

Use the e-commerce schema with these tables:
- `customers` (customer_id, name, email, city, created_at)
- `products` (product_id, name, category, price, stock_quantity)
- `orders` (order_id, customer_id, order_date, status, total_amount)
- `order_items` (item_id, order_id, product_id, quantity, unit_price)
- `payments` (payment_id, order_id, amount, method, paid_at)

### Part 2: Views (create at least 4)

| View Name | Purpose |
|-----------|---------|
| `v_daily_sales_summary` | Total orders and revenue per day |
| `v_top_products` | Top 20 products by total quantity sold |
| `v_customer_lifetime_value` | Each customer's total spending |
| `v_pending_orders` | Orders not yet shipped with customer info |


### Part 3: Indexes (add at least 5 strategic indexes)

Before adding each index:
1. Run `EXPLAIN ANALYZE` on the slow query
2. Note the cost and scan type
3. Create the index
4. Run `EXPLAIN ANALYZE` again
5. Document the improvement

Required indexes:
- Index on `orders.customer_id`
- Composite index on `orders(status, order_date)`
- Partial index on `orders WHERE status = 'pending'`
- Index on `order_items.product_id`
- Index on `payments.order_id`

### Part 4: Transaction-Safe Order Processing

Write a transaction that:
1. Inserts a new order
2. Inserts order items (multiple products)
3. Reduces stock_quantity for each product
4. Creates a payment record
5. If any stock_quantity would go below 0, ROLLBACK the entire transaction
6. Use SAVEPOINT between order creation and payment processing

### Part 5: CTE Reports (write at least 3)

| Report | Description |
|--------|-------------|
| Monthly revenue trend | Revenue per month with % growth vs previous month |
| Customer segmentation | Classify customers by spending tier |
| Product performance | Rank products with running total contribution |


### Part 6: EXPLAIN Before/After Documentation

For each index you create, document:

```
## Index: idx_orders_customer_id
### Before
- Scan Type: Seq Scan
- Cost: 0.00..1250.00
- Actual Time: 15.2ms

### After
- Scan Type: Index Scan
- Cost: 0.00..12.50
- Actual Time: 0.3ms
- Improvement: ~98% faster
```

---

## Deliverables

Submit the following files in your project folder:

| File | Description |
|------|-------------|
| `schema.sql` | Complete database schema with tables and constraints |
| `views.sql` | All view definitions |
| `indexes.sql` | All index creation statements with comments |
| `transactions.sql` | Order processing transaction with error handling |
| `reports.sql` | CTE-based reports |
| `explain-analysis.md` | EXPLAIN before/after documentation |
| `stored-procedures.sql` | At least 2 stored procedures |

---

## Evaluation Checklist

| Criteria | Points | Self-Check |
|----------|--------|------------|
| Schema is normalized (3NF) and uses proper constraints | 15 | ☐ |
| At least 4 views created and working | 15 | ☐ |
| At least 5 indexes with documented EXPLAIN improvement | 20 | ☐ |
| Transaction handles errors and uses SAVEPOINT correctly | 15 | ☐ |
| CTE reports produce correct results | 15 | ☐ |
| Stored procedures are reusable and well-documented | 10 | ☐ |
| Code is clean, commented, and professionally formatted | 10 | ☐ |
| **Total** | **100** | |

---

## Timeline

| Days | Task |
|------|------|
| Days 1-2 | Set up schema, insert sample data |
| Days 3-4 | Create views and test them |
| Days 5-6 | Add indexes with EXPLAIN analysis |
| Day 7 | Write transactions and stored procedures |
| Day 8 | Write CTE reports |
| Days 9-10 | Polish, document, and self-evaluate |

---

## Tips for Success

1. **Start with sample data** — at least 10,000 orders to see real index impact
2. **Document everything** — explain WHY you chose each index
3. **Test edge cases** — what if stock is 0? What if payment fails?
4. **Keep SQL readable** — use consistent naming and comments
5. **Think like a real developer** — would a team member understand your code?
