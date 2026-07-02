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
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END ASC, Score DESC;

-- NULLIF USECASE

-- Find the sales price for each order by dividing sales by quantity

-- This will give error as one of the quantity is 0 and it is dividing by 0

SELECT OrderID, Sales, Quantity,
Sales / Quantity AS Price
FROM Sales.Orders

-- if quantity = 0 then it will throw NULL as result
-- that's how NULLIF works

SELECT OrderID, Sales, Quantity,
Sales / NULLIF(Quantity, 0) AS Price
FROM Sales.Orders

-- Identify the customers who have no scores

SELECT * FROM Sales.Customers
WHERE Score IS NULL;

-- Show the list of Customers who have scores

SELECT * FROM Sales.Customers
WHERE Score IS NOT NULL;

-- List all details of Customers who haven't place any order

SELECT * FROM Sales.Customers
SELECT * FROM Sales.Orders

SELECT C.*, OrderID FROM Sales.Customers C
LEFT JOIN Sales.Orders O ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL;

-- NULL VS Blank String VS Space String blank

WITH Orders AS (SELECT 1 ID, 'A' AS Category 
UNION
SELECT 2, NULL
UNION
SELECT 3, ''
UNION
SELECT 4, ' ')
SELECT *, 
DATALENGTH(Category) AS Category_len,
NULLIF(CATEGORY, TRIM(Category)) AS Category2,
DATALENGTH(TRIM(Category)) AS Category_len2,
COALESCE(NULLIF(TRIM(Category), ''), 'unknown') AS Category3
FROM Orders