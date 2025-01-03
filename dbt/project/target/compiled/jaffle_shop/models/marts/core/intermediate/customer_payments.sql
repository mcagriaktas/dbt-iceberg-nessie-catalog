

with payments as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_payments"
),
orders as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_orders"
),
final as (
    select
        orders.customer_id,
        sum(amount) as total_amount
    from payments
    left join orders using (order_id)
    group by 1
)
select * from final