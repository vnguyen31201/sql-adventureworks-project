-- Which month saw the highest sales overall?
SELECT d.EnglishMonthName AS Month, SUM(s.SalesAmount) AS TotalSales
FROM dbo.FactInternetSales AS s
JOIN dbo.DimDate AS d
ON s.OrderDateKey = d.DateKey
GROUP BY d.EnglishMonthName
ORDER BY TotalSales DESC;