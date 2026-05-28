# Month 2: SQL Querying

## Theme: Becoming Comfortable Reading and Writing SQL Queries

**Duration:** Days 31-60 | **Daily time:** 30 minutes

---

## Monthly Goals

By the end of Month 2, you will:
- Sort results with ORDER BY (ascending and descending)
- Limit results with LIMIT and OFFSET
- Search with LIKE and wildcard patterns
- Join multiple tables with INNER JOIN and LEFT JOIN
- Group data with GROUP BY
- Use aggregate functions: COUNT, SUM, AVG, MIN, MAX
- Filter groups with HAVING
- Write multi-table queries confidently
- Think through complex query logic step by step

---

## Skills to Master

| Skill | Level Expected |
|-------|---------------|
| ORDER BY ASC/DESC | Automatic |
| LIMIT and OFFSET | Comfortable |
| LIKE with % and _ | Confident |
| INNER JOIN | Can write from memory |
| LEFT JOIN | Understand when to use |
| GROUP BY | Comfortable with aggregates |
| HAVING vs WHERE | Know the difference |
| Multi-table queries | Can plan and write |
| Query planning | Think before writing |

---

## Week-by-Week Plan

### Week 5 (Days 31-37): Sorting, Limiting, and Pattern Matching
- Day 31: ORDER BY - sorting results ASC and DESC
- Day 32: ORDER BY multiple columns
- Day 33: LIMIT and OFFSET - pagination
- Day 34: LIKE and % wildcard - pattern matching
- Day 35: LIKE with _ underscore and combining patterns
- Day 36: DISTINCT - removing duplicates
- Day 37: Week 5 review and checkpoint

### Week 6 (Days 38-44): JOIN Basics
- Day 38: Why joins matter - connecting tables
- Day 39: INNER JOIN - matching rows from two tables
- Day 40: INNER JOIN practice with real examples
- Day 41: LEFT JOIN - keeping all rows from left table
- Day 42: LEFT JOIN practice and NULL handling
- Day 43: RIGHT JOIN and FULL JOIN (concepts)
- Day 44: Week 6 review and checkpoint


### Week 7 (Days 45-51): GROUP BY and Aggregate Functions
- Day 45: COUNT(*) and COUNT(column) - counting rows
- Day 46: SUM and AVG - totals and averages
- Day 47: MIN and MAX - finding extremes
- Day 48: GROUP BY - grouping rows by category
- Day 49: GROUP BY with multiple columns
- Day 50: HAVING - filtering after grouping
- Day 51: Week 7 review and checkpoint

### Week 8 (Days 52-58): Complex Queries
- Day 52: Multiple joins - 3 or more tables
- Day 53: Joins with WHERE and ORDER BY
- Day 54: Joins with GROUP BY and aggregates
- Day 55: Query planning - thinking before writing
- Day 56: Common query patterns for real business questions
- Day 57: Query debugging - finding and fixing errors
- Day 58: Week 8 review and checkpoint

### Days 59-60: Month Review and Mini-Project
- Day 59: Complete Month 2 review
- Day 60: Month 2 mini-project: Online Store Reports

---

## Common Mistakes to Avoid

1. **Joining without ON clause** - Always specify how tables connect
2. **GROUP BY forgetting non-aggregated columns** - Every selected column must be in GROUP BY or an aggregate
3. **Using WHERE instead of HAVING for aggregates** - WHERE filters rows; HAVING filters groups
4. **Cartesian product** - Forgetting JOIN condition creates every possible combination
5. **Wrong JOIN type** - INNER loses rows; LEFT keeps all from left table
6. **Not aliasing tables** - Multi-table queries get confusing without aliases
7. **Ordering before grouping** - ORDER BY goes LAST in a query

---

## Professional Habits to Build This Month

- [ ] Always alias tables in multi-table queries (e.g., `orders AS o`)
- [ ] Write queries step by step: start simple, add complexity
- [ ] Test each JOIN with SELECT * before adding columns
- [ ] Use COUNT(*) to verify JOIN results (unexpected row counts = wrong JOIN)
- [ ] Format complex queries across multiple lines for readability
- [ ] Comment your intent above complex queries
- [ ] Check for NULL values after LEFT JOINs

---

## End-of-Month Checklist

- [ ] I can sort results in any direction
- [ ] I can limit and paginate results
- [ ] I can search with LIKE patterns
- [ ] I can write INNER JOIN from memory
- [ ] I can write LEFT JOIN and understand NULL results
- [ ] I can use all 5 aggregate functions
- [ ] I can GROUP BY and filter with HAVING
- [ ] I can join 3 tables in one query
- [ ] I can explain joins to a non-technical person
- [ ] I completed the Month 2 mini-project
