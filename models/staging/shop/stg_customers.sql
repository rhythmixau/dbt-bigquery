SELECT 
    id AS customer_id,
    name AS customer_name
FROM {{ source('gcs_sources', 'raw_customers') }}