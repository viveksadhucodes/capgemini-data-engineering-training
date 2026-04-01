-- Data Selection & Filtering
SELECT  city as Native from customers
where age >21 ;

-- 2. Aggregations
SELECT customer_id, SUM(amount) as total_spent
FROM orders
WHERE amount > 2000
GROUP BY customer_id;

-- 3. Joining Tables
SELECT o.order_id, c.customer_name, o.amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
