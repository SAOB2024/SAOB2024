USE classicmodels;

SELECT * FROM customers;


SELECT customerName, city FROM customers;

SELECT DISTINCT city FROM customers;

SELECT * FROM customers WHERE city = 'London';

SELECT * FROM products WHERE buyPrice < 20;

SELECT * FROM orders WHERE customerNumber = 103;

SELECT * FROM employees WHERE department = 'Sales';

SELECT * FROM customers WHERE city = 'London' OR city = 'Paris';

SELECT  * FROM products WHERE buyPrice BETWEEN 10 AND 30;

SELECT * FROM orders WHERE orderDate BETWEEN '2003-05-20' AND '2004-12-07';

SELECT COUNT(*) FROM customers;

SELECT AVG(buyPrice) FROM products;

SELECT SUM(quantityOrdered) FROM orderdetails;

SELECT MAX(buyPrice) FROM products;

SELECT MIN(buyPrice) FROM products;

SELECT COUNT(*) FROM customers WHERE city = 'London';

SELECT AVG(buyPrice) FROM products WHERE productLine = 'Classic Cars';

SELECT SUM(quantityOrdered) FROM orderdetails WHERE orderNumber = 10106;

SELECT MAX(buyPrice) FROM products WHERE productLine = 'Trucks and Buses';

SELECT MIN(buyPrice) FROM products WHERE productLine = 'Vintage Cars';

SELECT orderNumber, (quantityOrdered * priceEach) as Total_Price FROM orderdetails;

SELECT orderNumber, SUM(quantityOrdered * priceEach) as Total_Price FROM orderdetails GROUP BY orderNumber;

SELECT orderNumber, SUM(quantityOrdered * priceEach) as Total_Price FROM orderdetails GROUP BY orderNumber HAVING Total_price > 60000;

SELECT productName, MSRP, (MSRP - 0.1 * MSRP) as discountedprice FROM products;

SELECT departmentid, SUM(salary) FROM employees GROUP BY departmentid;

SELECT firstname, EXTRACT(YEAR FROM BirthDate) as dob, EXTRACT(YEAR FROM CURRENT_DATE()) AS currentyear, EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM BirthDate) as Age FROM Employees

/* INTERMEDIATE */

SELECT customerNumber, COUNT(orderNumber) as total_orders FROM orders GROUP BY customerNumber;


SELECT customerNumber, SUM(amount) as Total_amount FROM payments GROUP BY customerNumber;

SELECT customerNumber, ROUND(AVG(amount),2) AS Total_avg_amount FROM payments GROUP BY customerNumber;

SELECT productCode, SUM(quantityOrdered) AS total_quantity FROM orderdetails GROUP BY productCode;

SELECT customerNumber, COUNT(orderNumber) as total_ordered FROM orders GROUP BY customerNumber HAVING total_ordered > 5;


SELECT 
    productCode, SUM(quantityOrdered) AS total_quantity
FROM
    orderdetails
GROUP BY productCode
HAVING total_quantity > 1000
ORDER BY total_quantity DESC;

SELECT 
    customerNumber, SUM(amount) AS total_payment
FROM
    payments
GROUP BY customerNumber
HAVING total_payment > 50000
ORDER BY total_payment desc;

SELECT 
    productLine, ROUND(AVG(MSRP),2) AS avg_price
FROM
    products
GROUP BY productLine
HAVING avg_price > 50
ORDER BY avg_price DESC;

SELECT salesRepEmployeeNumber, COUNT(customerNumber) as total_customers from customers GROUP BY salesRepEmployeeNumber HAVING total_customers > 5;

SELECT customerNumber, SUM(amount) as total_amount FROM payments GROUP BY customerNumber HAVING total_amount > 100000 ORDER BY total_amount DESC;

SELECT productCode, SUM(quantityOrdered) AS total_quantity FROM orderdetails GROUP BY productCode HAVING total_quantity BETWEEN 500 AND 2000 ORDER BY total_quantity DESC;

SELECT orderNumber, COUNT(*) as order_count FROM orderdetails GROUP BY orderNumber HAVING order_count > 10 ORDER BY order_count DESC;

SELECT customerNumber, AVG(amount) as avg_amount FROM payments GROUP BY customerNumber HAVING avg_amount > 5000 ORDER BY avg_amount DESC;

SELECT 
    productLine,
    SUM(quantityInStock) AS total_quantity,
    AVG(quantityInStock) AS avg_quantity
FROM
    products
GROUP BY productLine
HAVING total_quantity > 10000
    AND avg_quantity > 50
    ORDER BY avg_quantity DESC;


