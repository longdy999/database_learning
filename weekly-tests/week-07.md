# Week 7 Test: Aggregate Functions and GROUP BY

**Topics Covered:** COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING

**Time Allowed:** 30 minutes

---

## Section A: Multiple Choice (5 Questions)

**1. What does COUNT(*) return?**
- A) The number of columns in a table
- B) The total number of rows (including NULLs)
- C) The number of non-NULL values only
- D) The sum of all values

**2. What is the difference between WHERE and HAVING?**
- A) There is no difference
- B) WHERE filters before grouping; HAVING filters after grouping
- C) HAVING filters before grouping; WHERE filters after grouping
- D) WHERE only works with numbers

**3. What does AVG(salary) return if the values are 100, 200, 300?**
- A) 600
- B) 300
- C) 200
- D) 100

**4. Which clause is REQUIRED when using aggregate functions with non-aggregated columns?**
- A) ORDER BY
- B) WHERE
- C) GROUP BY
- D) LIMIT

**5. What does MIN(price) return?**
- A) The average price
- B) The smallest price value
- C) The first price in the table
- D) The most common price

---

## Section B: Short Answer (5 Questions)

**6.** What is the difference between COUNT(*) and COUNT(column_name)?

**7.** Can you use WHERE to filter on an aggregate result? Explain why or why not.

**8.** Write a HAVING clause that keeps only groups with more than 5 members.

**9.** What happens if you SELECT a column that is not in GROUP BY and not aggregated?

**10.** Give a real-world example where you would use SUM with GROUP BY.


---

## Section C: SQL Writing (5 Questions)

Use this table: `orders` (id, customer_id, product_name, quantity, price, order_date)

**11.** Write a query to count the total number of orders in the table.

**12.** Write a query to find the total revenue (SUM of quantity * price) per customer.

**13.** Write a query to find the average order price for each product, but only show products with an average price above 50.

**14.** Write a query to find the customer who has placed the most orders.

**15.** Write a query to show the minimum, maximum, and average price for each product_name.

---

## Section D: Speaking Challenge

**Scenario:** Your manager asks: "Can you tell me which departments are spending too much? I want to see only departments where total salary expenses exceed $100,000."

Explain your approach using GROUP BY and HAVING. Make it clear and non-technical.

**Khmer Context:** ពន្យល់វិធីសាស្រ្តរបស់អ្នកដោយប្រើ GROUP BY និង HAVING។ ធ្វើឱ្យសាមញ្ញនិងមិនបច្ចេកទេស។

---

## Answer Key

### Section A: Multiple Choice

1. **B** - COUNT(*) returns total number of rows including those with NULLs
2. **B** - WHERE filters before grouping; HAVING filters after grouping
3. **C** - AVG(100, 200, 300) = 600/3 = 200
4. **C** - GROUP BY is required with non-aggregated columns alongside aggregates
5. **B** - MIN returns the smallest value in the column


### Section B: Short Answer

6. `COUNT(*)` counts all rows including NULLs. `COUNT(column_name)` counts only non-NULL values in that specific column.

7. **No.** WHERE filters individual rows before aggregation happens. To filter on aggregate results, you must use HAVING (which filters after GROUP BY calculates the groups).

8. `HAVING COUNT(*) > 5`

9. Most databases will return an error. The column must either be in the GROUP BY clause or wrapped in an aggregate function. (MySQL may allow it but returns unpredictable results.)

10. A store owner wants to see total sales per month: `SELECT MONTH(order_date), SUM(quantity * price) FROM orders GROUP BY MONTH(order_date);`

### Section C: SQL Writing

**11.**
```sql
SELECT COUNT(*) AS total_orders FROM orders;
```

**12.**
```sql
SELECT customer_id, SUM(quantity * price) AS total_revenue
FROM orders
GROUP BY customer_id;
```

**13.**
```sql
SELECT product_name, AVG(price) AS avg_price
FROM orders
GROUP BY product_name
HAVING AVG(price) > 50;
```

**14.**
```sql
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 1;
```

**15.**
```sql
SELECT product_name,
       MIN(price) AS min_price,
       MAX(price) AS max_price,
       AVG(price) AS avg_price
FROM orders
GROUP BY product_name;
```

### Section D: Speaking Challenge - Sample Answer

"I would group all employees by their department, then add up all salaries in each group. Think of it like sorting receipts into folders by department, then totaling each folder. After calculating the totals, I use HAVING to show only those departments where the total exceeds $100,000. It's like saying 'show me only the folders that are too thick.' WHERE can't do this because it looks at individual receipts before they're sorted into folders."
