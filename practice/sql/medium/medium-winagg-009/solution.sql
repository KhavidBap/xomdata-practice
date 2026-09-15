-- Xom Data · Each category's slice of revenue
-- Problem: https://xomdata.com/practice/medium-winagg-009
-- Solved: 2026-09-15

-- Write your SQL here
select category,
    sum(amount) as total_revenue,   
    round(1.0 * sum(amount) / (select sum(amount) from sales) * 100, 2) as pct_share
from sales
group by category
order by total_revenue desc, category
