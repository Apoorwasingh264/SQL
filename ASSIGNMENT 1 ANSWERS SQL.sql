CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
department VARCHAR(50),
salary INT,
hire_date DATE
);

USE company_db;
INSERT INTO employees(
employee_id, first_name, last_name, department, salary, hire_date)
VALUES 
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(103, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(104, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(105, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');

SELECT *
FROM employees
ORDER BY salary asc;

SELECT *
 FROM employees
 ORDER BY department asc, Salary desc;
 
 SELECT *
 FROM employees
 WHERE Department = 'IT'
 ORDER by hire_date desc;
 
 USE company_db;

CREATE table sales (
sales_id INT PRIMARY KEY,
customer_name VARCHAR(50),
amount INT,
sales_date DATE
);

INSERT INTO sales (
sales_id, customer_name, amount, sales_date
)
VALUES 
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');

SELECT *
FROM sales
ORDER BY amount desc;

SELECT *
FROM sales
WHERE customer_name = 'ADITI';

Q.9 What is the Difference Between a Primary Key and a Foreign Key?

Ans- A primary key is a column (or set of columns) that uniquely identifies each record in a table, and it cannot contain duplicate or NULL values.
A foreign key is a column in one table that refers to the primary key of another table to create a relationship between the two tables.

In simple words, a primary key uniquely identifies a row in its own table, while a foreign key is used to link one table to another and maintain data consistency.

Q. -  What Are Constraints in SQL and Why Are They Used?

Ans- Constraints in SQL are rules applied to table columns to control what type of data can be stored in them. They help ensure that the data in a database is accurate, valid, and consistent.

They are used because they:

prevent wrong or invalid data from being entered,

maintain data integrity, and

enforce relationships between tables.

For example, a PRIMARY KEY constraint ensures every record is unique, and a NOT NULL constraint makes sure a column cannot be left empty.

