-- Generate a report showing the total sales for each category:
-- High: If the sales higher than 50
-- Medium: If the sales between 20 and 50
-- Low: If the sales is lower than 20

-- Sort the result from lowest to highest

USE SalesDB;

SELECT Category, SUM(Sales) AS TotalSales
FROM(
	SELECT OrderID, Sales,
	CASE
	WHEN Sales > 50 THEN 'HIGH'
	WHEN Sales <= 50 AND Sales >= 20 THEN 'MEDIUM'
	ELSE 'LOW'
	END Category
	FROM Sales.Orders) AS condition
GROUP BY Category
ORDER BY TotalSales DESC;

-- Find the average scores of customers and treat Nulls as 0
-- Additionally provide details such CustomerID and LastName

SELECT
CustomerID,
LastName,
Score,
CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END ScoreClean,
AVG(Score) OVER() AvgCustomer,
AVG(
CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END) OVER() AvgCustomerClean
FROM Sales.Customers

-- Count how many times each customer has made an order with sales greater than 30

SELECT
	CustomerID,
	SUM(CASE
		WHEN Sales > 30 THEN 1
		ELSE 0
		END)
	TotalOrdersHighSales,
	COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID
