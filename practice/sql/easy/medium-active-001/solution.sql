-- Xom Data · Monthly store visit rhythm
-- Problem: https://xomdata.com/practice/medium-active-001
-- Solved: 2026-08-20

with m as (
    select customer_id, strftime('%Y-%m', order_date) as month
    from orders
)

select month, count(distinct customer_id) as active_customers
from m
group by month
