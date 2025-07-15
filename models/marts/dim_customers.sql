WITH customers AS (
    SELECT customer_id, customer_name FROM {{ ref('stg_customers') }}
), mod_customers AS (
SELECT DISTINCT c.customer_id, 
    TRIM(REPLACE(REPLACE(REPLACE(customer_name, 'Mr.', ''), 'Dr.', ''), 'MD', '')) AS full_name
FROM customers c
)
SELECT customer_id,
    SPLIT(full_name, ' ')[OFFSET(0)] AS first_name,
    SPLIT(full_name, ' ')[OFFSET(1)] AS last_name
FROM mod_customers