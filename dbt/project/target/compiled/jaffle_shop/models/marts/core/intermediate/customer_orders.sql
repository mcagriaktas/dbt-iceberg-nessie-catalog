

with orders as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_orders"
),
final as (
    select
        customer_id,
        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from orders
    group by 1
)
select * from final