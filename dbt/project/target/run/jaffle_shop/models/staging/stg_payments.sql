
  
    

    create table "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_payments__dbt_tmp"
      
      
    as (
      

with source as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."raw_payments"
),
payment as (

    select
        id as payment_id,
        order_id,
        payment_method,
        amount / 100 as amount
    from source
)
select * from payment
    );

  