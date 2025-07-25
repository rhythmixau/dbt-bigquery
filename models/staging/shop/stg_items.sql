WITH items AS (
    SELECT * FROM {{ source('gcs_sources', 'raw_items') }}
) SELECT 
    id AS item_id,
    order_id,
    sku AS item_sku
FROM items