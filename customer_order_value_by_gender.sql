-- What is the average order value per customer by gender and what was the top product of each gender?
-- Average Order Value per Customer by Gender
WITH CustomerOrderValues AS (
    SELECT 
        c.CustomerKey,
        c.Gender,
        SUM(s.SalesAmount) AS TotalCustomerSales,
        COUNT(DISTINCT(s.SalesOrderNumber)) AS OrdersPerCustomer
    FROM dbo.FactInternetSales AS s
    JOIN dbo.DimCustomer AS c ON s.CustomerKey = c.CustomerKey
    GROUP BY c.CustomerKey, c.Gender
),
AverageOrderValueByGender AS (
    SELECT 
        Gender,
        AVG(TotalCustomerSales / NULLIF(OrdersPerCustomer, 0)) AS AvgOrderValue
    FROM CustomerOrderValues
    GROUP BY Gender
)

-- Top Product per Gender
, TopProducts AS (
    SELECT 
        c.Gender,
        p.EnglishProductName AS ProductName,
        SUM(s.SalesAmount) AS TotalSales
    FROM dbo.FactInternetSales AS s
    JOIN dbo.DimCustomer AS c ON s.CustomerKey = c.CustomerKey
    JOIN dbo.DimProduct AS p ON s.ProductKey = p.ProductKey
    GROUP BY c.Gender, p.EnglishProductName
),
TopProductByGender AS (
    SELECT tp.Gender, tp.ProductName, tp.TotalSales
    FROM TopProducts tp
    JOIN (
        SELECT Gender, MAX(TotalSales) AS MaxSales
        FROM TopProducts
        GROUP BY Gender
    ) tpm
    ON tp.Gender = tpm.Gender AND tp.TotalSales = tpm.MaxSales
)

-- Combine Average Order Value and Top Product
SELECT 
    aov.Gender,
    ROUND(aov.AvgOrderValue, 2) AS AvgOrderValue,
    tpb.ProductName AS TopProduct
FROM AverageOrderValueByGender aov
LEFT JOIN TopProductByGender tpb ON aov.Gender = tpb.Gender;