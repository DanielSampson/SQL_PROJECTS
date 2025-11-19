# Customer Loyalty Analysis – SQL Project

## 📌 Overview
This project analyzes customer repeat purchase behavior to measure *loyalty and engagement* using SQL.  
It calculates the average days between orders for each customer and ranks them based on how quickly they return.

---

## 🧰 Tools Used
- SQL Server  
- Window Functions: LEAD(), RANK()  
- DATEDIFF() function  

---

## 📂 Dataset
The dataset can be created using the included file:  
dataset.sql

*Table:* Sale.Orders  
*Columns used:*  
- OrderID  
- CustomerID  
- OrderDate  

---

## 🧠 Steps & Analysis

We performed the following steps using SQL:

```sql
-- Step 1: Identify Next Order for Each Customer
SELECT 
    CustomerID, 
    OrderDate AS CurrentOrder,
    LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder
FROM Orders;

-- Step 2: Calculate Days Between Orders
SELECT 
    CustomerID, 
    OrderDate AS CurrentOrder,
    LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder,
    DATEDIFF(day, OrderDate, LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) AS DaysUntilNextOrder
FROM Orders;

-- Step 3: Average Days Before Next Order
SELECT
    CustomerID,
    AVG(DaysUntilNextOrder) AS AvgDaysB4NextOrder
FROM (
    SELECT 
        CustomerID,
        DATEDIFF(day, OrderDate, LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) AS DaysUntilNextOrder
    FROM Orders
) t
GROUP BY CustomerID;

-- Step 4: Rank Customers by Loyalty (Final Output)
SELECT
    CustomerID,
    AVG(DaysUntilNextOrder) AS AvgDaysB4NextOrder,
    RANK() OVER(ORDER BY AVG(DaysUntilNextOrder) ASC) AS RankAvg
FROM (
    SELECT 
        CustomerID,
        DATEDIFF(day, OrderDate, LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) AS DaysUntilNextOrder
    FROM Orders
) t
GROUP BY CustomerID;

## 📊 Final Output

Screenshot of final output (Step 4):

![Final Output](3.0%20Final_output.jpg)

Example Table:

| CustomerID | AvgDaysB4NextOrder | RankAvg |
|------------|------------------|---------|
| 1          | 18               | 1       |
| 2          | 34               | 2       |
| 3          | 34               | 2       |
| 4          | NULL             | 4       |

---

## 🔗 SQL Scripts

- [`dataset.sql`](1.0%20dataset.sql) → Script to create the dataset table  
- [`final_script.sql`](2.0%20final_script.sql) → Full customer loyalty analysis script
