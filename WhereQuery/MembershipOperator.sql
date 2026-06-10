USE MyDatabase;

-- Retrieve all customers from either Germany or USA

SELECT * FROM dbo.customers
WHERE country IN ('Germany', 'USA')