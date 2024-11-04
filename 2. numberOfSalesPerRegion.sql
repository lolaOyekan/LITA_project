select region, count(orderid) 
as countOfSalesPerRegion from  
Capstone.dbo.customers 
group by region