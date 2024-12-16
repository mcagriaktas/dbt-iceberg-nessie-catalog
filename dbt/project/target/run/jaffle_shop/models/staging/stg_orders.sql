
  
    

    create table "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_orders__dbt_tmp"
      
      
    as (
      


with source as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."raw_orders"
),
orders as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source
)
select * from orders
    );

  