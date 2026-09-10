-- Xom Data · The Silence Between Two Consecutive Purchases
-- Problem: https://xomdata.com/practice/medium-gap-001
-- Solved: 2026-09-10

with grouped as (
    select customer_id, order_date,
        lag(order_date, 1) over (partition by customer_id order by order_date) as prev_date
    from orders
)

select customer_id, order_date, julianday(order_date) - julianday(prev_date) as days_since_prev
from grouped
where prev_date is not null
