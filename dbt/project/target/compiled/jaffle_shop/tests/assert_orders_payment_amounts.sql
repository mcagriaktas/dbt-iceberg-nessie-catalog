select *
from "jaffle_shop_iceberg"."jaffle_shop_sc"."fct_orders"
where amount != (
    credit_card_amount + 
    coupon_amount + 
    bank_transfer_amount + 
    gift_card_amount
)