# Month 3: Database Design

## Theme: Designing Databases That Are Clean, Efficient, and Professional

**Duration:** Days 61-90 | **Daily time:** 30 minutes

---

## Monthly Goals

By the end of Month 3, you will:
- Understand one-to-one, one-to-many, and many-to-many relationships
- Normalize databases to 1NF, 2NF, and 3NF
- Draw ERD (Entity-Relationship Diagrams)
- Define foreign keys and referential integrity
- Use constraints effectively (CHECK, UNIQUE, FOREIGN KEY)
- Design databases for real business problems
- Follow professional naming conventions
- Explain design decisions to clients

---

## Skills to Master

| Skill | Level Expected |
|-------|---------------|
| Identify relationship types | Instant recognition |
| Normalize to 3NF | Confident |
| Draw ERD diagrams | Can create from scratch |
| Define foreign keys | Automatic |
| Use constraints | Professional level |
| Design from requirements | Can do independently |
| Naming conventions | Consistent and clean |
| Explain design to clients | Clear and confident |

---

## Week-by-Week Plan

### Week 9 (Days 61-67): Relationships
- Day 61: One-to-one relationships
- Day 62: One-to-many relationships
- Day 63: Many-to-many relationships
- Day 64: Junction/bridge tables for many-to-many
- Day 65: Foreign keys - syntax and behavior
- Day 66: Referential integrity and CASCADE
- Day 67: Week 9 review and checkpoint


### Week 10 (Days 68-74): Normalization
- Day 68: Why normalization matters - data anomalies
- Day 69: First Normal Form (1NF)
- Day 70: Second Normal Form (2NF)
- Day 71: Third Normal Form (3NF)
- Day 72: Normalization practice - step by step
- Day 73: When NOT to normalize (denormalization)
- Day 74: Week 10 review and checkpoint

### Week 11 (Days 75-81): ERD Diagrams and Constraints
- Day 75: ERD notation and symbols
- Day 76: Drawing ERDs from business requirements
- Day 77: ERD practice - multiple scenarios
- Day 78: CHECK constraints - data validation
- Day 79: UNIQUE constraints and composite keys
- Day 80: DEFAULT and cascading constraints together
- Day 81: Week 11 review and checkpoint

### Week 12 (Days 82-88): Design Patterns and Real Examples
- Day 82: Common database design patterns
- Day 83: Designing a user/authentication system
- Day 84: Designing an e-commerce database
- Day 85: Designing a school/course system
- Day 86: Naming conventions and documentation
- Day 87: Design review - spotting problems
- Day 88: Week 12 review and checkpoint

### Days 89-90: Month Review and Mini-Project
- Day 89: Complete Month 3 review
- Day 90: Month 3 mini-project: Design a complete database system

---

## Common Mistakes to Avoid

1. **Storing repeated data** - violates normalization
2. **Missing foreign keys** - tables float without connections
3. **No junction table for many-to-many** - creates data chaos
4. **Inconsistent naming** - mix of styles confuses everyone
5. **Too many columns in one table** - sign of poor design
6. **Skipping constraints** - allows bad data in
7. **Not drawing ERD first** - jumping to SQL without planning

---

## Professional Habits to Build This Month

- [ ] Always draw an ERD before writing CREATE TABLE
- [ ] Every relationship must have a foreign key
- [ ] Name tables as plural nouns (users, orders, products)
- [ ] Name columns as singular descriptive (first_name, order_date)
- [ ] Document your design decisions in comments
- [ ] Test constraints with invalid data
- [ ] Review designs with the "what if" method

---

## End-of-Month Checklist

- [ ] I can identify 1:1, 1:N, and M:N relationships
- [ ] I can normalize a table to 3NF
- [ ] I can draw an ERD from business requirements
- [ ] I can implement foreign keys with CASCADE
- [ ] I can use CHECK, UNIQUE, and DEFAULT constraints
- [ ] I can design a 5+ table database from scratch
- [ ] I can explain my design to a non-technical person
- [ ] I completed the Month 3 mini-project
