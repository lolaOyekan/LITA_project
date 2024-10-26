# LITA_Class_Documentation_Process

### Project Title: Retail Sales Analysis
-----
### Table of Contents
1. Overview
2. Goals
3. Data
4. Tools
5. Process
6. Findings
7. Results

### Project Overview
------
This project explores the sales data of a retail store to uncover insights like top-selling products, regional sales performance, and monthly trends. 
The analysis results are displayed in an interactive Power BI.

-----
### Goals
1. Identify best-selling products.
2. Compare sales across regions.
3. Discover monthly sales trends.
4. Create an interactive Power BI dashboard for easy viewing.   
------
### Data
The primary data used here comes from Capstone dataset, which were downloaded from the LMS Canvas site. These datasets, carefully curated, include query languages and various other resources.
1. Source: Provided by Capstone.
2. Fields: Product ID, Category, Region, Sales, Date, Quantity Sold.
------
### Tools
1. Excel: Data Entry.
2. SQL: Storing and processing information in a relational database.
3. Power BI: Dashboard and data visualization.
4. GitHub: Project storage and sharing.
-------
### Process
1. Data Cleaning: Managed missing values and formatted columns.
2. Exploration: Found key trends by product, region, and month.
3. Visualization: Created an interactive dashboard in Power BI.
------
### Excel Data Exploration
1. Conducted initial data exploration using pivot tables to summarize total sales by product, region, and month.
2. Applied Excel formulas to calculate metrics, including average sales per product and total revenue by region, to gain insights into performance across segments. (input image here)
-----
### SQL Queries for Sales Analysis
In this project, I used SQL to answer key questions about sales performance. Below are the queries and the logic behind each one;
-----
i. Retrieve Total Sales per Product Category
I calculated the total sales for each product category to understand which categories generate the most revenue:

= SELECT Product, sum(UnitPrice) AS total_sales
FROM Capstone.dbo.customers
GROUP BY Product
ORDER BY total_sales DESC; <<
------
ii. Count Sales Transactions per Region
Here, I found the total number of sales transactions in each region:
= select region, count(orderid) 
as countOfSalesPerRegion from  
Capstone.dbo.customers 
group by region <<
-------
iii. Identify the Highest-Selling Product by Total Sales Value
I identified the product with the highest total sales value:

=SELECT Product, max(UnitPrice) AS total_sales
FROM Capstone.dbo.customers
GROUP BY Product
ORDER BY total_sales DESC; <<
-------
iv. Calculate Total Revenue per Product
To see the revenue each product generated, I calculated the total sales for each product:

= SELECT 
    product, 
    SUM(quantity * unitprice) AS totalrevenue 
FROM 
    Capstone.dbo.customers
GROUP BY 
    product; <<
--------
v. Calculate Monthly Sales Totals for the Current Year
To see this, you will calculate the monthly sales totals for this year to spot seasonal trends:

= SELECT  
    FORMAT(OrderDate, 'yyyy-MM') AS OrderMonth, 
    SUM(quantity * unitprice) AS totalSales
FROM  
    Capstone.dbo.customers
WHERE 
    YEAR(OrderDate) = 2024
GROUP BY 
    FORMAT(OrderDate, 'yyyy-MM')
ORDER BY 
    OrderMonth; <<
------
vi. Find Top 5 Customers by Total Purchase Amount
I determined the top 5 customers based on their total purchase amounts:

= select top 5  "customer id", (quantity * unitprice) as top5customers from Capstone.dbo.customers ORDER BY top5customers DESC <<
-------
vii. Calculate Each Region’s Percentage of Total Sales
To see how each region contributed to total sales, I calculated the sales percentage for each region:

= WITH total_sales AS (
    SELECT SUM(quantity * unitprice) AS total
    FROM Capstone.dbo.customers
)
SELECT region, 
       SUM(quantity * unitprice) AS region_sales,
       (SUM(quantity * unitprice) / total.total) * 100 AS percentage_of_total
FROM Capstone.dbo.customers, total_sales total
GROUP BY region, total.total;
-----
viii. Identify Products with No Sales in the Last Quarter
I identified products with zero sales in the last quarter to review underperforming items:

= SELECT DISTINCT c1.product
FROM Capstone.dbo.customers c1
LEFT JOIN (
    SELECT DISTINCT product
    FROM Capstone.dbo.customers
    WHERE MONTH(OrderDate) IN (10, 11, 12)
) c2 ON c1.product = c2.product
WHERE c2.product IS NULL; <<






   



