SELECT Product, max(UnitPrice) AS total_sales
FROM Capstone.dbo.customers
GROUP BY Product
ORDER BY total_sales DESC;