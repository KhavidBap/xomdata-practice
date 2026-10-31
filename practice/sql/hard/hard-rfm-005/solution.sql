-- Xom Data · Scoring fairly when multiple customers are tied
-- Problem: https://xomdata.com/practice/hard-rfm-005
-- Solved: 2026-10-31

with total as (
    select customer_id, sum(amount) as total_spent
    from orders
    group by customer_id
), ranked as (
    select customer_id, total_spent,
        rank() over (order by total_spent desc) as rn,
        count(*) over () as n
    from total
)

select customer_id, total_spent,
    case when n = 1 then 5
    when (rn - 1)::numeric / (n - 1) < 0.2 then 5
    when (rn - 1)::numeric / (n - 1) < 0.4 then 4
    when (rn - 1)::numeric / (n - 1) < 0.6 then 3
    when (rn - 1)::numeric / (n - 1) < 0.8 then 2
    else 1 end as m_score
from ranked
