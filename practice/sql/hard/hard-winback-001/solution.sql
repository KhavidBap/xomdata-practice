-- Xom Data · Those who returned after two months of silence
-- Problem: https://xomdata.com/practice/hard-winback-001
-- Solved: 2026-09-18

with history as (
    select customer_id, order_date, order_id,
        lag(order_date, 1) over (partition by customer_id order by order_date, order_id) as prev_order_date
    from orders
)

select customer_id, order_date, julianday(order_date) - julianday(prev_order_date) as gap_days
from history
where prev_order_date is not null and julianday(order_date) - julianday(prev_order_date) >= 60
