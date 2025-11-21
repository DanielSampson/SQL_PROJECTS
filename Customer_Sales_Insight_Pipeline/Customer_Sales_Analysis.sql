-- Customer Sales Insight Pipeline
-- Works with sample tables: Customers, Orders

-- Step 1: Calculate total sales per customer
WITH CTE_Total_Sales AS 
(
    SELECT 
        CustomerID,
        SUM(Sales) AS TotalSales
    FROM Orders
    GROUP BY CustomerID
),

-- Step 2: Find last order date per customer
CTE_Last_Order AS 
(
    SELECT
        CustomerID,
        MAX(OrderDate) AS LastOrder
    FROM Orders
    GROUP BY CustomerID
),

-- Step 3: Rank customers based on total sales
CTE_Customer_Rank AS 
(
    SELECT
        CustomerID,
        TotalSales,
        RANK() OVER(ORDER BY TotalSales DESC) AS CustomerRank
    FROM CTE_Total_Sales
),

-- Step 4: Segment customers based on total sales
CTE_Customer_Segment AS 
(
    SELECT
        CustomerID,
        TotalSales,
        CASE 
            WHEN TotalSales > 100 THEN 'High'
            WHEN TotalSales > 50 THEN 'Medium'
            ELSE 'Low'
        END AS CustomerSegment
    FROM CTE_Total_Sales
)

-- Final Output
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    cts.TotalSales,
    clo.LastOrder,
    ccr.CustomerRank,
    ccs.CustomerSegment
FROM Customers c
LEFT JOIN CTE_Total_Sales cts
    ON c.CustomerID = cts.CustomerID
LEFT JOIN CTE_Last_Order clo
    ON c.CustomerID = clo.CustomerID
LEFT JOIN CTE_Customer_Rank ccr
    ON c.CustomerID = ccr.CustomerID
LEFT JOIN CTE_Customer_Segment ccs
    ON c.CustomerID = ccs.CustomerID;
