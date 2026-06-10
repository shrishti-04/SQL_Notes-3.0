-- Combine the data from Sales.Employees and Sales.Customers.

USE SalesDB;

SELECT 
CustomerID,
FirstName,
LastName
FROM Sales.Customers
UNION
SELECT 
EmployeeID,
FirstName,
LastName
FROM Sales.Employees;

-- Now combine the data from Sales.Employees and Sales.Customers using UNION ALL

SELECT 
CustomerID,
FirstName,
LastName
FROM Sales.Customers
UNION ALL
SELECT 
EmployeeID,
FirstName,
LastName
FROM Sales.Employees;

-- Find the Customers who are not Employees at the same time

SELECT FirstName, LastName
FROM Sales.Customers
EXCEPT
SELECT FirstName, LastName
FROM Sales.Employees;

-- Find the employees who are also customers

SELECT FirstName, LastName
FROM Sales.Employees
INTERSECT
SELECT FirstName, LastName
FROM Sales.Customers;

-- Orders are stored in different tables (Orders and OrdersArchive). Combine them without duplicates.

SELECT 'Orders' AS Source
      ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime] FROM Sales.Orders
UNION
SELECT 'OrdersArchieve' AS Source
      ,[OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime] FROM Sales.OrdersArchive
      ORDER BY OrderID