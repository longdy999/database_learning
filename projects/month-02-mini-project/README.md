# Month 2 Mini-Project: Online Store Reporting System

## Project Overview

Build a complete reporting system for a small online store. You will design the database schema, populate it with sample data, and write SQL queries that generate 5 business reports. This project applies everything from Month 2: filtering, sorting, joins, grouping, and aggregation.

## Learning Objectives

By completing this project, you will:

1. **Practice multi-table JOINs** in real business scenarios
2. **Use GROUP BY and aggregate functions** to summarize data
3. **Apply filtering and sorting** to create useful reports
4. **Write clean, readable SQL** with proper formatting and aliases
5. **Think like a data analyst** solving real business questions
6. **Organize SQL files** professionally in a repository

## Database Schema

### Tables to Create

| Table | Description |
|-------|-------------|
| `customers` | Store customer information |
| `products` | Product catalog with categories and prices |
| `orders` | Customer orders with dates and status |
| `order_items` | Individual items within each order |
| `categories` | Product categories |

### Schema Details

**customers**
- id (PK), name, email, city, country, registered_date

**categories**
- id (PK), category_name, description

**products**
- id (PK), product_name, category_id (FK), price, stock_quantity


**orders**
- id (PK), customer_id (FK), order_date, status (pending/completed/cancelled), shipping_city

**order_items**
- id (PK), order_id (FK), product_id (FK), quantity, unit_price

### Relationships
- customers → orders (one-to-many)
- orders → order_items (one-to-many)
- products → order_items (one-to-many)
- categories → products (one-to-many)

## Requirements

### Part 1: Schema Creation (schema.sql)
- Create all 5 tables with proper constraints
- Use appropriate data types
- Define primary and foreign keys
- Add at least 2 CHECK constraints

### Part 2: Sample Data (seed-data.sql)
- Insert at least 10 customers
- Insert at least 5 categories
- Insert at least 20 products
- Insert at least 30 orders
- Insert at least 60 order items
- Make data realistic (use Cambodian city names, real product categories)

### Part 3: Reports (reports.sql)

Build these 5 business reports:

#### Report 1: Customer Spending Summary
Show each customer's name, total orders, total spent, and average order value.
Sort by total spent (highest first). Include customers with zero orders.

#### Report 2: Monthly Revenue Report
Show month, total orders, total revenue, and average order value per month.
Only include months with revenue above $500.

#### Report 3: Product Performance Report
Show each product's name, category, total quantity sold, total revenue generated.
Identify products never sold (anti-join pattern). Sort by revenue descending.

#### Report 4: Top Customers by City
Show each city, number of customers, total revenue from that city,
and the top customer name in each city. Use GROUP BY with HAVING.

#### Report 5: Inventory Alert Report
Show products where stock_quantity is below the average units sold per month.
Include product name, current stock, average monthly sales, and months until stockout.

## Deliverables

```
projects/month-02-mini-project/
├── README.md          (this file)
├── schema.sql         (table creation)
├── seed-data.sql      (sample data)
├── reports.sql        (all 5 reports)
└── notes.md           (your observations and learnings)
```

## Evaluation Criteria

- [ ] All tables created with correct relationships
- [ ] Sample data is realistic and sufficient
- [ ] All 5 reports produce correct results
- [ ] SQL is clean, formatted, and commented
- [ ] Anti-join pattern used correctly in Report 3
- [ ] HAVING clause used correctly in Report 4
- [ ] Aliases used for readability
- [ ] File organization is professional

## Tips

- Start by drawing the ERD on paper before writing SQL
- Test each report query individually before combining
- Use COALESCE for handling NULL values in LEFT JOINs
- Comment your SQL explaining the business logic
- Run each query and verify the output makes sense

## Time Estimate

- Schema design: 30 minutes
- Sample data: 30 minutes
- Reports 1-3: 45 minutes
- Reports 4-5: 45 minutes
- Testing and cleanup: 30 minutes
- **Total: ~3 hours** (spread across multiple days)

---

**កំណត់សម្គាល់ (Khmer Note):**
គម្រោងនេះជួយអ្នកអនុវត្ត JOIN, GROUP BY, និង aggregate functions ក្នុងស្ថានភាពពិតប្រាកដ។ សរសេរ SQL ឱ្យស្អាត ហើយបន្ថែម comments ដើម្បីពន្យល់អ្វីដែល query នីមួយៗធ្វើ។
