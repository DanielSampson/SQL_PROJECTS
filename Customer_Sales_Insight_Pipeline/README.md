# Customer Sales Insight Pipeline (Using SQL CTEs)

## 📌 Project Overview
This project analyzes customer purchasing behavior using SQL. 
It demonstrates how to use *Common Table Expressions (CTEs)* to build a modular pipeline that generates insights such as:

- Total sales per customer  
- Last purchase date  
- Customer ranking based on revenue  
- Customer segmentation (High / Medium / Low value customers)

The project uses a *sample dataset* for demonstration purposes.

---

## 🧩 Key SQL Concepts
- Multiple CTEs  
- Window functions (`RANK()`)  
- Aggregate functions (`SUM`, `MAX`)  
- `CASE` expressions  
- `LEFT JOIN`s  
- Modular SQL pipeline design  

---

## 🛠 Tools & Technologies
- SQL Server / T-SQL  
- Sample Sales dataset  

---

## 🗂 Files
- `Customer_Sales_Analysis.sql` → Main SQL script with analysis  
- `Sample_Data/Customers.sql` → Sample Customers table  
- `Sample_Data/Orders.sql` → Sample Orders table

---

## 3️⃣ Sample Data Files

**Sample_Data/Customers.sql**
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName) VALUES
(1, 'Alice', 'Smith'),
(2, 'Bob', 'Johnson'),
(3, 'Charlie', 'Brown');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Sales DECIMAL(10,2),
    OrderDate DATE
);


INSERT INTO Orders (OrderID, CustomerID, Sales, OrderDate) VALUES
(101, 1, 120.50, '2025-01-15'),
(102, 2, 75.00, '2025-01-20'),
(103, 1, 40.00, '2025-02-05'),
(104, 3, 60.00, '2025-02-10'),
(105, 2, 55.50, '2025-03-01');
