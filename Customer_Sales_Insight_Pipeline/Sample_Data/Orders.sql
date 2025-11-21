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

