USE MyDatabase;

-- Bring both the tables Customers and Orders table

SELECT * FROM dbo.customers;

SELECT * FROM dbo.orders;

-- Get all customers along with their orders, but only for customers who
-- have placed an order.

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo.customers c
INNER JOIN dbo.orders o 
ON c.id = o.customer_id;

-- Get all customers along with their orders, including those customers who
-- haven't placed an order.

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo.customers c
LEFT JOIN dbo.orders o 
ON c.id = o.customer_id;

-- Get all customers along with their orders, including those customers who
-- haven't placed an order.

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo.customers c
RIGHT JOIN dbo.orders o 
ON c.id = o.customer_id;

-- Get all customers along with their orders, 
-- including orders without matching customers.

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo. orders o
LEFT JOIN dbo.customers c 
ON c.id = o.customer_id;

-- Get all customers and all orders, even if there's no match.

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo. orders o
FULL JOIN dbo.customers c 
ON c.id = o.customer_id;

-- Get all customers who haven't placed any orders

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo.customers c
LEFT JOIN dbo.orders o
ON c.id = o.customer_id
WHERE order_id IS NULL;

-- Get all orders without matching customers

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo.customers c
RIGHT JOIN dbo.orders o
ON c.id = o.customer_id
WHERE c.id IS NULL; 

-- Get all orders without matching customers using left join

SELECT c.id, c.first_name, o.order_id, o.sales
FROM dbo.orders o
LEFT JOIN dbo.customers c
ON c.id = o.customer_id
WHERE c.id IS NULL; 

-- Return only rows that don't match in either tables

SELECT * FROM customers c
FULL JOIN orders o
ON c.id = o.customer_id
WHERE c.id IS NULL
OR o.order_id IS NULL;

-- Get all customers along with their orders, but only for customers
-- who have placed an order (without using inner join)

SELECT * FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id
WHERE o.order_id IS NOT NULL;

-- Generate all possible combinations of customers and orders

SELECT *
FROM customers
CROSS JOIN orders;

-- Using Sales DB Retrieve a list of all orders, along with the related customer, product, and employee details.
-- For each order, display:
-- Order ID, Customer's name, Product name, Sales, Price, Sales person's name

USE SalesDB;

SELECT * FROM Sales.Customers c;
SELECT * FROM Sales.Employees e;
SELECT * FROM Sales.Orders o;
SELECT * FROM Sales.OrdersArchive oa;
SELECT * FROM Sales.Products p;

SELECT o.OrderId, c.FirstName, c.LastName, p.Product, o.Sales, p.Price, e.FirstName, e.LastName
FROM Sales.Orders o
LEFT JOIN Sales.Customers c
ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products p
On o.ProductID = p.ProductID
LEFT JOIN Sales.Employees e 
On o.SalesPersonID = e.EmployeeID;

