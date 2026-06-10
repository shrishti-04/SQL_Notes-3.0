-- Find the count of total orders, total sales, average of sales, highest sales, and lowest sales

USE SalesDB;

SELECT
CustomerId,
COUNT(*) AS total_nr_sales,
SUM(Sales) AS total_sales,
AVG(Sales) AS avg_sales,
MAX(Sales) AS highest_sales,
MIN(Sales) AS lowest_sales
FROM Sales.Orders
GROUP BY CustomerID;