USE SalesDB;

SELECT *,
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
DATETRUNC(HOUR, CreationTime) AS Reset_minsSecs
FROM Sales.Orders