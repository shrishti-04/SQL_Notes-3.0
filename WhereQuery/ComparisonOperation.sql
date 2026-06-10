USE MyDatabase;

-- Retrieve all the customers from Germany Country

SELECT * FROM dbo.customers
WHERE country = 'Germany';

-- Retrieve all the customers not from Germany Country

SELECT * FROM dbo.customers
WHERE country <> 'Germany';

SELECT * FROM dbo.customers
WHERE country != 'Germany';

-- Retrieve all the customers score is 500 or more

SELECT * FROM dbo.customers
WHERE score >= 500;

-- Retrieve all the customers score is 500 or less

SELECT * FROM dbo.customers
WHERE score <= 500;