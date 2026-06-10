USE MyDatabase;

-- Retrieve all customers who fall in range between 100 and 500

SELECT * FROM dbo.customers
WHERE score BETWEEN 100 AND 500;