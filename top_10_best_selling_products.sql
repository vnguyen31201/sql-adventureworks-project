-- What are the top 10 best-selling products by revenue?
SELECT TOP 10 p.EnglishProductName AS ProductName, SUM(s.SalesAmount) AS TotalRevenue
FROM dbo.FactInternetSales AS s
LEFT JOIN dbo.DimProduct AS p
ON s.ProductKey = p.ProductKey
GROUP BY p.EnglishProductName
ORDER BY TotalRevenue DESC;
