-- Show a customer name together with their respective country's name

USE SalesDB;

SELECT FirstName, Country, CONCAT(FirstName, '-', Country)
FROM Sales.Customers;

-- Transform the customer's first name in uppercase

SELECT UPPER(FirstName), Country, CONCAT(FirstName, '-', Country)
FROM Sales.Customers;

-- Transform the customer's first name in lowercase

SELECT UPPER(FirstName) AS Large, LOWER(FirstName) AS Low, Country, CONCAT(FirstName, '-', Country)
FROM Sales.Customers;

-- Find whether there is any space in firstname or not.

SELECT * FROM Sales.Customers
WHERE FirstName != TRIM(FirstName)

-- Replace file extence from txt to csv

SELECT 'FILE.txt' AS oldFile,
REPLACE('FILE.txt', '.txt', '.csv') AS newFile;

-- Calculate the length of First Name from Customer table.

SELECT FirstName, LEN(FirstName)
FROM Sales.Customers

-- Retrieve the first two characters from the First Name

SELECT FirstName, LEFT(FirstName, 2) AS FirstChar
FROM Sales.Customers

-- Retrieve the last three characters from the First Name

SELECT FirstName, RIGHT(FirstName, 3) AS LastChar
FROM Sales.Customers

-- Retrieve Customer's First Name while removing its first character

SELECT FirstName, SUBSTRING(FirstName, 2, LEN(FirstName)) AS Part
FROM Sales.Customers