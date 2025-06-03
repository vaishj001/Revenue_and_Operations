-- 02_cost_allocation.sql
-- Should-cost model: price + freight, grouped by product category

WITH item_costs AS (
    SELECT
        oi.product_id,
        pr.product_category_name,
        oi.price,
        oi.freight_value
    FROM order_items oi
    JOIN products pr ON oi.product_id = pr.product_id
),

category_costs AS (
    SELECT
        ct.product_category_name_english AS category,
        ROUND(AVG(ic.price), 2) AS avg_price,
        ROUND(AVG(ic.freight_value), 2) AS avg_freight,
        COUNT(*) AS order_volume
    FROM item_costs ic
    JOIN category_translation ct ON ic.product_category_name = ct.product_category_name
    GROUP BY ct.product_category_name_english
    HAVING order_volume > 100
)

SELECT
    category,
    avg_price,
    avg_freight,
    ROUND(avg_price + avg_freight, 2) AS should_cost,
    order_volume
FROM category_costs
ORDER BY should_cost DESC
LIMIT 10;
