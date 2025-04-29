CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount FLOAT,
    product_id INT
);


INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-15', 200.00, 101),
(2, '2024-01-25', 150.00, 102),
(3, '2024-02-10', 300.00, 103),
(4, '2024-02-18', 250.00, 101),
(5, '2024-03-05', 100.00, 104),
(6, '2024-03-20', 350.00, 102),
(7, '2024-04-01', 400.00, 105),
(8, '2024-04-17', 150.00, 103),
(9, '2024-04-30', 200.00, 104);

*** 1. Extract Month from order_date***

SELECT order_id,order_date,EXTRACT(MONTH FROM order_date) AS month FROM online_sales;



*** Group by Year and Month***

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*) AS total_orders
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);


*** Use SUM() for Revenue***
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);


**Use COUNT(DISTINCT order_id) for Volume***
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

***Use ORDER BY for Sorting**

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    year, month;

*** Limit Results for Specific Time Periods***

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
WHERE 
    order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY 
    year, month;

