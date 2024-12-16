

with customers as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_customers"
),
customer_orders as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."customer_orders"
),
customer_payments as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."customer_payments"
),
final as (
    select
        customers.customer_id,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value
    from customers
    left join customer_orders on customers.customer_id = customer_orders.customer_id
    left join customer_payments on customers.customer_id = customer_payments.customer_id
)
select * from final