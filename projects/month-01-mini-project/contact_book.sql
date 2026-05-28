-- =====================================================
-- MONTH 1 MINI-PROJECT: Contact Book Database
-- =====================================================
-- This project demonstrates all Month 1 skills:
-- CREATE TABLE, INSERT, SELECT, UPDATE, DELETE
-- Constraints: PRIMARY KEY, NOT NULL, UNIQUE, DEFAULT, CHECK
-- WHERE with: =, !=, >, <, AND, OR, IN, BETWEEN, IS NULL
-- =====================================================

-- Step 1: Create the contacts table
CREATE TABLE contacts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone TEXT UNIQUE,
    email TEXT UNIQUE,
    city TEXT,
    category TEXT NOT NULL DEFAULT 'personal'
        CHECK(category IN ('personal', 'work', 'family', 'other')),
    notes TEXT,
    created_date TEXT NOT NULL DEFAULT (date('now'))
);

-- Step 2: Insert 12 contacts with varied data
INSERT INTO contacts (first_name, last_name, phone, email, city, category, notes, created_date)
VALUES
    ('Sokha', 'Keo', '012-345-678', 'sokha@email.com', 'Phnom Penh', 'work', 'Project manager at TechCo', '2024-01-15'),
    ('Dara', 'Phan', '098-765-432', 'dara@gmail.com', 'Siem Reap', 'personal', NULL, '2024-01-20'),
    ('Chantha', 'Sok', '011-222-333', NULL, 'Phnom Penh', 'work', 'Senior developer', '2024-02-01'),
    ('Visal', 'Meng', NULL, 'visal@company.com', 'Battambang', 'family', 'Cousin', '2024-02-10'),
    ('Bopha', 'Ly', '077-888-999', 'bopha@email.com', 'Phnom Penh', 'work', 'Client - design agency', '2024-03-05'),
    ('Rith', 'Chan', '012-111-444', NULL, 'Kampot', 'personal', NULL, '2024-03-12'),
    ('Maly', 'Heng', '096-555-777', 'maly@startup.io', 'Phnom Penh', 'work', 'Startup founder', '2024-03-20'),
    ('Vanna', 'Ros', NULL, NULL, 'Siem Reap', 'family', 'Uncle', '2024-04-01'),
    ('Navy', 'Oun', '015-999-000', 'navy@school.edu', 'Phnom Penh', 'other', 'Teacher', '2024-04-15'),
    ('Kosal', 'Thun', '012-888-123', 'kosal@tech.com', 'Battambang', 'work', 'Freelance developer', '2024-05-01'),
    ('Srey', 'Mom', '077-444-555', NULL, 'Kampot', 'personal', 'Neighbor', '2024-05-10'),
    ('Pich', 'Nak', NULL, 'pich@email.com', NULL, 'other', NULL, '2024-05-20');


-- =====================================================
-- Step 3: QUERIES - Reading and filtering data
-- =====================================================

-- Query 1: Find all contacts in Phnom Penh
SELECT first_name, last_name, phone, category
FROM contacts
WHERE city = 'Phnom Penh';

-- Query 2: Find contacts without an email address
SELECT first_name, last_name, phone
FROM contacts
WHERE email IS NULL;

-- Query 3: Find work contacts who have phone numbers
SELECT first_name, last_name, phone, notes
FROM contacts
WHERE category = 'work' AND phone IS NOT NULL;

-- Query 4: Find contacts in Phnom Penh OR Siem Reap
SELECT first_name, last_name, city
FROM contacts
WHERE city IN ('Phnom Penh', 'Siem Reap');

-- Query 5: Find contacts added between March and May 2024
SELECT first_name, last_name, created_date
FROM contacts
WHERE created_date BETWEEN '2024-03-01' AND '2024-05-31';

-- Query 6: Find contacts with BOTH email and phone
SELECT first_name, last_name, phone, email
FROM contacts
WHERE phone IS NOT NULL AND email IS NOT NULL;

-- Query 7: Count total contacts by category
SELECT category, COUNT(*) AS total
FROM contacts
GROUP BY category;

-- Query 8: Find contacts NOT in the 'personal' category
SELECT first_name, last_name, category
FROM contacts
WHERE category != 'personal';


-- =====================================================
-- Step 4: UPDATE - Modifying existing data
-- =====================================================

-- Query 9: Update Visal's phone number (he was missing one)
-- Safety: SELECT first to verify
SELECT * FROM contacts WHERE id = 4;
UPDATE contacts SET phone = '099-777-555' WHERE id = 4;

-- Query 10: Update Rith's category from personal to work
SELECT * FROM contacts WHERE first_name = 'Rith';
UPDATE contacts SET category = 'work', notes = 'New colleague' WHERE id = 6;

-- =====================================================
-- Step 5: DELETE - Removing data safely
-- =====================================================

-- Query 11: Delete contact with no phone, no email, and no notes
-- Safety: SELECT first!
SELECT * FROM contacts WHERE phone IS NULL AND email IS NULL AND notes IS NULL;
-- Only delete if the SELECT shows the correct row
DELETE FROM contacts WHERE id = 12 AND phone IS NULL AND email IS NULL;

-- =====================================================
-- Step 6: Verify final state
-- =====================================================

-- Show all contacts after changes
SELECT id, first_name, last_name, phone, email, city, category
FROM contacts
ORDER BY last_name;

-- Final count
SELECT COUNT(*) AS remaining_contacts FROM contacts;

-- =====================================================
-- PROJECT COMPLETE!
-- Skills demonstrated: CREATE TABLE, INSERT, SELECT,
-- WHERE (=, !=, AND, OR, IN, BETWEEN, IS NULL, IS NOT NULL),
-- UPDATE with safety check, DELETE with safety check
-- =====================================================
