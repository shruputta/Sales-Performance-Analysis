use [ Sales Performance ]


select * from employees
select * from produts
select * from sales
select * from stores

-------------------------Total Sales Amount by Product Category------------------------------------------------
------- Write a SQL query to calculate the total sales amount by product category for the year.----------------
select p.ProductCategory,Round(SUM(s.SaleAmount),2) As TotalSalesAmount
from sales s
INNER JOIN produts p ON s.ProductID= p.ProductID
where YEAR(s.SaleDate)=2023
group by p.ProductCategory
order by TotalSalesAmount DESC


-----------------------------Top 3 Performing Stores-------------------------------------------------------
-------Write a SQL query to find the top 3 performing stores in terms of sales amount----------------------

select TOP 3 StoreName,TotalSalesAmount
from (
select st.StoreName,Round(SUM(S.SaleAmount),2) AS TotalSalesAmount
from sales S
Inner Join stores st ON s.StoreID=st.StoreID
where YEAR(S.SaleDate)=2023
group by st.StoreName ) AS TopStores
order by TotalSalesAmount DESC


----------------------------------Employee with the Highest Sales in Each Store:---------------------
 -----------Identify the employee with the highest sales in each store-------------------------------

 select st.StoreName,CONCAT(e.FirstName,' ',e.LastName)  AS EmployeeName, Round(MAX(s.SaleAmount),2) as HigestSales
 from sales s
 inner Join stores st ON s.StoreID=st.StoreID
 inner join employees e ON S.StoreID=e.StoreID
 WHERE YEAR(s.SaleDate) = 2023
GROUP BY st.StoreName,e.FirstName,e.LastName
order by HigestSales DESC

-------------------------------------Calculate Monthly Sales---------
------------- Analyze the monthly sales data to identify any declining trends in any product category or store.


select  YEAR(SaleDate) as SaleYear,MONTH(SaleDate) as SaleMonth,ProductCategory,StoreName,round(SUM(SaleAmount),2) as MonthlySalesAmount
FROM  sales s
Inner Join produts p  ON s.ProductID = p.ProductID
Inner join stores st ON s.StoreID = st.StoreID
group by  YEAR(SaleDate),MONTH(SaleDate),ProductCategory,StoreName
order by SaleYear,SaleMonth, ProductCategory,StoreName




-----Data related to sales, products, stores, and employees. We'll look at trends and patterns over time--------

SELECT   S.SaleDate,P.ProductCategory, SUM(S.QuantitySold) AS TotalQuantitySold,Round(SUM(S.SaleAmount),2) AS TotalSaleAmount
FROM Sales S
JOIN produts P ON S.ProductID = P.ProductID
GROUP BY S.SaleDate,P.ProductCategory
ORDER BY S.SaleDate


-------------employee turnover-----------
select YEAR(HireDate) as HireYear , COUNT(*) as TotalEmployee
from employees
group by YEAR(HireDate)
order By HireYear



----Product Availability----
SELECT  ProductCategory,  COUNT(*) AS TotalProducts
FROM   produts
group by    ProductCategory






