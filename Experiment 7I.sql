CREATE TABLE Sales_UNF (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(50),
    CustomerCity VARCHAR(50),
    ProductDetails VARCHAR(200)
);

INSERT INTO Sales_UNF VALUES
(101, 1, 'Rahul', 'Lucknow', 'Laptop, Mouse'),
(102, 2, 'Priya', 'Delhi', 'Keyboard, Mouse'),
(103, 1, 'Rahul', 'Lucknow', 'Keyboard, Laptop');

SELECT * FROM Sales_UNF;

CREATE TABLE Sales_1NF (
    OrderID INT,
    CustomerID INT,
    CustomerName VARCHAR(50),
    CustomerCity VARCHAR(50),
    ProductName VARCHAR(50),
    PRIMARY KEY (OrderID, ProductName)
);

INSERT INTO Sales_1NF VALUES
(101, 1, 'Rahul', 'Lucknow', 'Laptop'),
(101, 1, 'Rahul', 'Lucknow', 'Mouse'),
(102, 2, 'Priya', 'Delhi', 'Keyboard'),
(102, 2, 'Priya', 'Delhi', 'Mouse'),
(103, 1, 'Rahul', 'Lucknow', 'Keyboard'),
(103, 1, 'Rahul', 'Lucknow', 'Laptop');

SELECT * FROM Sales_1NF;

CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(50),
    CustomerCity VARCHAR(50)
);

CREATE TABLE OrderProducts_2NF (
    OrderID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (OrderID, ProductName)
);

INSERT INTO Orders_2NF VALUES
(101, 1, 'Rahul', 'Lucknow'),
(102, 2, 'Priya', 'Delhi'),
(103, 1, 'Rahul', 'Lucknow');

INSERT INTO OrderProducts_2NF VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Keyboard'),
(103, 'Laptop');

SELECT * FROM Orders_2NF;
SELECT * FROM OrderProducts_2NF;

CREATE TABLE Customers_3NF (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    CustomerCity VARCHAR(50)
);

CREATE TABLE Orders_3NF (
    OrderID INT PRIMARY KEY,
    CustomerID INT
);

CREATE TABLE OrderProducts_3NF (
    OrderID INT,
    ProductName VARCHAR(50),
    PRIMARY KEY (OrderID, ProductName)
);

INSERT INTO Customers_3NF VALUES
(1, 'Rahul', 'Lucknow'),
(2, 'Priya', 'Delhi');

INSERT INTO Orders_3NF VALUES
(101, 1),
(102, 2),
(103, 1);

INSERT INTO OrderProducts_3NF VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Keyboard'),
(102, 'Mouse'),
(103, 'Keyboard'),
(103, 'Laptop');

SELECT * FROM Customers_3NF;
SELECT * FROM Orders_3NF;
SELECT * FROM OrderProducts_3NF;

SELECT
    O.OrderID,
    C.CustomerID,
    C.CustomerName,
    C.CustomerCity,
    OP.ProductName
FROM Orders_3NF O
INNER JOIN Customers_3NF C
    ON O.CustomerID = C.CustomerID
INNER JOIN OrderProducts_3NF OP
    ON O.OrderID = OP.OrderID
ORDER BY O.OrderID, OP.ProductName;

SELECT CustomerID, COUNT(*) AS TotalRows
FROM Customers_3NF
GROUP BY CustomerID;

SELECT OrderID, COUNT(*) AS TotalRows
FROM Orders_3NF
GROUP BY OrderID;

SELECT OrderID, ProductName, COUNT(*) AS TotalRows
FROM OrderProducts_3NF
GROUP BY OrderID, ProductName;
