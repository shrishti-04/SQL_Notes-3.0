

USE SalesDB;

-- Find the average scores of the customers

SELECT CustomerID,
Score,
AVG(Score) OVER () AS AvgScores1,
-- it handles null value as well in order to get correct avg value
AVG(COALESCE(Score, 0)) OVER () AS AvgScores2
FROM Sales.Customers;