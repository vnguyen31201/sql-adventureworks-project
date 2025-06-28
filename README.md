# Sales Analysis Using SQL

## Project Overview

This SQL project explores the AdventureWorksDW2022 database. The goal is to derive business insights through various SQL queries.

The project demonstrates skills in writing complex SQL queries using CTEs, joins, grouping, and aggregate functions to answer realistic business questions.

## Business Questions Answered

* What is the average order value per customer by gender and what was the top product of each gender?
* Which customers placed the most orders in 2012?
* How much of each product subcategory is each gender buying?
* How did revenue vary by region each quarter?
* Which month saw the highest sales overall?
* What are the top 10 best-selling products by revenue?

## Data Source

| Table Name             | Purpose                            |
|------------------------|------------------------------------|
| `FactInternetSales`    | Sales transactions (fact table)    |
| `DimCustomer`          | Customer demographics              |
| `DimProduct`           | Product details                    |
| `DimGeography`         | Regional sales                     |
| `DimDate`              | Date hierarchy for time analysis   |

## Tools & Technologies

* VS Code (mssql)
* T-SQL (Transact-SQL)
* AdventureWorksDW2022 sample database

## Query Techniques Used

* Common Table Expressions (CTEs)
* Aggregate functions: SUM, COUNT, AVG, MAX
* GROUP BY and JOIN clauses
* COUNT(DISTINCT ...) to prevent overcounting
* Subqueries to extract top-performing products per group

## Output Sample

| Gender                 | AvgOrderValue                      | TopProduct                      |
|------------------------|------------------------------------|---------------------------------|
| F                      | 926.25                             | Mountain-200 Black, 46          |
| M                      | 897.81                             | Mountain-200 Black, 38          |

## How to Use

Connect to the AdventureWorksDW2022 database in SQL Server

Run the provided SQL script in your SQL editor

Modify filters or add WHERE conditions (e.g., for date ranges or regions) to refine the analysis

## File Included

* customer_order_value_by_gender.sql - Shows average order value by gender and their top product
* customers_with_most_orders_2012.sql - Sorts customers by number of orders in 2012
* product_subcategory_purchase_distribution.sql - Gender distribution per subcategory 
* revenue_by_region_by_quarter.sql - Filters revenue for each region per quarter
* sales_by_month.sql - Shows sales by month
* top_10_best_selling_products.sql - Shows top 10 best selling products
* README.md – documentation for the project

## Future Improvements

* Add regional analysis by joining with DimSalesTerritory
* Include date filtering using DimDate
* Perform the same analysis by age group, income level, or geography
* Visualize results in Power BI or Tableau

## Author

Vincent NguyenAspiring Data Analyst | SQL • Power BI • Data Storytelling

