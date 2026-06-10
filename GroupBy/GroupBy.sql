USE MyDatabase

SELECT * FROM customers;

-- Total score by country

SELECT country, SUM(score) AS total FROM dbo.customers
GROUP BY country;

-- Total score by country but greater than 800

SELECT country, SUM(score) AS total FROM dbo.customers
GROUP BY country
HAVING SUM(score) > 800;

/* Find the average score for each country considering only customers with a score not equal to 0.
And Returns only those countries with an average score greater than 430 */

SELECT country, AVG(score) FROM dbo.customers
WHERE score <> 0
GROUP BY country
HAVING AVG(score) > 430;

