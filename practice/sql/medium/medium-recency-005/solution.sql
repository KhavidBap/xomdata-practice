-- Xom Data · Which Channel Is Keeping Its Warmth
-- Problem: https://xomdata.com/practice/medium-recency-005
-- Solved: 2026-09-15

with joined as (
    select orders.customer_id, channel,
        julianday('2024-06-30') - julianday(max(order_date)) as days_silent
    from orders
    join customers on customers.customer_id = orders.customer_id
    group by orders.customer_id
)

select channel,
    count(customer_id) as customers,
    round(avg(days_silent), 2) as avg_days_silent
from joined
group by channel
order by avg_days_silent, channel
