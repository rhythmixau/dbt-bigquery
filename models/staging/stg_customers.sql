{{
    config(materialized='table')
}}
WITH customers AS (
    SELECT * FROM {{ ref('raw_customers') }}
)
SELECT 
    id AS customer_id,
    name AS customer_name
FROM customers