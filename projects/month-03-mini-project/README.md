# Month 3 Mini-Project: Restaurant Management System Database Design

## Project Overview

Design and implement a complete relational database for a restaurant management system. This project applies all Month 3 skills: normalization, relationships, ERD design, constraints, and professional naming conventions.

## Objectives

By completing this project, you will:
1. Analyze real-world business requirements and identify entities
2. Draw an ERD before writing any SQL
3. Apply normalization (up to 3NF) to avoid data anomalies
4. Implement all relationship types (1:1, 1:N, M:N)
5. Use proper constraints (PK, FK, CHECK, UNIQUE, DEFAULT, NOT NULL)
6. Write professional CREATE TABLE statements
7. Insert realistic sample data
8. Write practical business queries

## Business Requirements

You are designing a database for **"Angkor Taste Restaurant"** which needs to track:

### 1. Menu Items
- Item name, description, price, category (appetizer, main, dessert, drink)
- Whether the item is currently available
- Preparation time (in minutes)
- Allergen information (an item can have multiple allergens)

### 2. Orders
- Order date and time
- Table number where the order was placed
- Which staff member took the order
- Order status (pending, preparing, served, paid, cancelled)
- Multiple items per order with quantities
- Special instructions for each item

### 3. Tables
- Table number, seating capacity, location (indoor, outdoor, VIP)
- Current status (available, occupied, reserved, maintenance)


### 4. Staff
- Full name, role (waiter, chef, manager, cashier)
- Phone number, email, hire date
- Work schedule (which shifts they work)
- Hourly rate

### 5. Customers
- Name, phone, email (for loyalty program)
- Total visits count
- Loyalty points
- Registration date

### 6. Reservations
- Customer who made the reservation
- Date, time, party size
- Assigned table
- Status (confirmed, cancelled, completed, no-show)
- Special requests

---

## Deliverables

### Deliverable 1: ERD Diagram
Draw an Entity-Relationship Diagram showing:
- All entities (tables)
- Attributes for each entity
- Primary keys (underlined)
- Relationships with cardinality (1:1, 1:N, M:N)
- Junction tables where needed

Save as: `erd-diagram.md` (text-based) or `erd-diagram.png`

### Deliverable 2: CREATE TABLE Statements
Write all SQL CREATE TABLE statements in: `create-tables.sql`

Requirements:
- Use snake_case naming convention
- Include all constraints (PK, FK, NOT NULL, CHECK, UNIQUE, DEFAULT)
- Use appropriate data types
- Add ON DELETE actions (CASCADE or SET NULL as appropriate)
- Tables must be in correct creation order (referenced tables first)


### Deliverable 3: Sample Data
Insert realistic sample data in: `sample-data.sql`

Minimum data:
- 15+ menu items across all categories
- 10+ tables with different capacities
- 8+ staff members in different roles
- 10+ customers
- 20+ orders with order items
- 10+ reservations

### Deliverable 4: Business Queries
Write 5 practical queries in: `queries.sql`

Required queries:
1. Show today's orders with item details and staff who took them
2. Find the top 5 most ordered menu items this month
3. List all reservations for today with customer and table info
4. Calculate total revenue by menu category for the current week
5. Show staff members and how many orders each has handled

---

## Evaluation Checklist

### Database Design (40 points)
- [ ] All 6 business areas are represented as tables (6 pts)
- [ ] Relationships are correctly identified (1:1, 1:N, M:N) (8 pts)
- [ ] Junction tables are used where needed (6 pts)
- [ ] Normalization to 3NF — no redundant data (10 pts)
- [ ] ERD is complete and accurate (10 pts)

### SQL Implementation (30 points)
- [ ] CREATE TABLE statements run without errors (8 pts)
- [ ] All constraints are properly applied (8 pts)
- [ ] Data types are appropriate (4 pts)
- [ ] Foreign keys reference correct tables (5 pts)
- [ ] ON DELETE actions are logical (5 pts)


### Sample Data & Queries (20 points)
- [ ] Sample data is realistic and sufficient (8 pts)
- [ ] INSERT statements run without constraint violations (4 pts)
- [ ] All 5 queries return correct results (8 pts)

### Professional Quality (10 points)
- [ ] Consistent snake_case naming (2 pts)
- [ ] Clear, descriptive column names (2 pts)
- [ ] SQL is well-formatted and readable (2 pts)
- [ ] Comments explain design decisions (2 pts)
- [ ] Files are organized clearly (2 pts)

**Total: 100 points | Pass: 70+ points**

---

## Hints & Tips

1. **Start with the ERD** — Don't write SQL until your design is solid
2. **Identify the M:N relationships** — Menu items ↔ Orders needs a junction table (order_items). Items ↔ Allergens may also need one
3. **Think about what changes** — Prices change! Store `price_at_order` in order_items
4. **Creation order matters** — Create parent tables before child tables
5. **Test with INSERT** — If you can't insert valid data, your design has a problem

## Submission Structure

```
projects/month-03-mini-project/
├── README.md (this file)
├── erd-diagram.md
├── create-tables.sql
├── sample-data.sql
└── queries.sql
```

---

## Timeline
- Day 1-2: Analyze requirements, identify entities and relationships
- Day 3: Draw ERD diagram
- Day 4-5: Write CREATE TABLE statements
- Day 6: Insert sample data and test
- Day 7: Write business queries and review

Good luck! 🍜
