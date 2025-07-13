WITH products AS (
    SELECT * FROM {{ ref('raw_products') }}
) SELECT
    sku AS product_sku,
    name AS product_name,
    type AS product_type,
    price AS product_price,
    description AS product_description
FROM products