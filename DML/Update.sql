-- Update the score for a specific customers from customer table

USE MyDatabase;

UPDATE dbo.customers
SET score = 950
WHERE ID = 6;

SELECT * FROM dbo.customers;

UPDATE dbo.customers
SET country = 'UK',
score = 0
WHERE id = 10;

-- Update the score of the customers to zero instead of null values

UPDATE dbo.customers
SET score = 0
WHERE score IS NULL;