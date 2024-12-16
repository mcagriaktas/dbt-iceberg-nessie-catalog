{{ config(
    materialized='table',
    format='iceberg',
    partition_by=['order_date']
) }}


with source as (
    select * from {{ ref('raw_orders') }}
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
