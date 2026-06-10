-- Retrieve Customer with a Score not equal to zero from Customer table

SELECT * FROM dbo.customers
WHERE score <> 0;

SELECT * FROM dbo.customers
WHERE score != 0;

-- Retrieve customers from Germany

SELECT * FROM dbo.customers
WHERE country = 'Germany';
