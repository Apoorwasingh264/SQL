Create DATABASE sql_joins;
Use sql_joins;

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;


SELECT 	c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
from customers as c left join orders o
on c.customerID = o.customerID ;

SELECT o.OrderID, o.OrderDate, o.Amount, c.CustomerID, c.CustomerName, c.City
FROM Customers as C right join Orders as o
ON c.CustomerID = o.CustomerID;

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate, o.Amount
FROM Customers as c left join orders o
ON c.customerID = o.customerID
UNION
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate, o.Amount
FROM Customers as c right join orders o
ON c.customerID = o.customerID;

SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

SELECT  c.CustomerID, c.CustomerName, c.City
FROM customers as c INNER JOIN payments as p
ON c.CustomerID = p.CustomerID
LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL;

SELECT *
FROM Customers JOIN Orders;

SELECT  c.CustomerID, c.CustomerName, c.City, o.OrderID, o.Amount AS OrderAmount, p.PaymentID, p.Amount AS PaymentAmount
FROM Customers as c LEFT JOIN Orders as o
ON c.CustomerID = o.CustomerID
LEFT JOIN payments as p
ON c.CustomerID = p.CustomerID;

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID;






