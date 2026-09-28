-- Xom Data · YoY and QoQ sales growth
-- Problem: https://xomdata.com/practice/hard-yoy-001
-- Solved: 2026-09-28

select year, quarter, revenue,
    lag(revenue) over (order by year, quarter) as prev_quarter_revenue,
    lag(revenue, 4) over (order by year, quarter) as prev_year_revenue,
    round(1.0 * (revenue - lag(revenue) over (order by year, quarter)) / lag(revenue) over (order by year, quarter) * 100, 2) as qoq_pct,
    round(1.0 * (revenue - lag(revenue, 4) over (order by year, quarter)) / lag(revenue, 4) over (order by year, quarter) * 100, 2) as yoy_pct
from quarterly_sales
order by year, quarter
