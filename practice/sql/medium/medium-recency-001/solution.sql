-- Xom Data · How Long Since a Customer Last Returned
-- Problem: https://xomdata.com/practice/medium-recency-001
-- Solved: 2026-08-20

with last_order as (
    select customer_id, max(order_date) as last_order_date
    from orders
    group by customer_id
)

select customer_id, last_order_date,
    julianday('2024-06-30') - julianday(last_order_date) as days_since
from last_order
order by days_since, customer_id
