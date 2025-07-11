{{
    config(materialized='table')
}}
WITH orders AS (
    SELECT * FROM {{ ref('raw_orders') }}
) SELECT 	
    id AS order_id,
    customer AS customer_id,
    ordered_at AS order_date,
    store_id,
    subtotal,
    tax_paid,
    order_total
FROM orders