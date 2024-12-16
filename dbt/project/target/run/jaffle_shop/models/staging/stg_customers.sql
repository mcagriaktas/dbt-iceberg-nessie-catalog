
  
    

    create table "jaffle_shop_iceberg"."jaffle_shop_sc"."stg_customers__dbt_tmp"
      
      
    as (
      



with source as (
    select * from "jaffle_shop_iceberg"."jaffle_shop_sc"."raw_customers"
),
customer as (
    select
        id as customer_id,
        first_name,
        last_name,
        email
    from source
)
select * from customer
    );

  