{{
    config(materialized='table')
}}
WITH items AS (
    SELECT * FROM {{ ref('raw_items') }}
) SELECT 
    id AS item_id,
    order_id,
    sku AS item_sku
FROM items