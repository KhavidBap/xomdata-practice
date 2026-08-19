-- Xom Data · Change versus last month
-- Problem: https://xomdata.com/practice/medium-lag-002
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
select month, revenue,
    revenue - lag(revenue, 1) over (order by month) as mom_change
from monthly_revenue
order by month
