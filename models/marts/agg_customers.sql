WITH customers AS (
    SELECT customer_id, first_name, last_name FROM {{ ref('dim_customers') }}
), orders AS (
    SELECT DISTINCT order_id, customer_id, order_date, order_total FROM {{ ref('stg_orders') }}
), mod_customers AS (
SELECT DISTINCT c.customer_id, 
    c.first_name,
    c.last_name,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS most_recent_order_date,
    COUNT(o.order_id) AS num_of_orders,
    SUM(o.order_total)/100 AS lifetime_value
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, first_name, last_name
)
SELECT customer_id,
    first_name,
    last_name,
    first_order_date,
    most_recent_order_date,
    COALESCE(num_of_orders, 0) AS number_of_orders,
    lifetime_value
FROM mod_customers