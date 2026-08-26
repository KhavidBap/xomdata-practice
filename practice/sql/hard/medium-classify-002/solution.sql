-- Xom Data · Spending hierarchy within each channel
-- Problem: https://xomdata.com/practice/medium-classify-002
-- Solved: 2026-08-26

with grouped as (
    select customer_id, sum(amount) as total_spent
    from orders
    group by customer_id
)

select c.channel, g.customer_id, g.total_spent,
    dense_rank() over (partition by c.channel order by g.total_spent desc) as rank_in_channel
from customers c
join grouped g on g.customer_id = c.customer_id
