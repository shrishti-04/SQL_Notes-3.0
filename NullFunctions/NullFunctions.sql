USE SalesDB;

-- Find the average scores of the customers

SELECT CustomerID,
Score,
AVG(Score) OVER () AS AvgScores1,
-- it handles null value as well in order to get correct avg value
AVG(COALESCE(Score, 0)) OVER () AS AvgScores2
FROM Sales.Customers;

-- HANDLING NULLS - MATHEMATICAL OPERATIONS

-- Display the full name of Customer in a single field by merging the first and last name
-- and add 10 bonus points to each customer's score

SELECT FirstName, LastName,
-- This won't support in case of null values thus it will give NULL only
(FirstName + ' ' + Lastname) AS FullName,
-- Thus we will use COALESCE in order to replace null value
(FirstName + ' ' + COALESCE(Lastname, '')) AS CorrecFullName,
-- This won't support in case of null values as well
Score, (Score + 10) AS UpdatedScore,
-- Use COALESCE again
Score, (COALESCE(Score, 0) + 10) AS UpdatedCorrectScore
FROM Sales.Customers

-- HANDLING NULLS - SORT DATA

-- Sort the customer from lowest to highest score
-- with nulls appearing last

SELECT CustomerID, Score,
CASE WHEN Score IS NULL THEN 1 ELSE 0 END AS Flag
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score DESC;