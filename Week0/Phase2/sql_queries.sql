-- First Query (Total order amount for each customer)
SELECT customer_id, SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY customer_id;


-- Second Query 
SELECT customer_id, SUM(order_amount) AS total_order_amount
FROM orders
GROUP BY customer_id
ORDER BY total_order_amount DESC
LIMIT 3;


-- Third Query (Customers with no orders)
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- Fourth Query (City-wise total revenue)
SELECT c.city, SUM(o.order_amount) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city;


-- Fifth Query(Average order amount per customer)
SELECT customer_id, AVG(order_amount) AS avg_order_val
FROM orders
GROUP BY customer_id;

-- Sixth Query(Customers with more than one order)
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Seventh Query(Sort customers by total spend descending)
SELECT customer_id, SUM(order_amount) AS total_spend
FROM orders
GROUP BY customer_id
ORDER BY total_spend DESC;

