Create DATABASE sql_joins;
Use sql_joins;

Question-1. Retrieve all customers who have placed at least one order.

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

Question 2. Retrieve all customers and their orders, including customers who have not placed any orders

SELECT 	c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
from customers as c left join orders o
on c.customerID = o.customerID ;

Question 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.

SELECT o.OrderID, o.OrderDate, o.Amount, c.CustomerID, c.CustomerName, c.City
FROM Customers as C right join Orders as o
ON c.CustomerID = o.CustomerID;

Question 4. Display all customers and orders, whether matched or not.

SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate, o.Amount
FROM Customers as c left join orders o
ON c.customerID = o.customerID
UNION
SELECT c.CustomerID, c.CustomerName, o.OrderID, o.OrderDate, o.Amount
FROM Customers as c right join orders o
ON c.customerID = o.customerID;

Question 5. Find customers who have not placed any orders.

SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

Question 6. Retrieve customers who made payments but did not place any orders.

SELECT  c.CustomerID, c.CustomerName, c.City
FROM customers as c INNER JOIN payments as p
ON c.CustomerID = p.CustomerID
LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL;

Question 7. Generate a list of all possible combinations between Customers and Orders.

SELECT *
FROM Customers CROSS JOIN Orders;

Question 8. Show all customers along with order and payment amounts in one table.

SELECT  c.CustomerID, c.CustomerName, c.City, o.OrderID, o.Amount AS OrderAmount, p.PaymentID, p.Amount AS PaymentAmount
FROM Customers as c LEFT JOIN Orders as o
ON c.CustomerID = o.CustomerID
LEFT JOIN payments as p
ON c.CustomerID = p.CustomerID;

Question 9. Retrieve all customers who have both placed orders and made payments.

SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID;






