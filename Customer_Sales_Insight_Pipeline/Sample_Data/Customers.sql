CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName) VALUES
(1, 'Alice', 'Smith'),
(2, 'Bob', 'Johnson'),
(3, 'Charlie', 'Brown');
