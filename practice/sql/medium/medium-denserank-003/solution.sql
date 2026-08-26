-- Xom Data · Spending tiers of loyal customers
-- Problem: https://xomdata.com/practice/medium-denserank-003
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
with grouped as (
    select customer_name, sum(amount) as total_spent
    from purchases
    group by customer_name
)

select customer_name, total_spent, dense_rank() over (order by total_spent desc) as spend_tier
from grouped
order by spend_tier, customer_name
