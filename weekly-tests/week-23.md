# Week 23 — Portfolio Project Review: Schema Quality, SQL Quality, Documentation

## Overview
This week focuses on reviewing your portfolio project. Use this peer review checklist to evaluate schema quality, SQL quality, and documentation. Score each section honestly.

**Purpose:** Ensure your final portfolio project meets professional standards
**Total Points:** 100

---

## Part 1: Schema Quality Review (40 points)

### Naming Conventions (10 points)
| Criteria | Points | Score |
|----------|--------|-------|
| Tables use plural, lowercase, snake_case (e.g., `customers`) | 3 | ___ |
| Columns use clear, descriptive names | 3 | ___ |
| Primary keys follow consistent pattern (e.g., `id` or `table_id`) | 2 | ___ |
| Foreign keys clearly reference parent table (e.g., `customer_id`) | 2 | ___ |

### Normalization (10 points)
| Criteria | Points | Score |
|----------|--------|-------|
| No repeating groups (1NF satisfied) | 3 | ___ |
| No partial dependencies (2NF satisfied) | 3 | ___ |
| No transitive dependencies (3NF satisfied) | 2 | ___ |
| Appropriate denormalization justified in comments | 2 | ___ |

### Constraints & Integrity (10 points)
| Criteria | Points | Score |
|----------|--------|-------|
| All tables have primary keys | 3 | ___ |
| Foreign keys defined with appropriate ON DELETE actions | 3 | ___ |
| NOT NULL used where appropriate | 2 | ___ |
| CHECK constraints for data validation | 2 | ___ |

### Relationships (10 points)
| Criteria | Points | Score |
|----------|--------|-------|
| One-to-many relationships correctly implemented | 3 | ___ |
| Many-to-many relationships use junction tables | 3 | ___ |
| ERD diagram matches actual schema | 2 | ___ |
| Relationships support real business logic | 2 | ___ |


---

## Part 2: SQL Quality Review (35 points)

### Query Correctness (15 points)
| Criteria | Points | Score |
|----------|--------|-------|
| All queries execute without errors | 5 | ___ |
| Queries return expected results | 5 | ___ |
| Edge cases handled (NULL, empty results) | 3 | ___ |
| Appropriate use of JOINs vs subqueries | 2 | ___ |

### Query Style & Readability (10 points)
| Criteria | Points | Score |
|----------|--------|-------|
| Consistent formatting (uppercase keywords, indentation) | 3 | ___ |
| Meaningful aliases used | 2 | ___ |
| Comments explain complex logic | 3 | ___ |
| No SELECT * in production queries | 2 | ___ |

### Performance Awareness (10 points)
| Criteria | Points | Score |
|----------|--------|-------|
| Indexes created for frequently queried columns | 3 | ___ |
| No unnecessary subqueries where JOIN works | 3 | ___ |
| LIMIT used where appropriate | 2 | ___ |
| EXPLAIN used to verify query plans | 2 | ___ |

---

## Part 3: Documentation Quality (25 points)

### README Completeness (15 points)
| Criteria | Points | Score |
|----------|--------|-------|
| Project description and purpose clear | 3 | ___ |
| Setup instructions provided | 3 | ___ |
| ERD diagram included | 3 | ___ |
| Sample queries documented | 3 | ___ |
| Known limitations mentioned | 3 | ___ |

### Code Documentation (10 points)
| Criteria | Points | Score |
|----------|--------|-------|
| Schema file has header comments | 3 | ___ |
| Complex queries have explanatory comments | 3 | ___ |
| File organization is logical | 2 | ___ |
| Consistent file naming conventions | 2 | ___ |

---

## Scoring Summary

| Section | Max Points | Your Score |
|---------|-----------|------------|
| Schema Quality | 40 | ___ |
| SQL Quality | 35 | ___ |
| Documentation | 25 | ___ |
| **Total** | **100** | **___** |

### Grade Scale
- 90-100: Excellent — Professional quality
- 80-89: Good — Minor improvements needed
- 70-79: Satisfactory — Several areas to improve
- Below 70: Needs revision — Review feedback and resubmit
