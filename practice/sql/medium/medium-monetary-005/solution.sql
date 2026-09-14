-- Xom Data · Each Customer's Slice of Revenue
-- Problem: https://xomdata.com/practice/medium-monetary-005
-- Solved: 2026-09-14

select customer_id,
    sum(amount) as total_spent,
    round(1.0 * sum(amount) / (select sum(amount) from orders) * 100, 2) as revenue_share_pct
from orders
group by customer_id
order by revenue_share_pct desc, customer_id
