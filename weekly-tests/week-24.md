# Week 24 — Professional Skills Test: Client Communication, Technical Writing, Code Review

## Overview
This test evaluates your ability to communicate database concepts professionally. Each question presents a real-world scenario requiring clear, non-technical explanations or professional responses.

**Time Limit:** 30 minutes
**Total Points:** 10 (1 point each)
**Focus:** Communication, not just technical knowledge

---

## Scenario-Based Questions

### Question 1: Explaining to a Non-Technical Client
A client asks: "Why can't we just put everything in one big spreadsheet instead of using a database?"

Write a 3-4 sentence response that a non-technical business owner would understand.

### Question 2: Justifying Design Decisions
Your team lead asks why you chose to separate customer addresses into a different table instead of keeping them in the customers table.

Write a professional explanation (3-5 sentences) justifying your normalization decision.

### Question 3: Reporting a Performance Issue
You discovered that a critical report query takes 45 seconds to run. Write a brief technical summary (5-7 sentences) for your team explaining:
- What the problem is
- Why it is happening
- What you recommend

### Question 4: Writing a Migration Note
You need to add a `phone_number` column to the `customers` table. Write a clear migration note that another developer could follow, including the SQL and any considerations.

### Question 5: Explaining an Outage
The database server went down for 10 minutes during business hours. Write a brief incident summary (5 sentences) for your manager explaining what happened and what you did.

### Question 6: Code Review Feedback
A junior developer wrote this query. Provide constructive code review feedback:

```sql
select * from orders where customer_id in (select customer_id from customers where country = 'Cambodia') and order_date > '2024-01-01' and total > 100 order by order_date
```


### Question 7: Handling Scope Creep
A client says: "While you're adding the phone number column, can you also redesign the entire customer table and add a loyalty points system?"

Write a professional 3-4 sentence response that acknowledges the request but manages scope.

### Question 8: Documenting a Decision
You decided to use PostgreSQL instead of MySQL for a project. Write a brief decision record (5-7 sentences) explaining your reasoning.

### Question 9: Explaining a Backup Strategy
A client asks: "How do we make sure we never lose our data?"

Write a simple, reassuring explanation (4-5 sentences) of your backup strategy.

### Question 10: Writing a Status Update
Write a brief weekly status update (5-7 sentences) about your database project progress. Include what you completed, what's in progress, and any blockers.

---

## Answer Guidelines

### What Makes a Good Answer:
- **Clear:** Non-technical people can understand it
- **Professional:** Appropriate tone, no jargon without explanation
- **Structured:** Organized logically (problem → cause → solution)
- **Actionable:** Includes specific next steps when appropriate
- **Honest:** Acknowledges limitations and uncertainties

### Common Mistakes to Avoid:
- Using too much technical jargon without explanation
- Being too vague ("it's complicated")
- Not providing specific recommendations
- Forgetting to address the client's actual concern
- Writing too long — keep it concise

### Scoring Rubric (per question):
| Criteria | Points |
|----------|--------|
| Clarity and simplicity | 0.25 |
| Professional tone | 0.25 |
| Completeness (addresses all parts) | 0.25 |
| Actionable / helpful | 0.25 |

---

## Self-Reflection
After completing this test, ask yourself:
- Could a non-technical person understand my explanations?
- Did I provide specific examples or stay too abstract?
- Would I be confident sending these responses in a real work email?
