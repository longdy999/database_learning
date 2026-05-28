# Month 5 Mini Project: Production-Ready Database System

## Project Overview

Build a complete, production-ready database system that demonstrates
real-world database administration skills including security, backup
strategies, reporting, and API-ready query patterns.

**Duration:** 5-7 days (30 minutes per day)
**Difficulty:** Intermediate-Advanced
**Database:** PostgreSQL

---

## Learning Objectives

By completing this project, you will:

1. Design a PostgreSQL schema with proper constraints and indexes
2. Implement user roles and permissions (least privilege)
3. Create a documented backup and restore strategy
4. Write 5 professional dashboard/report queries
5. Complete a security checklist for production databases
6. Design API-ready query patterns with pagination

---

## Project Requirements

### 1. PostgreSQL Schema Design (20 points)

Create a schema for a **small business management system** with:
- At least 5 related tables
- Proper primary keys and foreign keys
- CHECK constraints and NOT NULL where appropriate
- At least 3 indexes for performance
- Clear, professional naming conventions

```sql
-- Example structure:
-- businesses, employees, departments, projects, timesheets
```

### 2. User Roles and Permissions (15 points)

Create at least 3 database roles:
- `admin_role` — Full access to all tables
- `analyst_role` — SELECT only on reporting views
- `app_role` — INSERT, UPDATE, SELECT (no DELETE on critical tables)


Document each role's permissions with comments in SQL.

### 3. Backup Strategy Document (15 points)

Create a `backup-strategy.md` file that includes:
- Daily automated backup schedule
- Weekly full backup plan
- Backup storage location recommendations
- Recovery Time Objective (RTO): < 1 hour
- Recovery Point Objective (RPO): < 24 hours
- Step-by-step restore procedure
- Backup testing schedule (monthly)

### 4. Dashboard Report Queries (25 points)

Write 5 reporting queries for a management dashboard:

1. **Monthly Revenue Summary** — Total orders, revenue, avg order value by month
2. **Employee Performance** — Hours worked, projects completed per employee
3. **Department Budget Usage** — Budget allocated vs spent per department
4. **Project Timeline Status** — On-time, delayed, completed projects
5. **Growth Metrics** — Month-over-month and year-over-year comparisons

Each query must:
- Use proper JOINs
- Include date-based aggregation
- Have clear column aliases
- Include comments explaining the business purpose

### 5. Security Checklist (10 points)

Complete this production security checklist:
- [ ] All default passwords changed
- [ ] Superuser access restricted
- [ ] Application uses dedicated user (not postgres)
- [ ] SSL/TLS enabled for connections
- [ ] Database port not exposed publicly
- [ ] Row-level security enabled where needed
- [ ] Audit logging configured
- [ ] Regular permission review scheduled
- [ ] Backup encryption enabled
- [ ] SQL injection prevention confirmed in app layer


### 6. API-Ready Query Patterns (15 points)

Write queries that demonstrate patterns for backend APIs:
- Pagination: LIMIT/OFFSET and cursor-based
- Filtering: Dynamic WHERE clauses
- Sorting: Parameterized ORDER BY
- Search: ILIKE with proper indexing
- Bulk operations: Batch INSERT/UPDATE

---

## Evaluation Checklist (100 Points Total)

| Component | Points | Criteria |
|-----------|--------|----------|
| Schema Design | 20 | 5+ tables, proper keys, constraints, indexes |
| User Roles | 15 | 3+ roles, least privilege, documented |
| Backup Strategy | 15 | Complete document, realistic schedule |
| Dashboard Queries | 25 | 5 queries, proper JOINs, aggregation |
| Security Checklist | 10 | All items addressed with evidence |
| API Patterns | 15 | 5 patterns demonstrated with examples |

### Grading Scale
- **90-100:** Excellent — Production ready
- **75-89:** Good — Minor improvements needed
- **60-74:** Satisfactory — Several areas need work
- **Below 60:** Needs revision — Review Month 5 lessons

---

## Timeline (7 Days)

| Day | Task |
|-----|------|
| Day 1 | Design schema (ERD + SQL) |
| Day 2 | Create tables, insert sample data |
| Day 3 | Implement roles and permissions |
| Day 4 | Write backup strategy document |
| Day 5 | Write 5 dashboard queries |
| Day 6 | Complete security checklist + API patterns |
| Day 7 | Review, test, and document everything |

---

## Deliverables

Submit the following files:
1. `schema.sql` — All CREATE TABLE statements
2. `roles.sql` — Role creation and GRANT statements
3. `backup-strategy.md` — Backup plan document
4. `dashboard-queries.sql` — 5 reporting queries
5. `security-checklist.md` — Completed checklist
6. `api-patterns.sql` — API query examples
7. `README.md` — Project overview (this file)