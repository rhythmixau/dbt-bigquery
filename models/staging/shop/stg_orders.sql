SELECT 	
    id AS order_id,
    customer AS customer_id,
    ordered_at AS order_date,
    store_id,
    subtotal,
    tax_paid,
    order_total
FROM {{ source('gcs_sources', 'raw_orders') }}
WHERE order_total > 0