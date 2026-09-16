-- Xom Data · A Picture of Engagement Distribution
-- Problem: https://xomdata.com/practice/medium-frequency-004
-- Solved: 2026-09-16

with filtered as (
    select customer_id, count(order_id) as orders_count
    from orders
    group by customer_id
), unioned as (
    select '1 order' as engagement_bucket, count(customer_id) as customer_count from filtered
    where orders_count = 1
    union all
    select '2 orders' as engagement_bucket, count(customer_id) as customer_count from filtered
    where orders_count = 2
    union all
    select '3+ orders' as engagement_bucket, count(customer_id) as customer_count from filtered
    where orders_count > 2
)

select * from unioned
where customer_count != 0
