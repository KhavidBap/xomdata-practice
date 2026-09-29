-- Xom Data · Assigning customers to the right care segment
-- Problem: https://xomdata.com/practice/hard-rfm-002
-- Solved: 2026-09-29

with filtered as (
    select customer_id, julianday('2024-06-30') - julianday(max(order_date)) as days_since,
        count(order_id) as order_count
    from orders
    group by customer_id
)

select *,
    case when days_since <= 60 and order_count >= 3 then 'Champions'
    when order_count >= 3 then 'At Risk'
    when days_since <= 60 then 'Promising'
    else 'Hibernating' end as segment
from filtered
