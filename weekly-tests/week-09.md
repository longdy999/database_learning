# Week 9 Test — Relationships & Foreign Keys

## Topics Covered
- One-to-One (1:1) relationships
- One-to-Many (1:N) relationships
- Many-to-Many (M:N) relationships
- Junction tables (bridge/linking tables)
- Foreign keys
- CASCADE options (ON DELETE, ON UPDATE)

---

## Part A: Multiple Choice (5 Questions)

**1. Which relationship type requires a junction table?**
- A) One-to-One
- B) One-to-Many
- C) Many-to-Many
- D) None of the above

**2. In a 1:N relationship between `departments` and `employees`, where is the foreign key placed?**
- A) In the departments table
- B) In the employees table
- C) In both tables
- D) In a separate table

**3. What does `ON DELETE CASCADE` do?**
- A) Prevents deletion of the parent row
- B) Sets the foreign key to NULL when parent is deleted
- C) Automatically deletes child rows when parent is deleted
- D) Logs the deletion for audit

**4. Which is an example of a 1:1 relationship?**
- A) Student and Courses
- B) Employee and Employee_Profile
- C) Author and Books
- D) Order and Products

**5. What is the purpose of a foreign key?**
- A) To make queries faster
- B) To enforce referential integrity between tables
- C) To create indexes automatically
- D) To allow NULL values


---

## Part B: Short Answer (5 Questions)

**6.** Explain the difference between a 1:N and M:N relationship. Give one real-world example of each.

**7.** What is a junction table? Why is it needed for M:N relationships?

**8.** Describe what happens when you use `ON DELETE SET NULL` on a foreign key.

**9.** Why should you NOT place a foreign key on both sides of a 1:1 relationship?

**10.** What is referential integrity and why is it important?

---

## Part C: SQL Writing (5 Questions)

**11.** Write SQL to create a 1:1 relationship between `users` and `user_profiles` tables.

**12.** Write SQL to create a 1:N relationship between `categories` and `products`.

**13.** Create a junction table `student_courses` for a M:N relationship between `students` and `courses`. Include enrollment_date.

**14.** Write SQL to add a foreign key with `ON DELETE CASCADE` to an existing `orders` table referencing `customers`.

**15.** Write a query that joins `authors`, `book_authors` (junction), and `books` to show all books by each author.

---

## Speaking Challenge

Explain to a client (in simple English):
> "Why do we need a separate table to connect students and courses,
> instead of putting all the course names inside the student table?"

Practice saying this clearly in 60 seconds.


---

## Answer Key

### Part A: Multiple Choice
1. **C** — Many-to-Many requires a junction table
2. **B** — FK goes on the "many" side (employees)
3. **C** — Child rows are automatically deleted
4. **B** — Each employee has exactly one profile
5. **B** — Foreign keys enforce referential integrity

### Part B: Short Answer

**6.** 1:N means one record relates to many (one department has many employees). M:N means many relate to many (many students take many courses). M:N needs a junction table.

**7.** A junction table sits between two tables in a M:N relationship. It holds foreign keys to both tables. Without it, you cannot properly represent M:N in a relational database.

**8.** ON DELETE SET NULL sets the foreign key column to NULL in child rows when the parent row is deleted, instead of deleting the child rows.

**9.** Placing FK on both sides creates circular dependency. Choose one side (usually the dependent/optional table) to hold the FK.

**10.** Referential integrity ensures every foreign key value matches an existing primary key in the referenced table. It prevents orphan records.

### Part C: SQL Writing

**11.**
```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);
CREATE TABLE user_profiles (
    profile_id INT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
```


**12.**
```sql
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
```

**13.**
```sql
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

**14.**
```sql
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE;
```

**15.**
```sql
SELECT a.author_name, b.book_title
FROM authors a
JOIN book_authors ba ON a.author_id = ba.author_id
JOIN books b ON ba.book_id = b.book_id
ORDER BY a.author_name;
```

---

## Scoring
- Part A: 2 points each = 10 points
- Part B: 4 points each = 20 points
- Part C: 6 points each = 30 points
- Speaking Challenge: 10 points
- **Total: 70 points** | Pass: 49+ points
