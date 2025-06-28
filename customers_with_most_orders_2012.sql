-- Which customers placed the most orders in 2012?
SELECT TOP 10 c.FirstName, c.LastName, SUM(s.SalesAmount) AS TotalSales
FROM dbo.FactInternetSales AS s
LEFT JOIN dbo.DimCustomer AS c
ON s.CustomerKey = c.CustomerKey
WHERE DATEPART(YEAR, s.OrderDate) = 2012
GROUP BY s.CustomerKey, c.FirstName, c.LastName
ORDER BY TotalSales DESC;
