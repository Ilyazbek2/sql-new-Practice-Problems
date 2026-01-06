SELECT 
    c.customer_id,
    c.name,
    c.country,
    COALESCE(SUM(oi.quantity * oi.price), 0) AS total_spent,
    CASE
        WHEN COALESCE(SUM(oi.quantity * oi.price), 0) < 500 THEN 'Bronze'
        WHEN COALESCE(SUM(oi.quantity * oi.price), 0) BETWEEN 500 AND 2000 THEN 'Silver'
        ELSE 'Gold'
    END AS customer_level
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name, c.country;
