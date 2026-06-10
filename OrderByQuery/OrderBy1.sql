-- Retrieve all customer & sort the results by the higher score first

SELECT * FROM customers
ORDER BY score DESC;

-- Retrieve all customer & sort the results by the lower score first

SELECT * FROM customers
ORDER BY score ASC;

-- Nested Order By

-- Retrieve all customers and sort the result by the country and then the highest score

SELECT * FROM customers
ORDER BY country ASC, 
		 score DESC;