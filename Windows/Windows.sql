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
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) AS ProductStatus
FROM Sales.Orders

-- RANK Customer based on their total sales

SELECT CustomerID,
SUM(Sales) TotalSales,
RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID;

-- Find the total sales of each product
-- Find the total sales across all orders
-- Additionally provide details such as Order Id, Order date

SELECT ProductID, OrderId, OrderDate, OrderStatus,
SUM(Sales) OVER () TotalSales,
SUM(Sales) OVER (PARTITION BY ProductId) ProductSales,
SUM(Sales) OVER (PARTITION BY ProductId, OrderStatus) ProductOrderStatusSales 
FROM Sales.Orders