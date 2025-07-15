with orders as (
    select * from {{ ref('stg_orders') }}
)
select order_id, SUM(order_total) as order_total
from orders
group by order_id
having order_total <= 0