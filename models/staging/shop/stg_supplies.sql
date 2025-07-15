WITH supplies AS (
    SELECT * FROM {{ source('gcs_sources', 'raw_supplies') }}
) SELECT
    id AS supply_id,
    name AS supply_name,
    cost AS supply_cost,
    perishable,
    sku AS product_sku
FROM supplies