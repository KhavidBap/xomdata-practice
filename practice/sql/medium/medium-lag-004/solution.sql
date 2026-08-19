-- Xom Data · Trend labels for the monthly report
-- Problem: https://xomdata.com/practice/medium-lag-004
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with prev as (
    select month, revenue,
        revenue - lag(revenue, 1) over (order by month) as prev_revenue
    from monthly_revenue
)

select month, revenue, 
    case when prev_revenue is null then "First"
    when prev_revenue = 0 then "Flat"
    when prev_revenue < 0 then "Down"
    else "Up" end as trend
from prev
