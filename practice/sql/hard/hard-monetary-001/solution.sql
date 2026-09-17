-- Xom Data · Splitting customers into five spend tiers
-- Problem: https://xomdata.com/practice/hard-monetary-001
-- Solved: 2026-09-17

with groupped as (
    select customer_id, sum(amount) as total_spent
    from orders
    group by customer_id
)

select customer_id, total_spent,
    ntile(5) over (order by total_spent desc, customer_id) as spend_rank
from groupped
order by spend_rank, customer_id
