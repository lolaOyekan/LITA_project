SELECT 
    product, 
    SUM(quantity * unitprice) AS totalrevenue 
FROM 
    Capstone.dbo.customers
GROUP BY 
    product;
