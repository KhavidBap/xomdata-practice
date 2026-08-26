-- Xom Data · Three-month rolling average revenue
-- Problem: https://xomdata.com/practice/medium-rolling-001
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
select month, revenue, 
    case when id = 1 then revenue
    when id = 2 then round(1.0 * (revenue + lag(revenue, 1) over (order by month)) / 2, 2) 
    else round(1.0 * (revenue + lag(revenue, 1) over (order by month) + lag(revenue, 2) over (order by month)) / 3, 2) end as avg_3m
from shop_revenue
