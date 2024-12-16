
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "jaffle_shop_iceberg"."jaffle_shop_sc"."dim_customers"
where customer_id is not null
group by customer_id
having count(*) > 1

