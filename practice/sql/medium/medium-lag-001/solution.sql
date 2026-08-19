-- Xom Data · Last month's revenue next to each month
-- Problem: https://xomdata.com/practice/medium-lag-001
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
select month, revenue,
    lag(revenue, 1) over (order by month) as prev_revenue
from monthly_revenue
order by month
