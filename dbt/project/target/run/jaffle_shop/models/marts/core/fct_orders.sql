
  
    

    create table "jaffle_shop_iceberg"."jaffle_shop_sc"."fct_orders__dbt_tmp"
      
      
    as (
      


with orders as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_orders"
),
order_payments as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."order_payments"
),
final as (
    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        order_payments.credit_card_amount,
        order_payments.coupon_amount,
        order_payments.bank_transfer_amount,
        order_payments.gift_card_amount,
        order_payments.total_amount as amount
    from orders
    left join order_payments on orders.order_id = order_payments.order_id
)
select * from final
    );

  