USE MyDatabase;

-- Retrieve all customers who are from USA and have score greated than 500

SELECT * FROM dbo.customers
WHERE country = 'USA' AND score > 500;

-- Retrieve all customers who are from USA or have score greated than 500

SELECT * FROM dbo.customers
WHERE country = 'USA' OR score > 500;

-- Retrieve all customers with a score not less than 500

SELECT * FROM dbo.customers
WHERE NOT score < 500;