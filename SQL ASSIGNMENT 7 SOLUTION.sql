Q1. What is a Common Table Expression (CTE), and how does it improve SQL query readability?

Ans- A Common Table Expression (CTE) is a temporary result set defined using the WITH clause in SQL. It acts like a named subquery that exists only for the duration of the query.

How it improves readability:
1. Breaks complex queries into smaller, logical steps.
2. Makes queries easier to understand and maintain.
3. Avoids repeated subqueries by reusing the CTE.

Q2. Why are some views updatable while others are read-only? Explain with an example.

Ans- Some views are updatable while others are read-only based on their complexity.

A view is updatable when it is created from a single table without joins, group by, or aggregate functions. Each row in the view maps directly to a row in the base table.
A view is read-only when it uses joins, GROUP BY, DISTINCT, or aggregate functions, because the database cannot determine how to update the original data.

Example:
Simple view on one table → updatable
View using AVG(salary) with GROUP BY → read-only

Q3. What advantages do stored procedures offer compared to writing raw SQL queries repeatedly?

Ans- Stored procedures are pre-written SQL programs saved in the database that can be executed whenever needed.

Advantages over raw SQL queries:

1. Reusability: Write once and use multiple times.
2. Better performance: Stored and compiled in the database, so execution is faster.
3. Security: Users can run the procedure without direct access to tables.
4. Maintainability: Changes can be made in one place instead of editing many queries.
5. Reduced network traffic: Only the procedure call is sent, not the full SQL code each time.

Q4. What is the purpose of triggers in a database? Mention one use case where a trigger is essential

Ans - Triggers are special database programs that automatically execute when a specific event occurs on a table, such as INSERT, UPDATE, or DELETE.

Purpose of triggers:

1. To enforce business rules.
2. To maintain data integrity.
3. To automate actions in response to changes in data.

Example use case:
A trigger can automatically update the stock quantity in an inventory table whenever a new sale is recorded. This ensures the stock is always accurate without manual updates.

Q5. Explain the need for data modelling and normalization when designing a database

Ans- Data modelling is the process of designing how data is organized, stored, and related in a database. It helps define tables, columns, and relationships before creating the actual database.

Normalization is the process of organizing data into proper tables to reduce redundancy and improve data integrity.

Need for data modelling and normalization:

1. Reduces duplicate and unnecessary data.
2. Maintains data accuracy and consistency.
3. Improves database performance.
4. Makes the database easier to maintain and update.
5. Ensures proper relationships between tables.

CREATE DATABASE Assignment_7;
USE Assignment_7;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

Q6. Write a CTE to calculate the total revenue for each product
 (Revenues = Price × Quantity), and return only products where  revenue > 3000.
 
Ans- WITH revenue_cte AS (
    SELECT 
        p.ProductID,
        p.ProductName,
        p.Price,
        s.Quantity,
        (p.Price * s.Quantity) AS Revenue
    FROM Products p
    JOIN Sales s
    ON p.ProductID = s.ProductID
)
SELECT ProductID, ProductName, Revenue
FROM revenue_cte
WHERE Revenue > 3000;

Q7. Create a view named vw_CategorySummary that shows:
Category, TotalProducts, AveragePrice. 

Ans- CREATE VIEW vw_CategorySummary AS
SELECT 
    Category,
    COUNT(ProductID) AS TotalProducts,
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

Q8. Create an updatable view containing ProductID, ProductName, and Price.
 Then update the price of ProductID = 1 using the view.
 
 Ans- CREATE VIEW vw_ProductPrice AS
SELECT ProductID, ProductName, Price
FROM Products;

UPDATE vw_ProductPrice
SET Price = 1300
WHERE ProductID = 1;

Q9. Create a stored procedure that accepts a category name and returns all products belonging to that
category.

Ans- DELIMITER $$

CREATE PROCEDURE GetProductsByCategory(IN CategoryName VARCHAR(50))
BEGIN
    SELECT *
    FROM Products
    WHERE Category = CategoryName;
END $$

DELIMITER ;

CALL GetProductsByCategory('Electronics');

Q10. Create an AFTER DELETE trigger on the products table that archives deleted product rows into a new table ProductArchive . The archive should store ProductID, ProductName, Category, Price, and DeletedAt timestamp.

Ans- CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt DATETIME
);

CREATE TRIGGER trg_AfterDeleteProduct
AFTER DELETE ON Products
FOR EACH ROW
INSERT INTO ProductArchive
(ProductID, ProductName, Category, Price, DeletedAt)
VALUES (
    OLD.ProductID,
    OLD.ProductName,
    OLD.Category,
    OLD.Price,
    NOW()
);



 