{{ config(
    materialized='table',
    format='iceberg'
) }}

with source as (
    select * from {{ ref('raw_payments') }}
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
