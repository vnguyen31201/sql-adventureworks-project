-- How did revenue vary by region each quarter?
SELECT r.EnglishCountryRegionName AS Country, DATEPART(QUARTER, s.OrderDate) AS OrderQuarter, ROUND(SUM(s.SalesAmount), 2) AS TotalSales
FROM dbo.FactInternetSales AS s
LEFT JOIN dbo.DimGeography AS r
ON s.SalesTerritoryKey = r.SalesTerritoryKey
GROUP BY r.EnglishCountryRegionName, DATEPART(QUARTER, s.OrderDate)
ORDER BY r.EnglishCountryRegionName, OrderQuarter;
