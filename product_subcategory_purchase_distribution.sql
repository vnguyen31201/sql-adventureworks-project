-- How much of each product subcategory is each gender buying?
WITH products AS (
    SELECT  p.ProductKey,
            sc.EnglishProductSubCategoryName AS SubCategory,
            c.EnglishProductCategoryName AS Category
    FROM dbo.DimProduct AS p
    JOIN dbo.DimProductSubCategory AS sc ON p.ProductSubCategoryKey = sc.ProductSubCategoryKey
    JOIN dbo.DimProductCategory AS c ON sc.ProductCategoryKey = c.ProductCategoryKey
)

SELECT p.Category, p.SubCategory, c.Gender, SUM(s.SalesAmount) AS TotalSales
FROM products AS p
JOIN dbo.FactInternetSales AS s ON p.ProductKey = s.ProductKey
JOIN dbo.DimCustomer AS c ON s.CustomerKey = c.CustomerKey
GROUP BY p.SubCategory, p.Category, c.Gender;