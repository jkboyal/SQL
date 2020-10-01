USE Boyal_Japneet_Test;

CREATE FUNCTION fnSale(@YearofSale INT, @MonthofSale INT)
RETURNS FLOAT
AS
BEGIN
	DECLARE @TotalAmount FLOAT;
	SELECT @TotalAmount = SUM(TotalDue)
	FROM AdventureWorks2008R2.Sales.SalesOrderHeader
	GROUP BY DATEPART(YEAR, OrderDate), DATEPART(MONTH, OrderDate)
	HAVING DATEPART(YEAR, OrderDate)=@YearofSale AND DATEPART(MONTH, OrderDate)=@MonthofSale
	RETURN ISNULL(@TotalAmount, 0)
END;

SELECT dbo.fnSale(2005, 10) AS [Total Amount]
SELECT dbo.fnSale(2020, 10) AS [Total Amount]