USE MyDatabase;
SELECT * FROM dbo.customers

-- Insert two new rows in customer table

INSERT INTO dbo.customers (id, first_name, country, score)
VALUES (6, 'Shrishti', 'India', 850),
(7, 'Andreas', 'Germany', NULL);

INSERT INTO dbo.customers (id, first_name)
VALUES (8, 'Sarah');

INSERT INTO dbo.customers
VALUES (9, 'Shreya', 'India', 700),
(10, 'Siddhi', NULL, 800);

-- Insert data from customers table into persons table

INSERT INTO dbo.persons (id, persone_name, birth_date, phone)
SELECT id, first_name, NULL, 'unknown'
FROM dbo.customers

SELECT * FROM dbo.persons;
