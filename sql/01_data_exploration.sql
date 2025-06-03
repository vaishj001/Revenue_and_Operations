-- 01_data_exploration.sql
-- Monthly customer spend and order frequency summary

WITH customer_orders AS (
    SELECT
        o.customer_id,
        strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
        COUNT(DISTINCT o.order_id) AS order_count,
        SUM(p.payment_value) AS total_spend
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY o.customer_id, order_month
)

SELECT
    c.customer_unique_id,
    co.order_month,
    SUM(co.order_count) AS total_orders,
    SUM(co.total_spend) AS total_spend,
    ROUND(AVG(co.total_spend * 1.0 / co.order_count), 2) AS avg_order_value
FROM customer_orders co
JOIN customers c ON co.customer_id = c.customer_id
GROUP BY c.customer_unique_id, co.order_month
ORDER BY co.order_month, total_spend DESC;
