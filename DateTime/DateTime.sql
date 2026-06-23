USE SalesDB;

SELECT OrderId,
CreationTime,
YEAR(CreationTime) AS YEARS,
MONTH(CreationTime) AS MONTHS,
DAY(CreationTime) AS DAYS,
DATEPART(YEAR, CreationTime) AS DP_year,
DATEPART(MONTH, CreationTime) AS DP_month,
DATEPART(DAY, CreationTime) AS DP_day,
DATEPART(QUARTER, CreationTime) AS DP_quarter,
DATENAME(WEEKDAY, CreationTime) AS DP_weekName,
DATENAME(MONTH, CreationTime) AS DP_monthName,
DATETRUNC(HOUR, CreationTime) AS Reset_minsSecs,
DATETRUNC(DAY, CreationTime) AS Reset_Time,
DATETRUNC(MONTH, CreationTime) AS ResetDay,
DATETRUNC(YEAR, CreationTime) AS ResetMonth,
DATETRUNC(HOUR, CreationTime) AS Reset_minsSecs,
EOMONTH(CreationTime) AS EndOfMonth,
CAST(DATETRUNC(MONTH, CreationTime) AS DATE) AS StartOfMonth
FROM Sales.Orders

-- How many orders were placed each year?

SELECT YEAR(OrderDate) AS YEARS, COUNT(OrderID) AS OrderCount FROM Sales.Orders
GROUP BY YEAR(OrderDate)

-- How many orders were placed each month?

SELECT MONTH(OrderDate) AS Months, COUNT(OrderID) AS OrderCounts FROM Sales.Orders
GROUP BY MONTH(OrderDate)
ORDER BY COUNT(OrderID) DESC;

-- Show all orders that were placed during the month of February

SELECT OrderDate, OrderID FROM Sales.Orders
WHERE MONTH(OrderDate) = 2;

SELECT * FROM Sales.Orders
WHERE MONTH(OrderDate) = 2;

-- Show CreationTime using the following format
-- Day Wed Jan Q1 2025 12:34:56 PM

SELECT OrderID,
CreationTime,
'Day ' + FORMAT(CreationTime, 'ddd MMM') + ' Q' + DATENAME(QUARTER, CreationTime) + ' ' + FORMAT(CreationTime, 'yyyy hh:mm:ss tt') FormatGiven
FROM Sales.Orders

-- How many orders were placed each month along with its year?

SELECT FORMAT(OrderDate, 'MMM yy') AS OrderDate,
COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy');

-- Find the age of employee

SELECT EmployeeID, 
CONCAT(FirstName, ' ', LastName) AS EmployeeName,
DATEDIFF(YEAR, BirthDate, GETDATE()) AS AGE FROM Sales.Employees;

-- Find the average shipping duration in each days for each month.

SELECT MONTH(OrderDate) AS MonthS,
AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS Duration FROM sales.Orders
GROUP BY MONTH(OrderDate)

-- Time Gap Analysis
-- Find the number of days between each order and the previous order.

SELECT OrderID,
OrderDate AS CurrentDate,
LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousDate,
DATEDIFF(DAY, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) AS CurrentPreviousDuration
FROM Sales.Orders