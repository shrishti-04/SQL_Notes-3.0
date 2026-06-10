-- Delete all customers with an ID greater than 6

USE MyDatabase;

DELETE FROM dbo.customers
WHERE id > 5;

SELECT * FROM dbo.customers

SELECT * FROM dbo.PERSONS

-- Delete all data from the persons table

TRUNCATE TABLE dbo.PERSONS