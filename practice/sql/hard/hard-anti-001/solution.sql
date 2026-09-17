-- Xom Data · Customers silent for 90 days
-- Problem: https://xomdata.com/practice/hard-anti-001
-- Solved: 2026-09-17

with filtered as (
    select user_id, max(order_date) as last_order_date,
        (select max(order_date) from orders) as last_date
    from orders
    group by user_id
)

select user_id, last_order_date,
    julianday(last_date) - julianday(last_order_date) as days_since_last
from filtered
where julianday(last_date) - julianday(last_order_date) >= 90
order by days_since_last desc, user_id
