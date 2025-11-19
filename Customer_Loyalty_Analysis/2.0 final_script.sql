


--              CUSTOMER RETENTION ANALYSIS
/* TASK:
   Customer Loyalty Analysis - Rank Customers Based on the Average Days Between Their Orders
*/

USE SalesDB;

SELECT
	CustomerID,
	AVG(DaysUntilNextOrder) AvgDaysB4NextOrder,
	RANK() OVER(ORDER BY COALESCE(AVG(DaysUntilNextOrder),99999)) RankAvg
FROM(
	SELECT
		OrderID,
		CustomerID,
		OrderDate AS CurrentOrder,
		LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) Nextorder,
		DATEDIFF(day,OrderDate,LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) DaysUntilNextOrder
	FROM Sales.Orders
)t
	GROUP BY CustomerID;