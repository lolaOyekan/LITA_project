SELECT DISTINCT c1.product
FROM Capstone.dbo.customers c1
LEFT JOIN (
    SELECT DISTINCT product
    FROM Capstone.dbo.customers
    WHERE MONTH(OrderDate) IN (10, 11, 12)
) c2 ON c1.product = c2.product
WHERE c2.product IS NULL;


