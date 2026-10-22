CREATE TABLE SalesOrders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    region VARCHAR(30),
    product VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
VALUES
(101, 'North', 'Laptop', 55000, '2026-01-10'),
(102, 'South', 'Mobile', 20000, '2026-01-15'),
(103, 'East', 'Tablet', 15000, '2026-02-05'),
(104, 'West', 'Laptop', 60000, '2026-02-12'),
(105, 'North', 'Mobile', 18000, '2026-03-01'),
(106, 'South', 'Laptop', 52000, '2026-03-10'),
(107, 'East', 'Mobile', 22000, '2026-04-05'),
(108, 'West', 'Tablet', 12000, '2026-04-15'),
(109, 'North', 'Laptop', 58000, '2026-05-01'),
(110, 'South', 'Mobile', 19000, '2026-05-10');

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

INSERT INTO SalesOrders
(customer_id, region, product, amount, order_date)
SELECT customer_id, region, product, amount, order_date
FROM SalesOrders;

SELECT COUNT(*) AS Total_Records
FROM SalesOrders;

EXPLAIN
SELECT *
FROM SalesOrders
WHERE customer_id = 105;

SELECT *
FROM SalesOrders
WHERE customer_id = 105;

EXPLAIN
SELECT *
FROM SalesOrders
WHERE region = 'North';

SELECT *
FROM SalesOrders
WHERE region = 'North';

EXPLAIN
SELECT *
FROM SalesOrders
WHERE product = 'Laptop'
AND amount > 50000;

SELECT *
FROM SalesOrders
WHERE product = 'Laptop'
AND amount > 50000;

EXPLAIN
SELECT *
FROM SalesOrders
WHERE YEAR(order_date) = 2026;

SELECT *
FROM SalesOrders
WHERE YEAR(order_date) = 2026;

EXPLAIN
SELECT region, SUM(amount) AS Total_Sales
FROM SalesOrders
GROUP BY region;

SELECT region, SUM(amount) AS Total_Sales
FROM SalesOrders
GROUP BY region;

CREATE INDEX idx_customer
ON SalesOrders(customer_id);

CREATE INDEX idx_region
ON SalesOrders(region);

CREATE INDEX idx_product_amount
ON SalesOrders(product, amount);

CREATE INDEX idx_order_date
ON SalesOrders(order_date);

EXPLAIN
SELECT *
FROM SalesOrders
WHERE customer_id = 105;

EXPLAIN
SELECT *
FROM SalesOrders
WHERE product = 'Laptop'
AND amount > 50000;

EXPLAIN
SELECT *
FROM SalesOrders
WHERE order_date >= '2026-01-01'
AND order_date < '2027-01-01';

SELECT *
FROM SalesOrders
WHERE order_date >= '2026-01-01'
AND order_date < '2027-01-01';

SHOW INDEX FROM SalesOrders;

SELECT COUNT(*) AS Final_Record_Count
FROM SalesOrders;

SELECT region, COUNT(*) AS Orders,
       SUM(amount) AS Total_Sales
FROM SalesOrders
GROUP BY region;
