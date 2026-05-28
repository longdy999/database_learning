# Final Portfolio Project: Online Bookstore Database

## Project Overview
Design and implement a complete relational database for an online bookstore. This project demonstrates all skills learned over 6 months: schema design, SQL querying, performance optimization, and professional documentation.

**Difficulty:** Advanced
**Estimated Time:** 2 weeks (30 min/day)
**Total Points:** 100

---

## Business Requirements

The "PageTurner" online bookstore needs a database to manage:
1. **Books** — title, ISBN, price, publication date, page count, description
2. **Authors** — name, biography, nationality
3. **Categories** — genre/category hierarchy (parent-child)
4. **Customers** — name, email, phone, address, registration date
5. **Orders** — order date, status, shipping address, total amount
6. **Order Items** — books in each order with quantity and price at purchase
7. **Reviews** — customer book reviews with rating (1-5) and comment
8. **Inventory** — stock quantity, warehouse location, reorder level
9. **Publishers** — name, country, contact information
10. **Wishlists** — customers can save books for later

### Business Rules
- A book can have multiple authors (many-to-many)
- A book belongs to one publisher
- A book can be in multiple categories
- A customer can place many orders
- Each order can contain multiple books
- A customer can review a book only once
- Inventory must track when stock falls below reorder level
- Order status follows: pending → confirmed → shipped → delivered → (returned)

---

## Deliverables

You must create and submit the following files:

### 1. `schema.sql` (25 points)
- All CREATE TABLE statements
- Primary keys, foreign keys, constraints
- Proper data types
- CHECK constraints where appropriate


### 2. `seed-data.sql` (15 points)
- At least 50 meaningful sample records across all tables
- Realistic data (real book titles, proper names)
- Data that supports testing all query requirements
- Proper INSERT order respecting foreign keys

### 3. `queries.sql` (25 points)
Write SQL queries for each business requirement:
1. Find all books by a specific author
2. Show top 10 best-selling books
3. Calculate average rating per book
4. List customers who spent more than $100 total
5. Find books that are low in stock (below reorder level)
6. Show monthly revenue for the past year
7. Find customers who haven't ordered in 90 days
8. List books in a category with average rating above 4
9. Calculate the most popular category by number of sales
10. Show order details with customer and book information

### 4. `views.sql` (15 points)
Create at least 5 useful views:
- `v_book_details` — books with author names and publisher
- `v_customer_orders` — customer order summary
- `v_low_stock` — books below reorder level
- `v_monthly_revenue` — revenue aggregated by month
- `v_top_rated_books` — books with average rating ≥ 4.0

### 5. `indexes.sql` (10 points)
- Create indexes for frequently queried columns
- Include EXPLAIN analysis comments showing improvement
- Justify each index with a comment

### 6. `README.md` (10 points)
- Project description and business context
- ERD diagram (can be text-based or image)
- Setup instructions
- Sample query demonstrations
- Design decisions and trade-offs

---

## Evaluation Criteria (100 Points Total)

| Component | Points | Key Criteria |
|-----------|--------|-------------|
| schema.sql | 25 | Correctness, normalization, constraints |
| seed-data.sql | 15 | Realistic, sufficient, proper order |
| queries.sql | 25 | Correctness, variety, performance |
| views.sql | 15 | Usefulness, correctness, naming |
| indexes.sql | 10 | Appropriate choices, justified |
| README.md | 10 | Complete, professional, clear |

---

## Timeline (2 Weeks)

| Day | Task |
|-----|------|
| 1-2 | Requirements analysis, ERD design |
| 3-4 | Write schema.sql with all constraints |
| 5-6 | Create seed-data.sql with realistic data |
| 7-9 | Write all 10 queries in queries.sql |
| 10-11 | Create views.sql and indexes.sql |
| 12-13 | Write README.md and documentation |
| 14 | Final review, testing, cleanup |

---

## Submission Checklist
- [ ] All 6 files created and tested
- [ ] Schema executes without errors
- [ ] All queries return correct results
- [ ] README includes ERD diagram
- [ ] Code is well-commented
- [ ] Files follow naming conventions
- [ ] No SELECT * in production queries
- [ ] Git commit history shows progress
