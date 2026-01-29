Create database assignment_5;
Use assignment_5;

SELECT * FROM department_dataset
limit 10;
SELECT * FROM employee_dataset
limit 10;
SELECT * FROM sales_dataset
limit 10;


Q.1- Retrieve the names of employees who earn more than the average salary of all employees.
SELECT name
FROM employee_dataset
WHERE salary > (SELECT AVG(salary) FROM employee_dataset);

Q.2- Find the employees who belong to the department with the highest average salary.
SELECT e.name
FROM employee_dataset e
WHERE e.department_id = (
    SELECT department_id
    FROM employee_dataset
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1);

Q.3 - List all employees who have made at least one sale

SELECT e.emp_id, e.name
FROM employee_dataset e
WHERE e.emp_id IN (SELECT DISTINCT emp_id
    FROM sales_dataset);
    
Q.4- Find the employee with the highest sale amount

SELECT e.emp_id, e.name, s.sale_amount
FROM employee_dataset e
JOIN sales_dataset s
ON e.emp_id = s.emp_id
WHERE s.sale_amount = (SELECT MAX(sale_amount) FROM sales_dataset);

Q.5- Retrieve the names of employees whose salaries are higher than Shubham’s salary.

SELECT name , salary
from employee_dataset
WHERE salary > (
SELECT max(salary)
from employee_dataset
where name = "Shubham")

Q.6- Find employees who work in the same department as Abhishek

SELECT name
FROM employee_dataset
WHERE department_id = (
    SELECT department_id
    FROM employee_dataset
    WHERE name = 'Abhishek');
    
Q.7-List departments that have at least one employee earning more than ₹60,000.

SELECT DISTINCT d.department_name
FROM department_dataset d
JOIN employee_dataset e
ON d.department_id = e.department_id
WHERE d.department_id IN (
    SELECT department_id
    FROM employee_dataset
    WHERE salary > 60000);
 
 Q.8- Find the department name of the employee who made the highest sale.

SELECT department_name
FROM department_dataset
WHERE department_id IN (
    SELECT e.department_id
    FROM employee_dataset e
    JOIN sales_dataset s
    ON e.emp_id = s.emp_id
    WHERE s.sale_amount = (
        SELECT MAX(sale_amount)
        FROM sales_dataset));
        
Q.9- Retrieve employees who have made sales greater than the average sale amount.

SELECT distinct e.name
from employee_dataset e join sales_dataset s
on e.emp_id = s.emp_id
where sale_amount > (
SELECT avg(sale_amount)
from sales_dataset)

Q.10 - Find the total sales made by employees who earn more than the average salary.

SELECT sum(s.sale_amount) AS total_sales, e.name
from sales_dataset s join employee_dataset e
on s.emp_id = e.emp_id
WHERE s.emp_id IN (
SELECT emp_id 
from employee_dataset
where salary > (
SELECT avg(salary)
from employee_dataset))
group by e.name

Q.11- Find employees who have not made any sales.
SELECT name
FROM employee_dataset
WHERE emp_id NOT IN (
    SELECT emp_id
    FROM sales_dataset);
    
Q.12- List departments where the average salary is above ₹55,000.
select department_name 
from department_dataset 
where department_id IN (
select department_id
from employee_dataset
group by department_id
Having avg(salary) > 55000)

Q.13- Retrieve department names where the total sales exceed ₹10,000

SELECT department_name
FROM department_dataset
WHERE department_id IN (
    SELECT e.department_id
    FROM employee_dataset e
    JOIN sales_dataset s
    ON e.emp_id = s.emp_id
    GROUP BY e.department_id
    HAVING SUM(s.sale_amount) > 10000);
    
Q.14 Find the employee who has made the second-highest sale.

SELECT e.name, s.sale_amount
FROM employee_dataset e JOIN sales_dataset s
ON e.emp_id = s.emp_id
WHERE s.sale_amount = (
    SELECT MAX(sale_amount)
    FROM sales_dataset
    WHERE sale_amount < (
        SELECT MAX(sale_amount)
        FROM sales_dataset));

Q.15- Retrieve the names of employees whose salary is greater than the highest sale amount recorded.

SELECT name
FROM employee_dataset
WHERE salary > (
    SELECT MAX(sale_amount)
    FROM sales_dataset);






