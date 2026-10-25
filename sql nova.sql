CREATE DATABASE shop_db;
USE shop_db;
SELECT * FROM master LIMIT 5;

SHOW COLUMNS FROM master;

SELECT region, SUM(revenue) AS total_revenue
FROM master
GROUP BY region
ORDER BY total_revenue DESC;


select customer_name , sum(revenue)as total_spend
from master
group by customer_name
order by total_spend Desc
limit 10;

SELECT order_year, order_month, SUM(revenue) AS monthly_revenue
FROM master
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

SELECT category, AVG(is_returned) AS return_rate, COUNT(*) AS total_items
FROM master
GROUP BY category
ORDER BY return_rate DESC;


SELECT * FROM master WHERE category IS NULL;

SELECT customer_id, customer_name, MAX(order_date) AS last_order_date
FROM master
GROUP BY customer_id, customer_name
HAVING MAX(order_date) < DATE_SUB(CURDATE(), INTERVAL 90 DAY)
ORDER BY last_order_date;

SELECT c.customer_name, COUNT(DISTINCT o.order_id) AS order_count, SUM(m.revenue) AS total_spend
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN master m ON o.order_id = m.order_id
GROUP BY c.customer_name
ORDER BY total_spend DESC
LIMIT 10;


