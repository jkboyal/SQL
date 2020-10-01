use AdventureWorks2008R2;

/* Select product id, name and selling start date for all products that started selling after 01/01/2005 and had a red color.
 Use the CAST function in the SELECT clause to display the date only for the selling start date. Use an alias to create a
 meaningful column heading if a column heading is missing.
 Sort the returned data by the selling start date.*/SELECT ProductID, Name, CAST(SellStartDate AS Date) AS SellStartDate, ColorFROM Production.ProductWHERE Color = 'Red'AND SellStartDate >= '01/01/2005';/* Write a query to retrieve the number of products that take two days to manufacture and have the black color. 
Use an alias to create a meaningful column haeding if a column heading is missing. */

SELECT COUNT(ProductID) AS [Number of Products]
FROM Production.Product
WHERE Color = 'Black'
AND DaysToManufacture = '2';

/* Write a query to select the product id, name, and list price for the product(s) that have a list price greater than the
 average list price plus $10. Sort the returned data by the list price in descending. */

SELECT ProductID, Name, ListPrice,
(SELECT AVG(ListPrice) +10 
FROM Production.Product) AS [Average Price]
FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) + 10
FROM Production.Product)
ORDER BY ListPrice DESC;

/* Write a query to retrieve the total quantity sold for the product(s) that have the red color. Include only products 
that have a total quantity sold greater than 2000. Include the product ID, product name, and total quantity sold columns 
in the report. Sort the returned data by the total quantity sold in the descending order. */SELECT p.ProductID, p.Name, COUNT(s.OrderQty) AS Quantity
FROM Production.Product p 
inner join Sales.SalesOrderDetail s
ON p.ProductID = s.ProductID
WHERE p.color = 'Red'
GROUP BY p.ProductID, p.Name
HAVING COUNT(s.OrderQty) > 2000
ORDER BY Quantity DESC;

/* Write a query to retrieve the unique customers who have purchasedbothProduct ID 710 and Product ID 715 but have never
purchasedProduct ID 716.Include only the customer id in the returned data. Sort the returned data by the customer id. */

SELECT DISTINCT o.CustomerID
FROM Sales.SalesOrderDetail s
join Sales.SalesOrderHeader o
ON s.SalesOrderID = o.SalesOrderID
WHERE s.ProductID in ('710','715') and s.ProductID not in ('716');

/* Write a query to retrieve the highest and lowest order values foreach customer. Include the customer id, 
customer's lastname,firstname, lowest and highest order values in the report. Sort the returned data by the customer id. */
SELECT
	CustomerId,
	FirstName,
	LastName
FROM
	Sales.Customer c
inner join Person.Person p on
	c.PersonId = p.BusinessEntityId
	Order By CustomerId ASC
	
