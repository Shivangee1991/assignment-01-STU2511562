-- Active: 1773601536617@@127.0.0.1@3306@mysql
-- Q1: List all customers along with the total number of orders they have placed

SELECT 
    c.name, 
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('part5-datalake/customers.csv') AS c
LEFT JOIN read_json_auto('part5-datalake/orders.json') AS o 
    ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Apply the same 'part5-datalake/' prefix to Q2, Q3, and Q4
-- Q2: Find the top 3 customers by total order value
SELECT 
    c.name, 
    SUM(o.total_amount) AS total_value
FROM read_csv_auto('part5-datalake/customers.csv') AS c
JOIN read_json_auto('part5-datalake/orders.json') AS o 
    ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_value DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
-- Note: This assumes a 'product_id' exists in orders.json to link to the parquet file
SELECT DISTINCT 
    p.product_name
FROM read_csv_auto('part5-datalake/customers.csv') AS c
JOIN read_json_auto('part5-datalake/orders.json') AS o ON c.customer_id = o.customer_id
JOIN read_parquet('part5-datalake/products.parquet') AS p ON o.order_id = p.order_id
WHERE c.city = 'Bangalore';
-- Q4: Join all three files to show: customer name, order date, product name, and quantity
SELECT 
    c.name AS customer_name, 
    o.order_date, 
    p.product_name, 
    o.num_items AS quantity
FROM read_csv_auto('part5-datalake/customers.csv') AS c
JOIN read_json_auto('part5-datalake/orders.json') AS o ON c.customer_id = o.customer_id
JOIN read_parquet('part5-datalake/products.parquet') AS p ON o.order_id = p.order_id;