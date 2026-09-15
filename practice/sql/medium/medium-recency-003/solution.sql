-- Xom Data · Customer Freshness Leaderboard
-- Problem: https://xomdata.com/practice/medium-recency-003
-- Solved: 2026-09-15

with last_order as (
    select customer_id, max(order_date) as last_order_date
    from orders
    group by customer_id
)

select *,
    rank() over (order by last_order_date desc) as freshness_rank
from last_order
