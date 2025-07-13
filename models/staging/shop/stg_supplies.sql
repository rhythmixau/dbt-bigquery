WITH supplies AS (
    SELECT * FROM {{ source('gcs_sources', 'raw_supplies') }}
) SELECT
    id AS product_id,
    name AS product_name,
    cost AS product_cost,
    perishable,
    sku AS product_sku
FROM supplies