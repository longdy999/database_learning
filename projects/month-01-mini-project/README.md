# Month 1 Mini-Project: Contact Book Database

## Project Overview
Build a complete contact management database from scratch using all Month 1 skills.

## Objectives
- Design a table with proper columns and data types
- Use PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT, and CHECK constraints
- Insert realistic sample data (10+ contacts)
- Write useful queries for searching, filtering, updating, and deleting
- Practice safe UPDATE and DELETE patterns

## Requirements
1. Create a `contacts` table with at least 8 columns
2. Insert at least 10 contacts with varied data (some NULLs)
3. Write at least 10 useful queries covering all CRUD operations
4. Include comments explaining each query
5. Save all SQL in a .sql file

## Suggested Table Design
- id (PRIMARY KEY AUTOINCREMENT)
- first_name (TEXT NOT NULL)
- last_name (TEXT NOT NULL)
- phone (TEXT UNIQUE)
- email (TEXT UNIQUE)
- city (TEXT)
- category (TEXT DEFAULT 'personal')
- notes (TEXT)
- created_date (TEXT NOT NULL DEFAULT current date)

## Required Queries
1. Find all contacts in a specific city
2. Find contacts without an email (IS NULL)
3. Find work contacts with phone numbers
4. Update a contact's phone number
5. Delete a contact safely (SELECT first)
6. Find contacts by category using IN
7. Find contacts added in a date range using BETWEEN
8. Count total contacts
9. Find contacts with both email AND phone
10. Search by partial name (bonus: use LIKE if you explored ahead)

## Submission Checklist
- [ ] Table created with all constraints
- [ ] 10+ rows inserted with realistic data
- [ ] 10+ queries written and tested
- [ ] All queries have comments
- [ ] File saved as contact_book.sql
