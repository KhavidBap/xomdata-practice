-- Xom Data · What share of customers does the shop retain
-- Problem: https://xomdata.com/practice/medium-repeat-002
-- Solved: 2026-09-10

with grouped as (
    select customer_id, count(order_id) as cnt
    from orders
    group by customer_id
)

select round(1.0 * sum(case when cnt >= 2 then 1 else 0 end) / count(*) * 100, 2) as repeat_rate_pct
from grouped
