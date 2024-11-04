WITH total_sales AS (
    SELECT SUM(quantity * unitprice) AS total
    FROM Capstone.dbo.customers
)
SELECT region, 
       SUM(quantity * unitprice) AS region_sales,
       (SUM(quantity * unitprice) / total.total) * 100 AS percentage_of_total
FROM Capstone.dbo.customers, total_sales total
GROUP BY region, total.total;
