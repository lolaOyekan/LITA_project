SELECT  
    FORMAT(OrderDate, 'yyyy-MM') AS OrderMonth, 
    SUM(quantity * unitprice) AS totalSales
FROM  
    Capstone.dbo.customers
WHERE 
    YEAR(OrderDate) = 2024
GROUP BY 
    FORMAT(OrderDate, 'yyyy-MM')
ORDER BY 
    OrderMonth;

