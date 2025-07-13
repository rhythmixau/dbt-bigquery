WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
), orders AS (
    SELECT DISTINCT order_id, customer_id, order_date, order_total FROM {{ ref('stg_orders') }}
), mod_customers AS (
SELECT DISTINCT c.customer_id, 
    TRIM(REPLACE(REPLACE(REPLACE(customer_name, 'Mr.', ''), 'Dr.', ''), 'MD', '')) AS full_name,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS most_recent_order_date,
    COUNT(o.order_id) AS num_of_orders,
    SUM(o.order_total)/100 AS lifetime_value
FROM customers c 
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, full_name
)
SELECT customer_id,
    SPLIT(full_name, ' ')[OFFSET(0)] AS first_name,
    SPLIT(full_name, ' ')[OFFSET(1)] AS last_name,
    first_order_date,
    most_recent_order_date,
    COALESCE(num_of_orders, 0) AS number_of_orders,
    lifetime_value
FROM mod_customers