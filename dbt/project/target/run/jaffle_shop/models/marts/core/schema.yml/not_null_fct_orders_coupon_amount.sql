select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select coupon_amount
from "jaffle_shop_iceberg"."jaffle_shop_sc"."fct_orders"
where coupon_amount is null



      
    ) dbt_internal_test