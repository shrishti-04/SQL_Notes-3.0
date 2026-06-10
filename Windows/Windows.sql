USE SalesDB;

-- Find the total sales for each product

-- This will throw error
SELECT OrderID, OrderDate, ProductID, SUM(Sales) 
FROM Sales.Orders
GROUP BY ProductID;

SELECT OrderID, OrderDate, ProductID, SUM(Sales)
OVER(PARTITION BY ProductID) TotalSales
FROM Sales.Orders;

-- Find the total sales across all orders
-- Find the total sales for each products
-- Find the total sales for each combination of products and 
-- Additionally provide details such as Order ID, Order date

SELECT OrderID, OrderDate, ProductID, OrderStatus, Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) ProductNOrderStatusTotalSales,
SUM(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate
ROWS UNBOUNDED PRECEDING) ProductTotalSales
FROM Sales.Orders

-- RANK Customer based on their total sales

SELECT CustomerID,
SUM(Sales) TotalSales,
RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID;