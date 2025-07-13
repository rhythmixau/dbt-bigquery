WITH stores AS (
    SELECT * FROM {{ source('gcs_sources', 'raw_stores') }}
) SELECT
    id AS store_id,
    name AS store_name,
    opened_at,
    tax_rate
FROM stores