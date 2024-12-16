select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select order_id
from "jaffle_shop_iceberg"."jaffle_shop_sc"."fct_orders"
where order_id is null



      
    ) dbt_internal_test