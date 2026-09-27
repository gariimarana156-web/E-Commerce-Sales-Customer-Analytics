SELECT
    c.customer_name,
    SUM(od.sales) AS total_revenue,
    CASE
        WHEN SUM(od.sales) >= 100000 THEN 'High Value'
        WHEN SUM(od.sales) >= 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY c.customer_name
ORDER BY total_revenue DESC;
